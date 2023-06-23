{{ config(materialized='table') }}
with shopee as (select * from {{ref('shopee_')}} ),

orderdate as 
(select order_id, 
min(order_datetime) as order_datetime,
max(order_datetime) as last_datetime  
from {{ref('shopee_status_')}} 
group by order_id
),

status as (select * from {{ref('shopee_status_')}} )

select 
cast(shopee.order_id as varchar(256)) order_id,
cast(customer as varchar)  as customer_id,
cast(sku as varchar) as product_id,
quantity as qty,
shop as brand_shop,
original_price,
discount,
cast(0 as real) tax,
orderdate.order_datetime, 
status.status,
 'shopee' as source
from shopee 
left join orderdate on shopee.order_id = orderdate.order_id 
left join status on  shopee.order_id = status.order_id and orderdate.last_datetime = status.order_datetime

