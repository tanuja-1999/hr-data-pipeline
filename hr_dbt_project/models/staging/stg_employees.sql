with source as (

    select * 
    from {{ source('hr_raw', 'employees') }}

),

cleaned as (

    select
        cast(employeenumber as string) as employee_id,
        
        split_part(employeename, ',', 2) || ' ' || split_part(employeename, ',', 1) as employee_name,

        -- org
        trim(department) as department,
        trim(position) as position,
        managername as manager_name,

        -- employment
        trim(employmentstatus) as employment_status,
        cast(dateofhire as date) as hire_date,
        cast(dateoftermination as date) as termination_date,

        -- recruiting
        trim(recruitingresource) as recruiting_source,

        -- demographics
        age,
        trim(sex) as gender,
        trim(maritaldesc) as marital_status,
        trim(citizendesc) as citizenship,
        trim(racedesc) as race

    from source

)

select * from cleaned