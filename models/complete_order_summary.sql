select order_items.order_id, 
brand,
sum(original_price * (1-discount)) as revenue_total,
count(distinct order_items.order_id) as completed_orders, 
--sum(original_price)/count(distinct order_items.order_id) as average_revenue_per_brand, 
sum(qty) completed_qty
--cast(sum(qty)as float) /cast(count(distinct order_items.order_id) as float) as average_qty
from 
{{ref('order_items')}} left join 
{{ref('product_')}} on order_items.product_id = product_.sku
left join {{ref('order_completion_time')}} on order_completion_time.order_id = order_items.order_id
where  {{n_cancelled()}} and {{completed_time_gt(0)}}
group by order_items.order_id,brand

