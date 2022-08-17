{% snapshot carrier_sat_snapshot_ref %}
--läuft 2-mal
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

select * from {{ ref('carrier_satellite') }}

{% endsnapshot %}