{{ config(materialized='table') }}
select order_id, 
case when status = 'new' then 'paid' 
when status = 'ready to ship' then 'processing' 
when status = 'delivered' then 'completed' else 'cancelled' end
as status
,cast(date||' '||right('0'||order_time,8) as datetime) order_datetime from dev.public.shopee_status