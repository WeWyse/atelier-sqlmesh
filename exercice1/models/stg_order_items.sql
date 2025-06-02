MODEL (
  name sqlmesh_example.stg_order_items,
  kind SEED (
    path '../seeds/stg_order_items.csv'
  ),
  columns (
    order_id INTEGER,
    item_name STRING,
    quantity INTEGER,
    price FLOAT   
  )
);
