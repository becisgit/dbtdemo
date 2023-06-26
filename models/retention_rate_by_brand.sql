{% set brands = ['Pawsitively Pawesome Pet Supplies',
'Snickerdoodle Snacks ''n'' Wagtails',
'Glam-O-Rama',
'Munchie Mania',
'Crave-a-Licious',
'BeautyBliss'
] %}



with tb as (select brand, order_datetime, customer_id--status.order_id, order_datetime
 from {{ref('status')}} 
left join {{ref('order_items')}} on status.order_id =  order_items.order_id
left join {{ref('product_')}} on product_id = sku
where status = 'paid' and source is not null)


select brand,
sum(case when week_12 >0 and week_34 >0 then 1 else 0 end) customer_last2weeks,
(case when sum(case when week_12 >0 then 1 else 0 end) =0 then 0 else  sum(case when week_12 >0 then 1 else 0 end) end) customer_first2weeks,
cast(sum(case when week_12 >0 and week_34 >0 then 1 else 0 end) as float)/cast((case when sum(case when week_12 >0 then 1 else 0 end) =0 then 0.000000000000001 else  sum(case when week_12 >0 then 1 else 0 end) end) as float) as retention_rate
 from (
select brand, customer_id,sum(case when order_datetime between '2023-06-01' and '2023-06-16' then 1 end) as week_12,
sum(case when order_datetime between '2023-06-17' and '2023-07-02' then 1 end) as week_34
from tb group by brand, customer_id  ) group by brand