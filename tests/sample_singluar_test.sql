{# this is an example of some documentation for a singular test #}

{{
    config(
        tags=['test']
    )
}}

select *
from {{ ref('src_jaffle_shop') }}
where
    1=2