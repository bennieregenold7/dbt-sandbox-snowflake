{% macro compiled_sql() %}

{% if execute %}
    {% for node in graph.nodes.values()
        | selectattr("resource_type", "equalto", "model") %}
        
        {% set node_name = node.unique_id %}
        {% set raw_sql = node.raw_code %}
        {{ log(node_name~': '~raw_sql, True) }}
    {% endfor %}
{% endif %}

{% endmacro %}