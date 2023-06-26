with complete_filter 
as (select * from {{ref('order_completion_time')}} where {{ completed_time_gt(0) }} and {{not_cancelled()}})--cancelled_timestamp is null)

select avg(completed_timestamp-paid_timestamp) as average_overall,
avg(case when order_id like '%S%' then completed_timestamp-paid_timestamp end) as shopee,
avg(case when order_id like '%L%' then completed_timestamp-paid_timestamp end) as lazada

from complete_filter
