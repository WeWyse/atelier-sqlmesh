-- models/enriched_orders.sql
MODEL (
  name sqlmesh_example.enriched_orders
);

SELECT
  o.order_id,
  o.order_date,
  c.name AS customer_name,
  c.id AS customer_id,
  SUM(i.quantity * i.price) AS total_revenue
FROM sqlmesh_example.stg_orders o
JOIN sqlmesh_example.stg_customers c ON o.customer_id = c.id
JOIN sqlmesh_example.stg_order_items i ON o.order_id = i.order_id
GROUP BY o.order_id, o.order_date, c.name, c.id;
