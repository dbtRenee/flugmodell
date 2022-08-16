select distinct {{dbt_utils.surrogate_key (
    'code'
)}} as AIRPORT_HK,
code as AIRPORT_Code,
'PSA_AIRPORT' as Record_Source,
cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
from DEV_GLUNDE.RAW_FLUGMODELL.PSA_AIRPORT
UNION ALL
select distinct {{dbt_utils.surrogate_key (
    'origin'
)}} as AIRPORT_HK,
origin as AIRPORT_Code,
'PSA_ONTIME' as Record_Source,
cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
from DEV_GLUNDE.RAW_FLUGMODELL.PSA_ONTIME
WHERE ORIGIN NOT IN (SELECT code FROM DEV_GLUNDE.RAW_FLUGMODELL.PSA_AIRPORT)
UNION ALL
select distinct {{dbt_utils.surrogate_key (
    'DEST'
)}} as AIRPORT_HK,
dest as AIRPORT_Code,
'PSA_ONTIME' as Record_Source,
cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
from DEV_GLUNDE.RAW_FLUGMODELL.PSA_ONTIME
WHERE DEST NOT IN (SELECT code FROM DEV_GLUNDE.RAW_FLUGMODELL.PSA_AIRPORT)