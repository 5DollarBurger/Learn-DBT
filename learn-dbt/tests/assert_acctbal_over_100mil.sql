SELECT
  sum(c_acctbal) total_balance
from {{ ref('playing_with_tests') }}

having total_balance < 1E8
