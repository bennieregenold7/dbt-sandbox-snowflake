{# this is an example of some documentation for a singular test #}

{{
    config(
        tags=['test']
    )
}}

select *
from {{ ref('customer_distinct_orders') }}
where
    'true'='false'