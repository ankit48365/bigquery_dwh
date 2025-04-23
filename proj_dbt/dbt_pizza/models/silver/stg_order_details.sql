
-- {{ config(materialized='view') }}
-- {{ config(materialized='incremental') }}
{{ config(materialized='table') }}



SELECT order_details_id, order_id, 
UPPER(pizza_id) AS pizza_id, 
quantity,
CURRENT_DATE() AS dbt_DateCreated, 
CURRENT_TIME() AS dbt_TimeCreated

FROM {{ source('src_pizza', 'order_details') }}
-- {% if is_incremental() %}
-- where order_details_id > (select max(order_details_id) from {{this}})
-- {% endif %}
