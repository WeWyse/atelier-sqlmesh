{% macro calculate_total_revenue(quantity_col, price_col) %}
    SUM({{ quantity_col }} * {{ price_col }})
{% endmacro %}
{% macro extract_day_from_date(date) %}
    EXTRACT(DAY FROM {{ date }})
{% endmacro %}
