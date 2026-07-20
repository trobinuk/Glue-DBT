{{
    config(
        {
            "materialized": 'table',
            "schema": 'MART'
        }
    )
}}

WITH country_details_antarctica AS 
(
SELECT *
FROM {{ref('country_details_transform')}}
WHERE country_continent_name = 'Antarctica'
)
SELECT *
FROM country_details_antarctica

