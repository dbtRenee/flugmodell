select {{dbt_utils.surrogate_key (
    'IATA_CODE_MARKETING_AIRLINE', 
    'FLIGHT_NUMBER_MARKETING_AIRLINE', 
    'FLIGHTDATE', 
    'ORIGIN', 
    'DEST' 
)}} as FLIGHT_HK,
IATA_CODE_MARKETING_AIRLINE as FLIGHT_AIRLINE_CODE,
FLIGHT_NUMBER_MARKETING_AIRLINE as FLIGHT_NUMBER,
FLIGHTDATE as FLIGHT_DATE,
ORIGIN as ORIGIN, 
DEST as DESTINATION,
'PSA_ONETIME' as Record_Source,
cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
from DEV_GLUNDE.RAW_FLUGMODELL.PSA_ONTIME

-- UNION
-- select
-- code as FLIGHT_AIRLINE_CODE,
-- FLIGHT_NUMBER_MARKETING_AIRLINE as FLIGHT_NUMBER,
-- FLIGHTDATE as FLIGHT_DATE,
-- ORIGIN as ORIGIN, 
-- DEST as DESTINATION,
-- 'PSA_CARRIER' as Record_Source,
-- cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
-- from DEV_GLUNDE.RAW_FLUGMODELL.PSA_ONTIME
-- WHERE FLIGHT_AIRLINE_CODE NOT IN (SELECT code FROM DEV_GLUNDE.RAW_FLUGMODELL.PSA_carrier)