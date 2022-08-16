select distinct 
 {{dbt_utils.surrogate_key (
    'IATA_CODE_MARKETING_AIRLINE',
    'FLIGHT_NUMBER_MARKETING_AIRLINE', 
    'FLIGHTDATE', 
    'ORIGIN', 
    'DEST' ,
    'IATA_CODE_MARKETING_AIRLINE'
    )}} as Flight2Carrier_HK,
    {{dbt_utils.surrogate_key (
    'IATA_CODE_MARKETING_AIRLINE', 
    'FLIGHT_NUMBER_MARKETING_AIRLINE', 
    'FLIGHTDATE', 
    'ORIGIN', 
    'DEST' 
    )}} as FLIGHT_HK,
    {{dbt_utils.surrogate_key (
    'IATA_CODE_MARKETING_AIRLINE'
    )}} as CARRIER_HK,
   'PSA_Ontime' as Record_Source,
    cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
from DEV_GLUNDE.RAW_FLUGMODELL.PSA_ONTIME



