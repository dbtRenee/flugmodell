select {{dbt_utils.surrogate_key (
    'interface_run_id',
    'code'
)}} as AIRPORT_HK,
code as AIRPORT_Code,
'PSA_AIRPORT' as Record_Source,
cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
from DEV_GLUNDE.RAW_FLUGMODELL.PSA_AIRPORT