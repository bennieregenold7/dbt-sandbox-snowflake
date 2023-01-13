{{
    config(
        materialized = 'table'
    )
}}

with 

source as (
    select *
    from {{ source('jaffle_shop', 'customers') }}
),

renamed as (
    select
        null as customer_id,
        first_name,
        last_name,
        '{{ var("some_date") }}'::timestamp as field
    from source
)

select *
from renamed