select distinct {{dbt_utils.surrogate_key (
    'code',
)}} as CARRIER_HK,
code as Carrier_Code,
'PSA_CARRIER' as Record_Source,
cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
from DEV_GLUNDE.RAW_FLUGMODELL.PSA_CARRIER
UNION ALL
select distinct {{dbt_utils.surrogate_key (
    'IATA_CODE_MARKETING_AIRLINE'
)}} as CARRIER_HK,
IATA_CODE_MARKETING_AIRLINE as Carrier_Code,
'PSA_ONTIME' as Record_Source,
cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
from DEV_GLUNDE.RAW_FLUGMODELL.PSA_ONTIME
WHERE IATA_CODE_MARKETING_AIRLINE NOT IN (SELECT code FROM DEV_GLUNDE.RAW_FLUGMODELL.PSA_CARRIER)