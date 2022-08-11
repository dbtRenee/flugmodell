select 
    AP.ID as AIRPORT_ID,
    CA.ID as flight_ID,
    'stg_airport, stg_carrier' as Record_source,
  {{dbt_utils.current_timestamp()}} as LOAD_DATE
   from airport_hub as AP, flight_hub as CA


