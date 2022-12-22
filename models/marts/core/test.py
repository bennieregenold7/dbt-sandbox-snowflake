from snowflake.snowpark.functions import sql_expr


def model(dbt, session):
    dbt.config(
        materialized="table"
    )

    # convert to pandas
    df1 = dbt.ref('date_spine').to_pandas()

    # convert back to snowpark df
    df2 = session.create_dataframe(df1)

    # cast timestamp column
    colCast = df2.withColumn("DATE_HOUR", sql_expr("to_timestamp(DATE_HOUR::string)"))

    return colCast