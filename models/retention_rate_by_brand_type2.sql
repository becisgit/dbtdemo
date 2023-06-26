with tb as (select brand, customer_id,count(distinct order_items.order_id) as count_order,
case when count(distinct order_items.order_id)>1 then 1 else 0 end as multiple_purchase,
1 as row
--status.order_id, order_datetime
 from {{ref('status')}} 
left join {{ref('order_items')}} on status.order_id =  order_items.order_id
left join {{ref('product_')}} on product_id = sku
where status = 'paid' and source is not null
group by brand, customer_id)


select brand,cast( sum(multiple_purchase) as float)/cast(sum(row) as float) as retention_rate from tb group by brand