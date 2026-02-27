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


WITH unique_products AS (
    SELECT DISTINCT
        product_id,
        product_category,
        product_sub_category,
        product_name
    FROM
        raw_superstore
    ORDER BY
        product_id
)
INSERT INTO dim_products (
    product_id,
    product_category,
    product_sub_category,
    product_name
)
SELECT *
FROM unique_products;



-- Handling products with the same 'product_id' but different 'product_name'
WITH new_names AS (
    SELECT
        product_id,
        COUNT(DISTINCT product_name),
        MAX(product_name) AS new_product_name -- Selecting a clear product_name
    FROM
        raw_superstore
    GROUP BY
        product_id
    HAVING 
        COUNT(DISTINCT product_name) > 1 -- Identifying products with multiple different names
)
UPDATE raw_superstore
SET product_name = new_names.new_product_name
FROM new_names
WHERE raw_superstore.product_id = new_names.product_id;


-- Checking that each product_id now has a single, consistent product name
SELECT
    product_id,
    COUNT(DISTINCT product_name),
    MAX(product_name) AS new_product_name -- Selecting a clear product_name
FROM
    raw_superstore
GROUP BY
    product_id
HAVING 
    COUNT(DISTINCT product_name) > 1;



WITH unique_products AS ( -- Determining all unique products
    SELECT DISTINCT
        product_id,
        product_category,
        product_sub_category,
        product_name
    FROM
        raw_superstore
)
INSERT INTO dim_products ( -- Inserting the products into the corresponding table
        product_id,
        product_category,
        product_sub_category,
        product_name
)
SELECT *
FROM unique_products;


-- Testing if the data was inserted correctly
SELECT *
FROM dim_products;



WITH products_to_orders AS ( -- Selecting all order line items (relation between products to orders)
    SELECT
        order_id,
        product_id,
        quantity,
        discount,
        sales,
        profit
    FROM raw_superstore
)
INSERT INTO fact_product_to_orders ( -- Inserting the data into the corresponding table
        order_id,
        product_id,
        quantity,
        discount,
        sales,
        profit
)
SELECT *
FROM products_to_orders;


-- Testing if the data was inserted correctly
SELECT *
FROM fact_product_to_orders;