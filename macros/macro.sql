{% macro completed_time_gt(n) %}
    completed_timestamp > {{ n }}
{% endmacro %}


{% macro not_cancelled() %}
    cancelled_timestamp is null
{% endmacro %}

{% macro n_cancelled() %}
    cancel is null
{% endmacro %}




