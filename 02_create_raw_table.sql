/*
This creates a new table to load the raw data into. (from csv-file)
*/

CREATE TABLE raw_superstore(
    row_id INT PRIMARY KEY,
    order_id VARCHAR(14),
    order_date DATE,
    ship_date DATE,
    ship_mode TEXT,
    customer_id VARCHAR(8),
    customer_name TEXT,
    segment TEXT,
    country_name TEXT,
    city_name TEXT,
    state_name TEXT,
    postal_code INT,
    region TEXT,
    product_id VARCHAR(15),
    product_category TEXT,
    product_sub_category TEXT,
    product_name TEXT,
    sales NUMERIC,
    quantity INT,
    discount NUMERIC,
    profit NUMERIC
);