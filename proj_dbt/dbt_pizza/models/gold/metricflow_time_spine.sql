{{ config(materialized='table') }}


with days as (

    {{
        dbt.date_spine('day',"PARSE_DATE('%m/%d/%Y', '01/01/2023')",
            "PARSE_DATE('%m/%d/%Y', '01/01/2026')"
        )
    }}),

final as (
    select cast(date_day as date) as date_day
    from days
)

select * from final
