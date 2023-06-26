select brand,
sum(revenue_total) as revenue_total,
sum(revenue_total) / sum(completed_orders) as average_revenue,
sum(completed_qty) as completed_qty,
cast(sum(completed_qty) as float) / cast(sum(completed_orders) as float) as average_qty,
sum(completed_timestamp - paid_timestamp)  / sum(completed_orders) as average_complete_time
 from {{ref('complete_order_summary')}}
left join {{ref('order_completion_time')}} on order_completion_time.order_id = complete_order_summary.order_id
group by brand
