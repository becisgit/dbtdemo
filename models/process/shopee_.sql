{{ config(materialized='table') }}
select *,'shopee' as source from dev.public.shopee where original_price>=0