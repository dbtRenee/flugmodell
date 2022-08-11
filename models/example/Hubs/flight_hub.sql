select
  ID,
  FLIGHT_AIRLINE_CODE,
  FLIGHT_NUMBER,
  FLIGHT_DATE,
  ORIGIN,
  DESTINATION,
  'stg_flight' as Record_source,
  {{dbt_utils.current_timestamp()}} as LOAD_DATE

 from stg_flight