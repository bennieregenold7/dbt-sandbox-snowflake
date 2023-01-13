{% macro get_max_processed_date(audit_date_column, audit_table_name) %}

    {% set timestamp_query %}
        select max({{ audit_date_column }})
        from {{ target.database }}.{{ target.schema }}.{{ audit_table_name }}
    {% endset %}

    {% set timestamp_results = run_query(timestamp_query) %}

    {% if execute %}

        {% set process_ts = timestamp_results.columns[0].values()[0] %}
        {{ log('Running with a max process timestamp of: '~process_ts, True) }}

        {{ return(process_ts) }}

    {% endif %}
    
{% endmacro %}