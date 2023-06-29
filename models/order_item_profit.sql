select *,  sold_price*(1-discount)/qty as revenue, 
case when round(sold_price*(1-discount)/qty,0) < round(product_price,0) then 'no_profit'
else 'profit' end profit 
from
(select o.order_id, customer_id, product_id, qty,discount,tax, o.original_price as sold_price, p."original price" as product_price, d.paid_timestamp
from {{ref('order_items')}} o
left join {{ref('product_')}} p on product_id = sku
left join {{ref('order_completion_time')}} d on o.order_id = d.order_id
)
order by product_id