with

customers as (
    select * from {{ ref('stg_jaffle_shop__customers') }}
),

orders as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
),

customer_order_cnt as (
    select
        customer_id,
        count(distinct order_id) as order_cnt
    from orders
    group by
        customer_id
),

final as (
    select
        customers.customer_id,
        coalesce(customer_order_cnt.order_cnt, 0) as dist_order_cnt
    from customers
        left join customer_order_cnt on 
            customers.customer_id = customer_order_cnt.customer_id
)

select *
from final