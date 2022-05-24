{{ config(materialized='incremental', unique_key='d_date') }}


select *
from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."DATE_DIM"
where d_date <= current_date

-- replace using created_at or updated_at columns instead
{% if is_incremental() %}
  and d_date > (select max(d_date) from {{ this }})
{% endif %}

order by d_date desc
