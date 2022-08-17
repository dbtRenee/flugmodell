{% docs flight_hub_table_events %}

Table: FLIGHT_HUB

Source table: PSA_ONTIME

Target table: FLIGHT_HUB

Aus Rohdaten wird der FLIGHT_HUB erstellt. FLIGHT_HK ist ein kombinierter generierter MD5-Hash aus IATA_CODE_MARKETING_AIRLINE, 
FLIGHT_NUMBER_MARKETING_AIRLINE, FLIGHTDATE, ORIGIN, DEST.

{% enddocs %}