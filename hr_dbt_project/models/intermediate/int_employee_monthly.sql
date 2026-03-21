with employees as (

    select * 
    from {{ ref('stg_employees') }}

),

months as (

    select distinct
        month_start
    from {{ ref('dim_date') }}
    where month_start between '2023-01-01' and '2023-12-01'

),

employee_months as (

    select
        e.employee_id,
        m.month_start,
        e.department,
        e.position,
        e.manager_name,
        e.hire_date,
        e.termination_date
    from employees e
    cross join months m

),

final as (

    select
        *,
        case 
            when hire_date <= month_start
             and (termination_date is null or termination_date >= month_start)
            then 1 else 0
        end as is_active

    from employee_months

)

select * 
from final