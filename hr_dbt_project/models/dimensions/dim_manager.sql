SELECT
    ROW_NUMBER() OVER (ORDER BY manager_name) AS manager_id,
    manager_name

FROM (
    SELECT DISTINCT manager_name
    FROM {{ ref('stg_employees') }}
    WHERE manager_name IS NOT NULL
) m