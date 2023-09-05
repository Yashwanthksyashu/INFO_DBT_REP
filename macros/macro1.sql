{% macro macro1(column_name) %}
{{column_name}}>20
{% endmacro %}

{% macro macro_for_initcap(column_name) %}
initcap({{column_name}}) as CUSTOMER_NAME
{% endmacro %}

{% macro macro_for_parse (column_name) %}
split_part ({{column_name}},',',1) as EMAIL,
split_part({{column_name}},',',2) as PHONE_NUMBER
{% endmacro %}

{% macro macro_for_gender_check(column_name) %}
case 
when {{column_name}}='M' or {{column_name}}='m' or {{column_name}}='MALE'  or {{column_name}}='male' then 'Male'
when {{column_name}}='F' or {{column_name}}='f' or {{column_name}}='FEMALE' or {{column_name}}='female' then 'Female'
else {{column_name}} end as GENDER 
{% endmacro %}

{% macro macro_for_customer_adress(column_name) %}
trim(split_part({{column_name}},',',1)) as AREA,
trim(initcap(split_part({{column_name}},',',2))) as CITY,
case
when 
trim(UPPER(split_part({{column_name}},',',3)))='IND' or
trim(UPPER(split_part({{column_name}},',',3)))='INDIA' or
trim(UPPER(split_part({{column_name}},',',3)))='BHARATH' 
then
'India'
else split_part({{column_name}},',',3)
end as COUNTRY

{% endmacro %}


{% macro macro_for_customer_address1(column_name) %}
  split_part({{ column_name }}, ',', 1) as AREA,
  CASE
    WHEN TRIM(UPPER(split_part({{ column_name }}, ',', 3))) IN ('IND', 'INDIA', 'BHARATH') THEN 'India'
    ELSE TRIM(split_part({{ column_name }}, ',', 3))
  END as COUNTRY,
  split_part({{ column_name }}, ',', 2) as city
{% endmacro %}




{% macro MACRO_FOR_PRODUCT(column_name) %}
CASE
    WHEN TRIM(UPPER(POSITION('SAMSUNG' IN {{column_name}}))) > 0 THEN 'SAMSUNG'
    WHEN TRIM(UPPER(POSITION('apple' IN {{column_name}})))>0 THEN 'APPLE'
    WHEN TRIM(UPPER(POSITION('Godrej ' IN {{column_name}})))>0 THEN 'GODREJ'
    ELSE NULL
  END AS brandname,
  CASE
    WHEN TRIM(UPPER(POSITION('GALAXY-M20' IN {{column_name}}))) > 0 THEN 'GALAXY-M20'
    WHEN TRIM(UPPER(POSITION('iphoneI14' IN {{column_name}}))) > 0 THEN 'iphoneI14'
    WHEN TRIM(UPPER(POSITION('FH20' IN {{column_name}}))) > 0 THEN 'FH20' 
    ELSE NULL
  END AS model,
  TO_DATE(REGEXP_SUBSTR({{column_name}}, '\\d{2}-\\d{2}-\\d{4}', 1, 1), 'DD-MM-YYYY') AS purchase_date
  {% endmacro %}