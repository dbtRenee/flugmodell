select {{dbt_utils.surrogate_key (
    'TAIL_NUMBER', 
)}} as PLANE_HK,
TAIL_NUMBER as Tail_Number,
'PSA_ONTIME' as Record_Source,
cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
from DEV_GLUNDE.RAW_FLUGMODELL.PSA_ONTIME