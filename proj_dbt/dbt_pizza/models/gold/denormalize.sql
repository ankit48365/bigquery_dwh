{{ config(materialized='table') }}

SELECT
    o.order_id,
    o.date,
    o.time,
    o.fk_salesman,
    o.datetime_timestamp,
    od.order_details_id,
    p.pizza_id,
    pt.pizza_type_id,
    pt.name,
    pt.category,
    pt.ingredients,
    od.quantity,
    p.size,
    p.price,
    p.price * od.quantity AS bill_amount,
    CURRENT_DATE() AS dbt_datecreated,
    CURRENT_TIME() AS dbt_timecreated
FROM
    {{ ref('stg_orders') }} AS o
INNER JOIN
    {{ ref('stg_order_details') }} AS od
    ON
        o.order_id = od.order_id
INNER JOIN
    {{ ref('stg_pizzas') }} AS p
    ON
        od.pizza_id = p.pizza_id
INNER JOIN
    {{ ref('stg_pizza_types') }} AS pt
    ON
        p.pizza_type_id = pt.pizza_type_id
-- JOIN 
--     {{ ref('stg_salesman') }} sm
-- ON 
--     o.fk_salesman = sm.salesman_id
