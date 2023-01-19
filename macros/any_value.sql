{% macro any_value() -%}
    {{ return(adapter.dispatch('any_value', 'dbt_utils') ()) }}
{% endmacro %}


{% macro default__any_value() -%}
    
   {{ log('This came from my project', True) }}
    
{%- endmacro %}