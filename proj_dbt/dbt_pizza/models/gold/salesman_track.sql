{{ config(materialized='table') }}

SELECT
    s.salesman_id,
    s.name,
    s.salary,
    DATE_TRUNC(d.date, MONTH) AS year_month,
    SUM(d.bill_amount) AS profit
FROM
    {{ ref('denormalize') }} AS d
INNER JOIN
    {{ ref('stg_salesman') }} AS s
    ON
        d.fk_salesman = s.salesman_id
GROUP BY
    s.salesman_id, s.name, DATE_TRUNC(d.date, MONTH), s.salary
ORDER BY
    year_month ASC, profit DESC

--salesman_track.sql
-- This model tracks the performance of salesmen over time, aggregating their profits by month.
-- It joins the denormalized sales data with the salesmen information
