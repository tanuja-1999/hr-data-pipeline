SELECT Distinct
    employee_id,
    employee_name,
    gender,
    age,
    marital_status,
    citizenship,
    race

FROM {{ ref('stg_employees') }}