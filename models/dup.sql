select * from infm_dev_db.public.dup_data



{{snowflake__deduplicate('infm_dev_db.public.dup_data', 'eno', 'eno')}}
