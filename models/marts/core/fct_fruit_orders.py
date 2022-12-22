from thefuzz import process

def model(dbt, session):

    dbt.config(
        materialized='table',
        packages=[
            'thefuzz'
        ]
    )

    fruit_input = dbt.ref('fruit_user_input').to_pandas()
    fruit_prices = dbt.ref('fruit_prices_fact').to_pandas()

    fruit_input['FRUIT_NAME'] = fruit_input['FRUIT_USER_INPUT'].apply(lambda x: process.extractOne(x, fruit_prices['FRUIT_NAME'])[0])

    fruit_orders = fruit_input.merge(fruit_prices, how='left', on='FRUIT_NAME')
    fruit_orders['ORDER_TOTAL'] = fruit_orders['QUANTITY'] * fruit_orders['COST']

    return fruit_orders
