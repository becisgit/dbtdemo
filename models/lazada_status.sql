{{ config(materialized='table') }}
select distinct
status,
 cast('L'||order_id as varchar(256)) as order_id,
 cast(order_date||' '||right('0'||order_time,8) as datetime) as order_datetime 
 from dev.public.lazada