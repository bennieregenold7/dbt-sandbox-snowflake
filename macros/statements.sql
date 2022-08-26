{% macro statements() %}
    
    {%- call statement('customers', fetch_result=True) -%}

        insert into development.dbt_bregenold.statement_sample select * from development.jaffle_shop.customers

    {%- endcall -%}

    {%- set customers = load_result('customers') -%}
    {%- set customers_data = customers['data'] -%}
    {% set customers_response = customers['response'] %}

    {{ log(customers_response[[1]], true) }}


{% endmacro %}