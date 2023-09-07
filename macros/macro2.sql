{% macro macro_to_split_email_phone(Column_name) %}
CASE
      WHEN {{ Column_name }} RLIKE '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4},\\d+' THEN SPLIT_PART({{ Column_name }}, ',', 1)
      ELSE NULL
    END AS email,
    CASE
      WHEN {{ Column_name }} RLIKE '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4},\\d{10}$'
       AND LENGTH(SPLIT_PART({{ Column_name }}, ',', 2)) = 10  
      THEN SPLIT_PART({{ Column_name }}, ',', 2)
      ELSE NULL
    END AS phone_number

{% endmacro %}


{% macro nullcheck(cols) %}
    {{ return(adapter.dispatch('nullcheck', 'dbt_utils')(cols)) }}
{% endmacro %}


{%- macro snowflake__deduplicate(relation, partition_by, order_by) -%}

    select *
    from {{ relation }}
    qualify
        row_number() over (
            partition by {{ partition_by }}
            order by {{ order_by }}
        ) > 3

{%- endmacro -%}



{%- macro get_table_types_sql() -%}
  {{ return(adapter.dispatch('get_table_types_sql', 'dbt_utils')()) }}
{%- endmacro -%}


{%- macro generate_surrogate_key(field_list) -%}
    {{ return(adapter.dispatch('generate_surrogate_key', 'dbt_utils')(field_list)) }}
{% endmacro %}

{%- macro build_key_from_columns(dbt_relation, exclude=[]) -%}

{% set cols = dbt_utils.get_filtered_columns_in_relation(dbt_relation, exclude)  %}

{{ return(dbt_utils.surrogate_key(cols)) }}

{%- endmacro -%} 
