{% macro source_names() %}

    {% set failing_sources = [] -%}

    {% if execute %}
        {% for node in graph.sources.values() -%}
            {% if node.database != node.database | upper %}
                {{ failing_sources.append(node.database) }}
            {% endif %}
        {%- endfor %}

        {% for failure in failing_sources %}
            {{ log(failure, true ) }}
        {% endfor %}
    {% endif %}


    
{% endmacro %}