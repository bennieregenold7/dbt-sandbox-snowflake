{% macro return_value(mat) %}
    
    {% if execute %}

        {#
        {% set qry = 'select \'table\' as return_col' %}
        {% set qry_results = run_query(qry) %}
        {% set return_column = qry_results.columns[0].values() %}
        {{ log('Log: ' ~ return_column[0], True) }}

        {{ return(return_column[0]) }}
        #}

       {% set mat_dict = {1: 'table', 2: 'view'} %}
       {{ log('Log: '~ mat_dict[mat], True) }}
       {{ return(mat_dict[mat]) }}

    {% endif %}

{% endmacro %}