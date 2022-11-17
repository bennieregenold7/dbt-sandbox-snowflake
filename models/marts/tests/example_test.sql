select *
from {{ ref('customer_distinct_orders') }}
where
    1=2