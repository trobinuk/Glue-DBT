{{
    config(
        {
            "materialized": 'table',
            "schema": 'MART'
        }
    )
}}

WITH country_details_europe AS 
(
SELECT *
FROM {{ ref('country_details_transform') }}
WHERE country_continent_name = 'Europe'
)
SELECT *
FROM country_details_europe