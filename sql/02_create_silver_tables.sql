CREATE OR REPLACE TABLE silver_customers AS
SELECT *
FROM read_csv_auto('../data/processado/telco_customer_churn_clean.csv');
