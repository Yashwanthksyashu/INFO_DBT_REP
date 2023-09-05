SELECT
  CASE
    WHEN TRIM(UPPER(POSITION('SAMSUNG' IN PRODUCT))) > 0 THEN 'SAMSUNG'
    WHEN TRIM(UPPER(POSITION('apple' IN PRODUCT)))>0 THEN 'APPLE'
    WHEN TRIM(UPPER(POSITION('Godrej ' IN PRODUCT)))>0 THEN 'GODREJ'
    ELSE NULL
  END AS brandname,
  CASE
    WHEN TRIM(UPPER(POSITION('GALAXY-M20' IN PRODUCT))) > 0 THEN 'GALAXY-M20'
    WHEN TRIM(UPPER(POSITION('iphoneI14' IN PRODUCT))) > 0 THEN 'iphoneI14'
    WHEN TRIM(UPPER(POSITION('FH20' IN PRODUCT))) > 0 THEN 'FH20' 
    ELSE NULL
  END AS model,
  TO_DATE(REGEXP_SUBSTR(PRODUCT, '\\d{2}-\\d{2}-\\d{4}', 1, 1), 'DD-MM-YYYY') AS purchase_date
FROM INFM_DEV_DB.PUBLIC.VEN_YASH_CUST;