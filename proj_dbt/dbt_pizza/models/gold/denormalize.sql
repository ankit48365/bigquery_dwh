
{{ config(materialized='table') }}

SELECT 
o.order_id as order_id, 
o.date as date, 
o.time as time,
o.datetime_timestamp as dtimestamp,

od.order_details_id as order_details_id, 
p.pizza_id as pizza_id, 
pt.pizza_type_id as pizza_type_id, 
pt.name as name, 
pt.category as category, 
pt.ingredients as ingredients, 
od.quantity as quantity, 
p.size as size, 
p.price as price,
p.price * od.quantity as bill_amount,
CURRENT_DATE() AS dbt_DateCreated, 
CURRENT_TIME() AS dbt_TimeCreated
FROM 
    {{ ref('stg_orders') }} o
JOIN 
    {{ ref('stg_order_details') }} od 
ON 
    o.order_id = od.order_id
JOIN 
    {{ ref('stg_pizzas') }} p
ON 
    od.pizza_id = p.pizza_id
JOIN 
    {{ ref('stg_pizza_types') }} pt
ON 
    p.pizza_type_id = pt.pizza_type_id