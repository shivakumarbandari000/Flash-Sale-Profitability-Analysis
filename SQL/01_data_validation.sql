                                         -- DATA VALIDATION  (SANITY CHECK)

-- Revenue, cost, profit should obey basic business rules
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN total_revenue = 0 AND quantity_sold > 0 THEN 1 ELSE 0 END) AS zero_revenue_orders,
    SUM(CASE WHEN total_cost < 0 THEN 1 ELSE 0 END) AS negative_cost_rows
FROM livo;

-- Inspect impossible profit rows (profit > revenue for non-returns)
SELECT *
FROM livo
WHERE profit > total_revenue
  AND is_return = 0;

-- Returns should show negative revenue and profit at an aggregate level
SELECT
    is_return,
    COUNT(*) AS orders,
    SUM(total_revenue) AS revenue,
    SUM(profit) AS profit
FROM livo
GROUP BY is_return;

-- Check range and missing values
SELECT
    MIN(discount_percent) AS min_discount,
    MAX(discount_percent) AS max_discount,
    SUM(CASE WHEN discount_percent IS NULL THEN 1 ELSE 0 END) AS null_discounts
FROM livo;

-- Inspect rows with NULL discount values
SELECT *
FROM livo
WHERE discount_percent IS NULL;

-- Orders where unit cost exceeds unit price
SELECT
    SUM(CASE WHEN unit_price < unit_cost THEN 1 ELSE 0 END) AS loss_making_unit_orders
FROM livo;

-- Used to assess data trustworthiness
SELECT
    order_id,
    COUNT(*) AS occurrences
FROM livo
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;


