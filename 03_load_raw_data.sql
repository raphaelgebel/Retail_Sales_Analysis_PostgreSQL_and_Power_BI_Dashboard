/*
Loads raw data from the csv file into the previously created table 'raw_superstore'.

Data source:
https://www.kaggle.com/datasets/vivek468/superstore-dataset-final
*/

COPY raw_superstore
FROM 'C:\Users\xxx\Sample - Superstore.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');


-- Testing if the data was loaded correctly
SELECT COUNT(*) FROM raw_superstore;

SELECT * FROM raw_superstore LIMIT 100;