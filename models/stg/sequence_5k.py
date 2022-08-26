import pandas as pd

def model(dbt, session):

    dbt.config(materialized = "table")

    customers = dbt.ref('stg_jaffle_shop__customers')
    customer_df = customers.to_pandas()

    max_cust_id = customer_df['CUSTOMER_ID'].max()

    seq = list(range(1, max_cust_id + 1))

    final_df = pd.DataFrame(seq, columns=['seq_nr'])

    return final_df