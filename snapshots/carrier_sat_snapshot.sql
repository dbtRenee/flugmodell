{% snapshot carrier_sat_snapshot %}
--läuft nur 1-mal
 {{
     config(
       target_database='DEV_GLUNDE',
       target_schema='RAW_FLUGMODELL',
       unique_key="Carrier_Sat_HK",

       strategy='check',
       check_cols=['Carrier_Sat_HK'], 
       invalidate_hard_deletes=True,
     )
}}

select {{dbt_utils.surrogate_key (
    'code',
    'current_timestamp()'
)}} as Carrier_Sat_HK,
code as Carrier_Code,
description as Carrier_Description,
'PSA_CARRIER' as Record_Source,
cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as Load_Date
from DEV_GLUNDE.RAW_FLUGMODELL.PSA_CARRIER

{% endsnapshot %}