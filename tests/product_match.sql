select order_id, customer, s.sku, shop
from {{ ref("shopee_") }} s
left join {{ ref("product_") }} p on s.sku = p.sku
where shop <> brand
