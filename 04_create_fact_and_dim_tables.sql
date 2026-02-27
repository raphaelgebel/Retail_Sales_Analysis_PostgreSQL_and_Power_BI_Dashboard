/*
Creates dimension and fact tables to structure and organize the data.
*/

CREATE TABLE dim_customers(
    customer_id VARCHAR(8) PRIMARY KEY,
    customer_name TEXT,
    segment TEXT
);

CREATE TABLE fact_orders(
    order_id VARCHAR(14) PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(8) REFERENCES dim_customers(customer_id),
    ship_date DATE,
    ship_mode TEXT
);

CREATE TABLE dim_products(
    product_id VARCHAR(15) PRIMARY KEY,
    product_category TEXT,
    product_sub_category TEXT,
    product_name TEXT
);

CREATE TABLE fact_product_to_orders(
    order_id VARCHAR(14) REFERENCES fact_orders(order_id),
    product_id VARCHAR(15) REFERENCES dim_products(product_id),
    quantity INT,
    discount NUMERIC,
    sales NUMERIC,
    profit NUMERIC,
    PRIMARY KEY (product_id, order_id)
);