{{ config(materialized='table') }}

select
    c_custkey cust_key,
    c.c_name name,
    c.c_nationkey nation_key,
    sum(o.o_totalprice) as total_order
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" c
left join "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" o
    on c.c_custkey = o.o_custkey

group by
    cust_key,
    name,
    nation_key
