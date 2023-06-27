{{ config(materialized='table') }}
select order_id,customer,sku,quantity,shop,original_price, {{int_to_percent('discount')}} as discount
,'shopee' as source from dev.public.shopee where original_price>=0