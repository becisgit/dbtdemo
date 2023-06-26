{% set status_group = ["paid", "processing", "completed","cancelled"] %}


select
    order_id,
    {% for status in status_group %}
    max(case when status = '{{status}}' then order_datetime end) 
    as {{status}}_timestamp,
    {% endfor %}
    max(order_datetime) as endtimestamp
from  {{ref('status')}}

group by order_id
