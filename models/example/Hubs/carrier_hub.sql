select row_number() over(order by code) +coalesce((select max(carrier_id) from carrier_hub),0)as carrier_id,
       code as carrier_code,
       'PSA_CARRIER' as record_source,
       cast(convert_timezone('Europe/Berlin', current_timestamp())as timestamp) as LOAD_DATE              
from (select distinct code 
      from DEV_GLUNDE.RAW_FLUGMODELL.PSA_Carrier
      where INTERFACE_RUN_ID = 2) as x
where code not in (select carrier_code from CARRIER_HUB)