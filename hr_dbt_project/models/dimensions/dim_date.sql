WITH date_spine AS (
   /*SELECT
        DATEADD(day, seq4(), '2023-01-01') AS date_day
    FROM TABLE(GENERATOR(ROWCOUNT => 365))*/
    
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="to_date('2023-01-01')",
        end_date="to_date('2024-01-01')"
    ) }}

),

final AS (

    SELECT
        date_day AS date_key,

        YEAR(date_day) AS year,
        MONTH(date_day) AS month,
        MONTHNAME(date_day) AS month_name,
        QUARTER(date_day) AS quarter,

        DATE_TRUNC('month', date_day) AS month_start,

        DAYOFWEEK(date_day) AS day_of_week,
        WEEK(date_day) AS week_of_year

    FROM date_spine

)

SELECT * FROM final