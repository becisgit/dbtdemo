{{ config(materialized='table') }}
with tb as (select distinct
status,
 cast('L'||order_id as varchar(256)) as order_id,
 cast(order_date||' '||right('0'||order_time,8) as datetime) as order_datetime 
 from {{ref('lazada_data')}})

 select status,order_id, min(order_datetime) as order_datetime from tb group by status,order_id