{{
    config(
        {
            "materialized": 'table',
            "schema": 'MART'
        }
    )
}}

WITH country_details_south_america AS 
(
SELECT *
FROM {{ref('country_details_transform')}}
WHERE country_continent_name = 'South America'
)
SELECT *
FROM country_details_south_america