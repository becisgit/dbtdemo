with cust_1 as (select distinct order_id from {{ref('shopee_status_')}} ),

cust_2 as (select order_id from {{ref('lazada_status')}} )

select distinct order_id from
(select * from  cust_1 union all select * from cust_2)