{{ config(materialized='table') }}
SELECT location_name, count(*) as location_count, CURRENT_DATE() AS dbt_DateCreated,
  CAST(CURRENT_TIME() AS STRING) AS dbt_TimeCreated
 FROM {{ ref('stg_account') }} GROUP BY location_name

/*
    Uncomment the line below to remove records with null `id` values
*/
-- pocloadaccount.load.
-- where id is not null
