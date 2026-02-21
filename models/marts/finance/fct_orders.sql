{{ config(materialized='table') }}

with orders as (

    select *
    from {{ ref('stg_jaffle_shop__orders') }}

),

payments as (

    select *
    from {{ ref('stg_stripe__payments') }}

)

select
    o.order_id,
    o.customer_id,
    coalesce(sum(p.amount), 0) as amount

from orders o
left join payments p
    on o.order_id = p.order_id

group by 1,2