{% macro test_run() %}

    {# Provide a list of commands to run #}
    {% set statements_to_run_list = [
        'create table development.dbt_bregenold.test1 (id int)', 
        'create table development.dbt_bregenold.test2 (id int)'
        ] 
    %}

    {# Join each list element into a string, and separate them with a semi-colon #}
    {% set statements_to_run %}
    {{ statements_to_run_list|join(';') }}
    {% endset %}

    {{ dbt_utils.log_info("Statements to run: " ~ statements_to_run) }}

    {# Run the commands #}
    {% if execute %}
    {{ run_query(statements_to_run) }}
    {{ dbt_utils.log_info("Commands executed.") }}
    {% endif %}

{% endmacro %}