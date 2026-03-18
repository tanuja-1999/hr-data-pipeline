SELECT
    ROW_NUMBER() OVER (ORDER BY position) AS job_id,
    position AS job_title

FROM (
    SELECT DISTINCT position
    FROM {{ ref('stg_employees') }}
    WHERE position IS NOT NULL
) j