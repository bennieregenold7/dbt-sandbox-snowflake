{% macro class_to_dict(class) %}

    {% set dict_string = '{' %}

    {% for key, value in class.items() %}
        {% set dict_string = dict_string~key~'='~value %}
        {% if not loop.last %}
            {% set dict_string = dict_string~',' %}
        {% endif %}
    {% endfor %}

    {% set dict_string = dict_string~'}' %}

    {{ return(dict_string) }}
    
{% endmacro %}