with source as(
    select * from {{ref('fact_employee_monthly')}} as fem
),
active_managers as(
    select 
    dem.department,
    extract(month from source.month_start) as month_start,
    count(distinct source.employee_sk) as active_managers
    from source
    inner join {{ref('dim_employees')}} as dem
    on source.employee_sk = dem.employee_sk
    where source.is_active = 1
    and dem.is_manager = 1
    group by dem.department, extract(month from source.month_start)
    order by dem.department, extract(month from source.month_start)
)
select * from active_managers