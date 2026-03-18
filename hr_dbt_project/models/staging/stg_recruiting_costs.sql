select 
lower(recruitingresource) as recruiting_resource,
month,
cost
from {{ source('hr_raw', 'recruiting_costs_2023') }}
unpivot (
    cost for month in (
        JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC
    )
)