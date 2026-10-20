-- Q20. Find stores with returned-order rate above 5%.
-- The denominator is each store's total order count; the numerator is its returned orders.
SELECT
    s.store_id,
    s.store_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT r.order_id) AS returned_orders,
    ROUND(
        COUNT(DISTINCT r.order_id)
        / NULLIF(COUNT(DISTINCT o.order_id), 0) * 100,
        2
    ) AS returned_order_rate_pct
FROM analyst_retail_practice.orders AS o
LEFT JOIN analyst_retail_practice.returns AS r
    ON r.order_id = o.order_id
JOIN analyst_retail_practice.stores AS s
    ON s.store_id = o.store_id
GROUP BY s.store_id, s.store_name
HAVING returned_order_rate_pct > 5
ORDER BY returned_order_rate_pct DESC;

