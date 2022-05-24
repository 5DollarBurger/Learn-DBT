with daily_sales_table as(
  select
      o_orderdate date,
      sum(o_totalprice) daily_sales
  from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"

  group by date

  order by date asc)

select
    date,
    sum(daily_sales) over (order by date asc) cum_sales
from daily_sales_table

order by date
