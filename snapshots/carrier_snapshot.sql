{% snapshot carrier_snapshot %}

 {{
     config(
       target_database='DEV_GLUNDE',
       target_schema='RAW_FLUGMODELL',
       unique_key="code||'|'||description",

       strategy='check',
       check_cols=['code','description'],
       invalidate_hard_deletes=True,
     )
}}

select * from {{ ref('snapshot') }}

{% endsnapshot %}