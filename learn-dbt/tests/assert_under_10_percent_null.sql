SELECT
  sum(case when id is null then 1 else 0 end) / count(*) total_nulls
from {{ ref('my_first_dbt_model') }}

having total_nulls > 0.60
