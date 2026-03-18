SELECT
    EMPLOYEENUMBER       AS employee_id,
    EMPLOYEENAME         AS employee_name,

    -- org details
    LOWER(DEPARTMENT)    AS department,
    LOWER(POSITION)      AS position,
    MANAGERNAME          AS manager_name,

    -- employment
    LOWER(EMPLOYMENTSTATUS) AS employee_status,
    DATEOFHIRE           AS hire_date,
    DATEOFTERMINATION    AS termination_date,

    -- recruiting
    LOWER(RECRUITINGRESOURCE) AS recruiting_source,

    -- demographics (optional)
    AGE                  AS age,
    LOWER(SEX)           AS gender,
    LOWER(MARITALDESC)   AS marital_status,
    LOWER(CITIZENDESC)   AS citizenship,
    LOWER(RACEDESC)      AS race

FROM {{ source('hr_raw', 'employees') }}