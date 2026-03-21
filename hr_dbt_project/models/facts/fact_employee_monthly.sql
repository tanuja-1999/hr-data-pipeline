select 
employee_id ,
month_start,
is_active
from {{ref('int_employee_monthly')}}