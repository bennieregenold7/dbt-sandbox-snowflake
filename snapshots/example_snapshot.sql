{% snapshot example_snapshot %}
    {{
        config(
            unique_key='id',
            strategy='timestamp',
            updated_at='updated_at',
            target_schema='dbt_bregenold',
            target_database='development'
        )
    }}

    select * from development.dbt_bregenold.example_for_snapshot
 {% endsnapshot %}