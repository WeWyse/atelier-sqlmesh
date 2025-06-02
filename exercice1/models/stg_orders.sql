MODEL (
  name sqlmesh_example.stg_orders,
  kind SEED (
    path '../seeds/stg_orders.csv'
  ),
  columns (
    order_id INTEGER,
    customer_id INTEGER,
    order_date DATE   
  )
);
