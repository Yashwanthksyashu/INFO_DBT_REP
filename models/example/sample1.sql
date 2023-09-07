select * from infm_dev_db.public.yash_dept


-- Assuming 'source_data' is a CTE or a table containing your source data
with enriched_data as (
    select
        deptno,
        dname,
        loc,
        {{ generate_surrogate_key(['dname', 'loc']) }} as surrogate_key
    from infm_dev_db.public.yash_dept
)

select * from enriched_data;

select
 deptno,
        dname,
        loc,
 {{ generate_surrogate_key(['deptno','dname']) }} as surrogate_key
from infm_dev_db.public.yash_dept

select * from INFM_DEV_DB.dbt_yks.table_for_surrogate_key

select
GRAIN_ID,
ENTITY_GRAIN,
ENTITY_ID,UNIMPORTANT_VALUE,IMPORTANT_STATUS,UPDATED_AT_DATE,
 {{ generate_surrogate_key(['ENTITY_ID','ENTITY_GRAIN']) }} as surrogate_key
 from
{{source('src_surro', 'table_for_surrogate_key')}}




select
*,
    md5('deptno','dname')
from infm_dev_db.public.yash_dept

select
*,
    md5('deptno')
    ,
    md5('dname')
from infm_dev_db.public.yash_dept
