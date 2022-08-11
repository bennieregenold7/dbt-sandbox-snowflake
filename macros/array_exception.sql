{% macro array_exceptions(input_text) %}
    {% set el_tools = ['Fivetran', 'Stitch', 'CustomELPipeline'] %}
    {% set input_list= input_text.split(',') %}
    {% set return_list = [] %}

    {% for item in input_list %}
            {{ return_list.append(item) }}
    {% endfor %}
    
   {{ return(return_list) }}

{% endmacro %}