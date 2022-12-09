{% macro get_node_schemas() %}

    {% set search_string = 'customer_distinct_orders' %}

    {% if execute %}

        {% set all_nodes = {} %}


        {# This gets information for all models #}
        {% for node in graph.nodes.values()
            | selectattr("resource_type", "equalto", "model") %}

            {% do all_nodes.update({node.name: node.schema}) %}

        {% endfor %}

        {# This gets information for all sources #}
        {% for source in graph.sources.values() -%}

            {% do all_nodes.update({source.name: source.schema}) %}

        {% endfor %}

        {{ log(all_nodes, true) }}

        {{ log(all_nodes[search_string], true) }}

    {% endif %}

{% endmacro %}