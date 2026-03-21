select 
md5(cast(employee_id as varchar)) as employee_sk,
month_start,
is_active
from {{ref('int_employee_monthly')}}