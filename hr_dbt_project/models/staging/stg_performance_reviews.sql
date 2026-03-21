with source as (

    select * 
    from {{ source('hr_raw', 'performance_reviews_2023') }}

),

cleaned as (

    select
        cast(employeenumber as string) as employee_id,
        lower(trim(performancescore)) as performance_score,
        cast(performancereviewdate as date) as review_date

    from source

)

select * from cleaned