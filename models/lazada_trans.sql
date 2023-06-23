{{ config(materialized='table') }}
with lazada as (select * from {{ref('lazada_')}} ),

orderdate as 
(select order_id, 
min(order_datetime) as order_datetime,
max(order_datetime) as last_datetime  
from {{ref('lazada_status')}} 
group by order_id
),

status as (select * from {{ref('lazada_status')}} )

select 
lazada.*, orderdate.order_datetime, 
status.status
from lazada 
left join orderdate on lazada.order_id = orderdate.order_id 
left join status on  lazada.order_id = status.order_id and orderdate.last_datetime = status.order_datetime 