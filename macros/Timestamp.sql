{% macro snowflake__current_timestamp_in_utc() %}
    convert_timezone('Europe/Berlin', {{dbt_utils.current_timestamp()}})
{% endmacro %}