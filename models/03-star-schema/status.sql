{{ config(materialized='table') }}
with
    cust_1 as (select * from {{ ref("shopee_status_") }}),

    cust_2 as (select * from {{ ref("lazada_status") }})

select * from
    (
        select *
        from cust_1
                union all
        select *
        from cust_2
    )
