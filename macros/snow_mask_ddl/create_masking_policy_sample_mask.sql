{% macro create_masking_policy_sample_mask(node_database,node_schema) %}

CREATE MASKING POLICY IF NOT EXISTS {{node_database}}.{{node_schema}}.sample_mask AS (val string) 
  RETURNS string ->
      CASE WHEN CURRENT_ROLE() IN ('TRANSFORMER') THEN val 
      ELSE '**********'
      END

{% endmacro %}