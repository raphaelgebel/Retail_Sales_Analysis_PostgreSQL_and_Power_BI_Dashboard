/*
Transforms the raw data and inserts it into the corresponding dimension and fact tables.
*/


WITH unique_customers AS ( -- Determining all unique customers
    SELECT DISTINCT
        customer_id,
        customer_name,
        segment
    FROM raw_superstore
    ORDER BY customer_id
)
INSERT INTO dim_customers ( -- Inserting the customers into the corresponding table
    customer_id,
    customer_name,
    segment
)
SELECT *
FROM unique_customers;

-- Testing if the data was inserted correctly
SELECT *
FROM dim_customers;



WITH unique_orders AS ( -- Determining all unique orders
    SELECT DISTINCT
        order_id,
        order_date,
        customer_id,
        ship_date,
        ship_mode
    FROM raw_superstore
)
INSERT INTO fact_orders ( -- Inserting the orders into the corresponding table
    order_id,
    order_date,
    customer_id,
    ship_date,
    ship_mode
)
SELECT *
FROM unique_orders;

-- Testing if the data was inserted correctly
SELECT *
FROM fact_orders;