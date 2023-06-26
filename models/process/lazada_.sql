{{ config(materialized='table') }}
with tb as (select 
cast(customer_id as varchar) customer_id,
cast(product_id as varchar) product_id,
quantity as qty,
brand as brand_shop,
paid_price as original_price,
discount,
cast(tax as real) tax,

 cast('L'||order_id as varchar(256)) as order_id
 from {{ref('lazada_data')}})

 select  'lazada' as source,order_id,brand_shop,cast(customer_id as varchar) customer_id,product_id,
 avg(qty) as qty, avg(discount) as discount, avg(tax) as tax, avg(original_price) as original_price
  from tb 
 group by source,order_id,brand_shop,customer_id,product_id