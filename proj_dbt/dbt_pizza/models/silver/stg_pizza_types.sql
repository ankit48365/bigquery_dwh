-- {{ config(materialized='view') }}
{{ config(materialized='table') }}


SELECT
    ingredients,
    UPPER(name) AS name,
    UPPER(category) AS category,
    UPPER(pizza_type_id) AS pizza_type_id,

    CURRENT_DATE() AS dbt_datecreated,
    CURRENT_TIME() AS dbt_timecreated

FROM {{ source('src_pizza', 'pizza_types') }}


-- {% if target.name == 'dev' %}
-- where pizza_type_id in ('bbq_ckn','big_meat','brie_carre','calabrese','cali_ckn','ckn_alfredo','ckn_pesto','classic_dlx','five_cheese')
-- -- fetch first 10 rows only
-- {% endif %}
