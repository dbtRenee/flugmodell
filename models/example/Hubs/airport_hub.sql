select
  ID,
  AIRPORT_CODE,
  'stg_airport' as Record_source,
  {{dbt_utils.current_timestamp()}} as LOAD_DATE

 from stg_airport