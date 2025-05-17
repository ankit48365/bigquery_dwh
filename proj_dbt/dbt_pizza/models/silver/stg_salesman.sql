-- {{ config(materialized='view') }}
{{ config(materialized='table') }}


SELECT
    salesman_id,
    salary,
    UPPER(name) AS name,
    UPPER(title) AS title,
    CURRENT_DATE() AS dbt_datecreated,
    CURRENT_TIME() AS dbt_timecreated

FROM {{ source('src_pizza', 'salesman') }}


-- {% if target.name == 'test' %}
-- where pizza_type_id in ('bbq_ckn','big_meat','brie_carre','calabrese','cali_ckn','ckn_alfredo','ckn_pesto','classic_dlx','five_cheese')
-- {% endif %}

