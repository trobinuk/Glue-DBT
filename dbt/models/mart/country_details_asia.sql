{{
    config(
        {
            "materialized": 'table',
            "schema": 'MART'
        }
    )
}}

WITH country_details_asia AS 
(
SELECT *
FROM {{ref('country_details_transform')}}
WHERE country_continent_name = 'Asia'
)
SELECT *
FROM country_details_asia