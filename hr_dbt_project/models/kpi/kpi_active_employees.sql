select month_start
,count(distinct employee_id) as active_employees

 from {{ref('fact_employee_monthly')}}
 where is_active=1
 group by month_start
    order by month_start