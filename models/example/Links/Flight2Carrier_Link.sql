select FLIGHT_HK,
   'FLIGHT_Hub' as Record_Source,
    cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
from {{ ref('flight_hub')}}

select FLIGHT_HK,
   'FLIGHT_Hub' as Record_Source,
    cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
from {{ ref('flight_hub')}}
--UNION ALL
--select 
   -- CARRIER_HK as Carrier_id,
   -- 'Carrier_Hub' as Record_Source,
   -- cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
--from DEV_GLUNDE.dbt_Flugmodell.CARRIER_Hub
