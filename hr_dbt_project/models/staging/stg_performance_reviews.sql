SELECT
    EMPLOYEENUMBER        AS employee_id,
    
    -- standardize
    LOWER(PERFORMANCESCORE) AS performance_score,
    
    PERFORMANCEREVIEWDATE AS review_date

FROM {{ source('hr_raw', 'performance_reviews_2023') }}