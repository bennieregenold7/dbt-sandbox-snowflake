import holidays
import pandas as pd


def model(dbt, session):
    dbt.config(
        materialized="table",
        packages=["holidays","pandas"]
    )

    us_holidays = holidays.US()
    calendar = pd.DataFrame(
        pd.date_range(
            '2024-01-01',
            periods = 365,
            freq = 'D'
        ).date,
        columns = ['DATE_FIELD']
    )
    calendar['IS_HOLIDAY'] = calendar['DATE_FIELD'].apply(lambda x: x in us_holidays)

    return calendar