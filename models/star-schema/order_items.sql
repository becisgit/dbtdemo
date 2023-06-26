select * from {{ref('shopee_trans')}}
union all 
select * from {{ref('lazada_trans')}}