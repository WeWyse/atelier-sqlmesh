AUDIT (
  name audit_enriched_orders_revenue,
  dialect bigquery
);

SELECT *
FROM sqlmesh_example.enriched_orders_with_macro_and_audit
WHERE total_revenue <= 0 OR customer_id IS NULL

