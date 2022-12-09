{% macro log_results(results) %}

    {{ log(results, true) }}

    {{ log('------------------', true) }}

    {% if execute %}
        {{ log(graph, true) }}
    {% endif %}
    
{% endmacro %}