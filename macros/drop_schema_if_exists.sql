{% macro drop_target_schema_if_exists() %}

	{{ log('Preparing to drop schema: ' ~ schema_to_drop , True) }}

	{# replace the database below with your database name #}
	{% set drop_statement = 'drop schema if exists development.' ~ target.schema %}
	
	{% if execute %}
		{% do run_query(drop_statement) %}
    {{ log('Schema dropped successfully' , True) }}		
	{% endif %}

{% endmacro %}