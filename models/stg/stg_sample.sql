select *
from {{ ref('customer_distinct_orders') }}