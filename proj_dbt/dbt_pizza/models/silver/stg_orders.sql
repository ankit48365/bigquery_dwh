-- {{ config(materialized='view') }}
-- {{ config(materialized='incremental') }}
{{ config(materialized='table') }}

WITH base_orders AS (
    SELECT
        order_id,
        date,
        time,
        fk_salesman,
        CONCAT(date, ' ', time) AS datetime_column,
        CURRENT_DATE() AS dbt_datecreated,
        CURRENT_TIME() AS dbt_timecreated
    FROM {{ source('src_pizza', 'orders') }}
)

SELECT
    order_id,
    date,
    time,
    fk_salesman,
    dbt_datecreated,
    dbt_timecreated,
    DATETIME(TIMESTAMP(datetime_column), 'America/New_York')
        AS datetime_timestamp
FROM base_orders

-- DATETIME(TIMESTAMP(datetime_column), "America/New_York")
-- CAST(datetime_column AS TIMESTAMP)


-- bigquery in free tier, does not allow incremental load with below error  

-- 13:31:16    Database Error in model stg_orders (models/silver/stg_orders.sql)
--   Billing has not been enabled for this project. Enable billing at 
--    https://console.cloud.google.com/billing. 
--  DML queries are not allowed in the free tier. 
--    Set up a billing account to remove this restriction.
--   compiled code at target/run/dbt_pizza/models/silver/stg_orders.sql


-- {% if is_incremental() %}
-- where order_id > (select max(order_id) from {{ this }})
-- {% endif %}
