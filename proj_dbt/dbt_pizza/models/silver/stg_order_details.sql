-- {{ config(materialized='view') }}
-- {{ config(materialized='incremental') }}
{{ config(materialized='table') }}


SELECT
    order_details_id,
    order_id,
    quantity,
    UPPER(pizza_id) AS pizza_id,
    CURRENT_DATE() AS dbt_datecreated,
    CURRENT_TIME() AS dbt_timecreated

FROM {{ source('src_pizza', 'order_details') }}
-- {% if is_incremental() %}
-- where order_details_id > (select max(order_details_id) from {{ this }})
-- {% endif %}
