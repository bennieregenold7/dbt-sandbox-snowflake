{% macro log_graph() %}

    {% if execute %}
        {% for model in graph.nodes.values() %}
            {{ log('The model '~model.unique_id~' is materialized as a '~model.config.materialized, true) }}
        {% endfor %}
    {% endif %}

{% endmacro %}