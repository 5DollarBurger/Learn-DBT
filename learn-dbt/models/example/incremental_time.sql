{{ config(materialized='incremental', unique_key='time') }}

select
    *,
    to_time(concat(
      T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND
    )) time
from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."TIME_DIM"
where time <= current_time

-- replace using created_at or updated_at columns instead
{% if is_incremental() %}
  and time > (select max(time) from {{ this }})
{% endif %}

order by time desc
