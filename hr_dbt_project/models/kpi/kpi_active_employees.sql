select extract(month from month_start) as month_start,
count(distinct employee_sk) as active_employees
from {{ref('fact_employee_monthly')}}
where is_active=1
group by extract(month from month_start)
    order by month_start