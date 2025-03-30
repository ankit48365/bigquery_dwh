{{ config(materialized='table') }}
SELECT *, CURRENT_DATE() AS dbt_DateCreated,
  CAST(CURRENT_TIME() AS STRING) AS dbt_TimeCreated
 FROM {{ source('load','account') }}

/*
    Uncomment the line below to remove records with null `id` values
*/
-- pocloadaccount.load.
-- where id is not null
