{{ config(materialized='table') }}
with lazada as (select * from {{ref('lazada_')}} ),

orderdate as 
(select order_id, 
min(order_datetime) as order_datetime,
max(order_datetime) as last_datetime  
from {{ref('lazada_status')}} 
group by order_id
),

status as (select order_id, case when count(1)>0 then 'yes' else 'no' end as cancel from {{ref('lazada_status')}} where status = 'cancelled' group by order_id ),

status_close as 
(select order_id,
 case when count(1)>0 then 'yes' else 'no' end as completed from {{ref('lazada_status')}} where status = 'completed' 
group by order_id )

select 
source,
lazada.order_id,
--brand_shop,
customer_id,
product_id,
qty,
discount,
tax,
original_price,
--orderdate.order_datetime, 
status.cancel,completed
from  {{ref('lazada_')}} lazada 
--left join orderdate on lazada.order_id = orderdate.order_id 
left join status on  lazada.order_id = status.order_id 
left join status_close on  lazada.order_id = status_close.order_id
--and orderdate.last_datetime = status.order_datetime 