SHOW INTEGRATIONS;

CREATE OR REPLACE DATABASE gluedb;

CREATE OR REPLACE STORAGE INTEGRATION glue_dbt_integartion
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = 'S3'
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::919010206785:role/snowflake-s3-role'
STORAGE_ALLOWED_LOCATIONS = ('s3://rtamil-dbt-glue-project/data/');

DESC INTEGRATION glue_dbt_integartion;

CREATE OR REPLACE STAGE gluedb.public.glue_s3_stage
STORAGE_INTEGRATION = glue_dbt_integartion
URL = 's3://rtamil-dbt-glue-project/data/'

ls @gluedb.public.glue_s3_stage;

CREATE OR REPLACE TABLE gluedb.public.COUNTRY_DETAILS_CP
(
DATA VARIANT
);

TRUNCATE

SELECT
$1
FROM @gluedb.public.glue_s3_stage

SELECT
        f.value AS source_data
    FROM @gluedb.public.glue_s3_stage t,
    LATERAL FLATTEN(input => t.$1) f


SELECT *
FROM gluedb.public_raw.country_details_raw;

drop schema public_raw;

SELECT * FROM country_details_transform limit 20;

select distinct country_continent_name from country_details_transform;

select *
from country_details_transform
where country_continent_name = 'Antarctica'

select *
from country_details_transform
where country_continent_name = 'North America'

select *
from country_details_transform
where country_continent_name = 'Oceania'

select *
from country_details_transform
where country_continent_name = 'South America'

select *
from country_details_transform
where country_continent_name = 'Europe'

select *
from country_details_transform
where country_continent_name = 'Africa'

select *
from country_details_transform
where country_continent_name = 'Asia'


select *
from country_details_europe

CREATE OR REPLACE DATABASE gluedb_production;GLUEDB_PRODUCTION.MART.COUNTRY_DETAILS_AFRICA

SELECT COUNT(*)
FROM GLUEDB_PRODUCTION.MART.COUNTRY_DETAILS_ANTARCTICA;
