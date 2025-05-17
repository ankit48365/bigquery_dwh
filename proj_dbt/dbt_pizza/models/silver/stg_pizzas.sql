-- {{ config(materialized='view') }}
{{ config(materialized='table') }}


SELECT
    size,
    price,
    UPPER(pizza_id) AS pizza_id,
    UPPER(pizza_type_id) AS pizza_type_id,
    CURRENT_DATE() AS dbt_datecreated,
    CURRENT_TIME() AS dbt_timecreated

FROM {{ source('src_pizza', 'pizzas') }}


-- {% if target.name == 'test' %}
-- where pizza_type_id in ('bbq_ckn','big_meat','brie_carre','calabrese','cali_ckn','ckn_alfredo','ckn_pesto','classic_dlx','five_cheese')
-- {% endif %}


