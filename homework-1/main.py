"""Скрипт для заполнения данными таблиц в БД Postgres."""
import csv
import psycopg2

customers_path = 'north_data/customers_data.csv'
employees_path = 'north_data/employees_data.csv'
orders_path = 'north_data/orders_data.csv'

conn_params = {
    'host': "localhost",
    'database': "north",
    'user': "postgres",
    'password': "12345"
}


def get_data(path):
    file = open(path, 'r')
    csvfile = csv.DictReader(file)
    return csvfile


def customers_into_table():
    with psycopg2.connect(**conn_params) as conn:
        data = get_data(customers_path)
        with conn.cursor() as cur:
            for d in data:
                cur.execute("INSERT INTO customers VALUES (%s, %s, %s)",
                            (d['customer_id'], d['company_name'], d['contact_name']))
                cur.execute("SELECT * FROM employees")
    conn.close()


def employees_into_table():
    with psycopg2.connect(**conn_params) as conn:
        data = get_data(employees_path)
        with conn.cursor() as cur:
            for d in data:
                cur.execute("INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)",
                            (d['employee_id'], d['first_name'], d['last_name'], d['title'],
                             d['birth_date'], d['notes']))
    conn.close()


def orders_into_table():
    with psycopg2.connect(**conn_params) as conn:
        data = get_data(orders_path)
        with conn.cursor() as cur:
            for d in data:
                cur.execute("INSERT INTO orders VALUES (%s, %s, %s, %s, %s)",
                            (d['order_id'], d['customer_id'], d['employee_id'], d['order_date'],
                             d['ship_city']))
    conn.close()


# orders_into_table()
# employees_into_table()
# customers_into_table()
