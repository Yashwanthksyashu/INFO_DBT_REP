select 
{{macro_for_initcap('CUSTOMER_NAME')}},
{{macro_for_parse('CUSTOMER_DETAILS')}},
{{macro_for_gender_check('GENDER')}},
{{macro_for_customer_adress('CUSTOMER_ADDRESS')}},
{{MACRO_FOR_PRODUCT('PRODUCT')}}
from INFM_DEV_DB.PUBLIC.VEN_YASH_CUST