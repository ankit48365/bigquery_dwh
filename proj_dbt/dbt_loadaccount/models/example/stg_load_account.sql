{{ config(materialized='table') }}
SELECT * FROM {{ source('load','account') }}

/*
    Uncomment the line below to remove records with null `id` values
*/
-- pocloadaccount.load.
-- where id is not null
