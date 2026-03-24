                                               -- EXPLORATORY DATA ANALYSIS
-- Monthly trend
SELECT 
    FORMAT(order_date, 'yyyy-MM') AS month,
    CAST(SUM(total_revenue) AS DECIMAL(18,2)) AS revenue,
    CAST(SUM(profit) AS DECIMAL(18,2)) AS profit,
    CAST(AVG(discount_percent_cleaned) * 100 AS DECIMAL(5,2)) AS avg_discount_pct
FROM livo
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY month;

-- Top revenue months
SELECT 
    FORMAT(order_date, 'yyyy-MM') AS month,
    CAST(SUM(total_revenue) AS DECIMAL(18,2)) AS total_revenue
FROM livo
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY total_revenue DESC;

-- Bottom profit months
SELECT 
    FORMAT(order_date, 'yyyy-MM') AS month,
    CAST(SUM(profit) AS DECIMAL(18,2)) AS profit
FROM livo
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY profit;

-- Observation:
-- Some top revenue months also appear among the lowest profit months
-- ? Revenue illusion confirmed

-- 4. Discount vs profit margin (overall)
WITH discount_buckets AS (
    SELECT
        profit,
        total_revenue,
        discount_percent_cleaned,
        CASE
            WHEN discount_percent_cleaned < 0.10 THEN '0–10%'
            WHEN discount_percent_cleaned < 0.25 THEN '10–25%'
            WHEN discount_percent_cleaned < 0.40 THEN '25–40%'
            ELSE '40%+'
        END AS discount_bucket
    FROM livo
)
SELECT
    discount_bucket,
    COUNT(*) AS orders,
    ROUND(SUM(profit) / NULLIF(SUM(total_revenue), 0) * 100, 2) AS profit_margin_pct
FROM discount_buckets
GROUP BY discount_bucket
ORDER BY MIN(discount_percent_cleaned);

-- 5. Overall segmentation checks
-- At this level, everything looks “normal”

-- Customer segment
SELECT
    customer_segment,
    SUM(total_revenue) AS revenue,
    CAST(SUM(CASE WHEN is_return = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(10,2)) AS return_rate,
    ROUND(SUM(profit) / NULLIF(SUM(total_revenue), 0) * 100, 2) AS profit_margin
FROM livo
GROUP BY customer_segment;

-- Category
SELECT
    category,
    CAST(SUM(total_revenue) AS DECIMAL(10,2)) AS revenue,
    CAST(SUM(CASE WHEN is_return = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(10,2)) AS return_rate,
    ROUND(SUM(profit) / NULLIF(SUM(total_revenue), 0) * 100, 2) AS profit_margin
FROM livo
GROUP BY category;

-- City
SELECT
    store_city,
    CAST(SUM(total_revenue) AS DECIMAL(10,2)) AS revenue,
    CAST(SUM(CASE WHEN is_return = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(10,2)) AS return_rate,
    ROUND(SUM(profit) / NULLIF(SUM(total_revenue), 0) * 100, 2) AS profit_margin
FROM livo
GROUP BY store_city;

