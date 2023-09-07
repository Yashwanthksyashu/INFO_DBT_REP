select 
{{macro_for_initcap('CUSTOMER_NAME')}},
{{macro_to_split_email_phone('CUSTOMER_DETAILS')}},
{{macro_for_gender_check('GENDER')}},
{{macro_for_customer_adress('CUSTOMER_ADDRESS')}},
{{MACRO_FOR_PRODUCT('PRODUCT')}}
from INFM_DEV_DB.PUBLIC.VEN_YASH_CUST



{{snowflake__deduplicate('CORRECTED_DATA', 'CITY', 'CITY')}}


