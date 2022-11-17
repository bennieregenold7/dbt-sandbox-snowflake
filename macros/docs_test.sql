{% macro docs_test() %}

    {% if execute %}
        {% set query = run_query('select count(*) from dbt_bregenold.stg_jaffle_shop__customers') %}
        {% set value_to_return = query.columns[0].values()%}
        {% set return_string = 'The number of values is: '~value_to_return %}

        {{ log('This is a log: ' ~ return_string, True) }}

        {{ return(return_string) }}
    {% endif %}
    
{% endmacro %}