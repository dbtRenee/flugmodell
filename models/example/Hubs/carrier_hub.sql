select
  ID,
  CARRIER_CODE,
  'stg_carrier' as Record_source,
  {{dbt_utils.current_timestamp()}} as LOAD_DATE

 from stg_carrier