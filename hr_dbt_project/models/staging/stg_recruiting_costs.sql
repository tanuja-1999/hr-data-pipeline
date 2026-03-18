select 
lower(recruitingresource) as recruiting_resource,
month,
cost
from {{ source('hr_raw', 'recruiting_costs_2023') }}
unpivot (
    cost for month in (
        JANUARY, FEBRUARY, MARCH, APRIL, MAY, JUNE, JULY, AUGUST, SEPTEMBER, OCTOBER, NOVEMBER, DECEMBER
    )
)