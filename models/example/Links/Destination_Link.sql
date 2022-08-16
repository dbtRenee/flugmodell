select distinct 
 {{dbt_utils.surrogate_key (
    'DEST',
    'FLIGHT_NUMBER_MARKETING_AIRLINE', 
    'FLIGHTDATE',
    'IATA_CODE_MARKETING_AIRLINE', 
    'ORIGIN' ,
    'DEST' 
    )}} as Destination_Link_HK,
    {{dbt_utils.surrogate_key (
    'ORIGIN',
    'FLIGHT_NUMBER_MARKETING_AIRLINE', 
    'FLIGHTDATE',
    'IATA_CODE_MARKETING_AIRLINE', 
    'DEST' 
    )}} as FLIGHT_HK,
    {{dbt_utils.surrogate_key (
    'DEST' 
    )}} as AIRPORT_HK,
   'PSA_Ontime' as Record_Source,
    cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
from DEV_GLUNDE.RAW_FLUGMODELL.PSA_ONTIME



