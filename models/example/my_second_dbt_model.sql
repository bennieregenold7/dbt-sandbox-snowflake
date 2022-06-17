
-- Use the `ref` function to select from other models

with t1 as (
    select *
    from {{ ref('my_first_dbt_model') }}
    where id = 1

    union 

    select *
    from {{ ref('my_unrelated_model') }}
)

select * from t1