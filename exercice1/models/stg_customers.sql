MODEL (
  name sqlmesh_example.stg_customers,
  kind SEED (
    path '../seeds/stg_customers.csv'
  ),
  columns (
    id INTEGER,
    name STRING   
  ),
);
