-- models/my_first_dbt_model.sql
{{ config(materialized='table') }}

-- Simple table with guaranteed non-null IDs
with base as (
    select 1 as id
    union all
    select 2 as id
    union all
    select 3 as id
)

select *
from base