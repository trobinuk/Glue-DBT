{{
    config(
        {
            "materialized": 'table',
            "schema": 'MART'
        }
    )
}}

WITH country_details_oceania AS 
(
SELECT *
FROM {{ref('country_details_transform')}}
WHERE country_continent_name = 'Oceania'
)
SELECT *
FROM country_details_oceania