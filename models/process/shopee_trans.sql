{{ config(materialized='table') }}
with shopee as (select * from {{ref('shopee_')}} ),

orderdate as 
(select order_id, 
min(order_datetime) as order_datetime,
max(order_datetime) as last_datetime  
from {{ref('shopee_status_')}} 
group by order_id
),

status as 
(select order_id,
 case when count(1)>0 then 'yes' else 'no' end as cancel from {{ref('shopee_status_')}} where status = 'cancelled' 
group by order_id ),
status_close as 
(select order_id,
 case when count(1)>0 then 'yes' else 'no' end as completed from {{ref('shopee_status_')}} where status = 'completed' 
group by order_id )



--(select * from {{ref('shopee_status_')}} )

select 
'shopee' as source,
cast(shopee.order_id as varchar(256)) order_id,
--shop as brand_shop,
cast(customer as varchar)  as customer_id,
cast(sku as varchar) as product_id,
quantity as qty,
discount,
cast(0 as real) tax,
original_price,
--orderdate.order_datetime, 
status.cancel,completed
from shopee 
left join orderdate on shopee.order_id = orderdate.order_id 
left join status on  shopee.order_id = status.order_id
left join status_close on  shopee.order_id = status_close.order_id-- and orderdate.last_datetime = status.order_datetime

