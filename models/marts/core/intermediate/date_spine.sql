{{ dbt_utils.date_spine(
    datepart="hour",
    start_date="cast('2022-01-01' as timestamp_ntz)",
    end_date="cast('2024-12-31' as timestamp_ntz)"
   )
}}