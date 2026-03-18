WITH date_spine AS (

    SELECT
        DATEADD(day, seq4(), '2023-01-01') AS date_day
    FROM TABLE(GENERATOR(ROWCOUNT => 365))

)

SELECT
    date_day AS date_key,

    YEAR(date_day) AS year,
    MONTH(date_day) AS month,
    MONTHNAME(date_day) AS month_name,
    QUARTER(date_day) AS quarter,

    DAYOFWEEK(date_day) AS day_of_week,
    WEEK(date_day) AS week_of_year

FROM date_spine