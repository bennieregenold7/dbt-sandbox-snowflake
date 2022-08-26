{% macro grant_select() %}

    {% set transformer_role = env_var('DBT_TRANSFORMER_ROLE') %}
    {% set analyst_role = env_var('DBT_ANALYST_ROLE') %}

    {% if target.name == 'default' %}
        {{ return([transformer_role, analyst_role]) }}
    {% else %}
        {{ return([transformer_role, analyst_role]) }}
    {% endif %}


{% endmacro %}