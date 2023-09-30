-- SQL-команды для создания таблиц

--Open postgres in command lane
--postgres=# \l
--                                                       List of databases
--   Name    |  Owner   | Encoding | Locale Provider |   Collate   |    Ctype    | ICU Locale | ICU Rules |   Access privileges
-------------+----------+----------+-----------------+-------------+-------------+------------+-----------+-----------------------
-- postgres  | postgres | UTF8     | icu             | en_US.UTF-8 | en_US.UTF-8 | en-US      |           |
-- template0 | postgres | UTF8     | icu             | en_US.UTF-8 | en_US.UTF-8 | en-US      |           | =c/postgres          +
--           |          |          |                 |             |             |            |           | postgres=CTc/postgres
-- template1 | postgres | UTF8     | icu             | en_US.UTF-8 | en_US.UTF-8 | en-US      |           | =c/postgres          +
--           |          |          |                 |             |             |            |           | postgres=CTc/postgres
-- test      | postgres | UTF8     | icu             | en_US.UTF-8 | en_US.UTF-8 | en-US      |           |
--(4 rows)
--
--postgres=# CREATE DATABASE north;
--CREATE DATABASE
--postgres=# \l
--                                                       List of databases
--   Name    |  Owner   | Encoding | Locale Provider |   Collate   |    Ctype    | ICU Locale | ICU Rules |   Access privileges
-------------+----------+----------+-----------------+-------------+-------------+------------+-----------+-----------------------
-- north     | postgres | UTF8     | icu             | en_US.UTF-8 | en_US.UTF-8 | en-US      |           |
-- postgres  | postgres | UTF8     | icu             | en_US.UTF-8 | en_US.UTF-8 | en-US      |           |
-- template0 | postgres | UTF8     | icu             | en_US.UTF-8 | en_US.UTF-8 | en-US      |           | =c/postgres          +
--           |          |          |                 |             |             |            |           | postgres=CTc/postgres
-- template1 | postgres | UTF8     | icu             | en_US.UTF-8 | en_US.UTF-8 | en-US      |           | =c/postgres          +
--           |          |          |                 |             |             |            |           | postgres=CTc/postgres
-- test      | postgres | UTF8     | icu             | en_US.UTF-8 | en_US.UTF-8 | en-US      |           |
--(5 rows)
--
--postgres=#

CREATE TABLE customers
(
	customer_id char(5) PRIMARY KEY CHECK (upper(customer_id) = customer_id),
	company_name varchar(50),
	contact_name varchar(100)
);

CREATE TABLE employees
(
	employee_id int PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50),
	title varchar(100),
	birth_date date,
	notes text
);

CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer_id char(5) REFERENCES customers(customer_id) NOT NUll,
	employee_id int REFERENCES employees(employee_id) NOT NUll,
	order_date date,
	ship_city varchar(50)
);
