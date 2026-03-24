                                                -- FLASH SALE ANALYSIS

-- Monthly performance metrics

WITH monthly_metrics AS (
    SELECT
        FORMAT(order_date, 'yyyy-MM') AS month,
        COUNT(*) AS orders,
        CAST(SUM(total_revenue) AS DECIMAL(18,2)) AS revenue,
        CAST(SUM(profit) AS DECIMAL(18,2)) AS profit,
        CAST(AVG(discount_percent) * 100 AS DECIMAL(5,2)) AS avg_discount_pct,
        CAST(SUM(profit) / NULLIF(SUM(total_revenue), 0) * 100 AS DECIMAL(6,2)) AS margin_pct,
        CAST(SUM(profit) / COUNT(*) AS DECIMAL(10,2)) AS profit_per_order
    FROM livo
    GROUP BY FORMAT(order_date, 'yyyy-MM')
)
SELECT *
FROM monthly_metrics
ORDER BY avg_discount_pct DESC;

-- Define FLASH vs NORMAL months based on discount and margin 

CREATE VIEW classified_sales AS
WITH monthly_classification AS (
    SELECT
        month_year,
        CASE
            WHEN AVG(discount_percent) >= 0.25
             AND (SUM(profit) / NULLIF(SUM(total_revenue), 0)) < 0.15
            THEN 'FLASH'
            ELSE 'NORMAL'
        END AS month_type
    FROM livo
    GROUP BY month_year
)
SELECT
    l.*,
    m.month_type
FROM livo l
LEFT JOIN monthly_classification m
    ON l.month_year = m.month_year;

--#1.By customer segment
SELECT
    month_type,
    customer_segment,
    COUNT(*) AS orders,
    ROUND(SUM(profit) / COUNT(*), 2) AS profit_per_order,
    CAST(SUM(CAST(is_return AS INT)) * 100.0 / COUNT(*) AS DECIMAL(18,2)) AS return_rate_pct
FROM classified_sales
GROUP BY month_type, customer_segment
ORDER BY profit_per_order DESC;

-- #2. Flash vs Normal by category
SELECT
    month_type,
    category,
    COUNT(*) AS orders,
    ROUND(SUM(profit) / COUNT(*), 2) AS profit_per_order,
    CAST(SUM(CAST(is_return AS INT)) * 100.0 / COUNT(*) AS DECIMAL(18,2)) AS return_rate_pct
FROM classified_sales
GROUP BY month_type, category
order by profit_per_order;

-- #3. Flash vs Normal by discount bucket
SELECT
    month_type,
    CASE
        WHEN discount_percent_cleaned < 0.10 THEN '0–10%'
        WHEN discount_percent_cleaned < 0.25 THEN '10–25%'
        WHEN discount_percent_cleaned < 0.40 THEN '25–40%'
        ELSE '40%+'
    END AS discount_bucket,
    COUNT(*) AS orders,
    ROUND(SUM(profit) / COUNT(*), 2) AS profit_per_order,
    CAST(SUM(CAST(is_return AS INT)) * 100.0 / COUNT(*) AS DECIMAL(18,2)) AS return_rate_pct
FROM classified_sales
GROUP BY
    month_type,
    CASE
        WHEN discount_percent_cleaned < 0.10 THEN '0–10%'
        WHEN discount_percent_cleaned < 0.25 THEN '10–25%'
        WHEN discount_percent_cleaned < 0.40 THEN '25–40%'
        ELSE '40%+'
    END
ORDER BY
    month_type,
    MIN(discount_percent_cleaned);

-- #FINAL  Flash vs Normal summary
WITH monthly_classification AS (
    SELECT
        month_year,
        CASE
            WHEN AVG(discount_percent) >= 0.25
             AND (SUM(profit) / NULLIF(SUM(total_revenue), 0)) < 0.15
            THEN 'FLASH'
            ELSE 'NORMAL'
        END AS month_type
    FROM livo
    GROUP BY month_year
),
classified_sales AS (
    SELECT
        l.*,
        m.month_type
    FROM livo l
    LEFT JOIN monthly_classification m
        ON l.month_year = m.month_year
)
SELECT
    month_type,
    CAST(SUM(total_revenue) AS DECIMAL(18,2)) AS revenue,
    CAST(SUM(profit) AS DECIMAL(18,2)) AS profit,
    CAST(AVG(discount_percent) AS DECIMAL(10,2)) AS avg_discount,
    CAST(SUM(profit) / SUM(total_revenue) AS DECIMAL(10,2)) AS margin,
    COUNT(*) AS orders,
    ROUND(SUM(profit) / COUNT(*), 2) AS profit_per_order
FROM classified_sales
GROUP BY month_type;
