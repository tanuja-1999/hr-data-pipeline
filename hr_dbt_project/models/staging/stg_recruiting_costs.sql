with source as (

    select * 
    from {{ source('hr_raw', 'recruiting_costs_2023') }}

),

unpivoted as (

    select
        trim(recruitingresource) as recruiting_resource,
        month,
        cost
    from source
    unpivot (
        cost for month in (
            JANUARY, FEBRUARY, MARCH, APRIL, MAY, JUNE,
            JULY, AUGUST, SEPTEMBER, OCTOBER, NOVEMBER, DECEMBER
        )
    )

),

final as (

    select
        recruiting_resource,

        -- convert month to date (first day of month)
        to_date(
            '2023-' ||
            case 
                when month = 'JANUARY' then '01'
                when month = 'FEBRUARY' then '02'
                when month = 'MARCH' then '03'
                when month = 'APRIL' then '04'
                when month = 'MAY' then '05'
                when month = 'JUNE' then '06'
                when month = 'JULY' then '07'
                when month = 'AUGUST' then '08'
                when month = 'SEPTEMBER' then '09'
                when month = 'OCTOBER' then '10'
                when month = 'NOVEMBER' then '11'
                when month = 'DECEMBER' then '12'
            end || '-01'
        ) as month_date,

        cost

    from unpivoted

)

select * from final