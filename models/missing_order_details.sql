select status.order_id, order_datetime from {{ref('status')}} 
left join {{ref('order_items')}} on status.order_id =  order_items.order_id
where status = 'paid' and source is null