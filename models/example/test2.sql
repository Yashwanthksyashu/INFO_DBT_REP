
select
deptno,
lower(DNAME), 
loc
from infm_dev_db.public.yash_dept 



{{snowflake__deduplicate('infm_dev_db.public.yash_dept', 'DNAME', 'deptno')}}