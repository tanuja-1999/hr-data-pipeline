with employees as (

    select  *
    from {{ ref('stg_employees') }}

),

employee_base as (

    select distinct
        employee_id,
        employee_name,
        manager_name,
        department,
        hire_date,
        termination_date,
        recruiting_source,
        position
    from employees

),


final as (

    select
        md5(cast(e.employee_id as varchar)) as employee_sk,
        e.employee_id,
        e.employee_name,
        e.department,
        e.position,
        recruiting_source,
        hire_date,
        termination_date,
        manager_name,
        case 
    when employee_name in (
        select distinct manager_name 
        from {{ ref('stg_employees') }}
    ) then 1 else 0
end as is_manager

    from employee_base e

)

select * from final