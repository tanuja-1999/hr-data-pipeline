with source as(
    select * from {{ref('fact_employee_monthly')}}
),
active_reports as (
    select 
    source.month_start,
    de.manager_id,
    de.manager_name,
    count(source.employee_sk) as direct_reports
    from source
    inner join {{ref('dim_employees')}} de
    on source.employee_sk = de.employee_sk
    where source.is_active = 1
    and de.is_manager = 1
    group by source.month_start,de.manager_id,de.manager_name
)
select * from active_reports