with cust_1 as (select distinct cast(customer as varchar) as customer_id from {{ref('shopee_')}} ),

cust_2 as (select distinct cast(customer_id as varchar) as customer_id from {{ref('lazada_')}} )

select distinct customer_id from
(select * from  cust_1 union all select * from cust_2)