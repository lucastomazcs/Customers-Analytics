CREATE OR REPLACE TABLE gold_churn_by_contract AS
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(AVG(ChurnFlag) * 100, 2) AS churn_rate
FROM silver_customers
GROUP BY Contract
ORDER BY churn_rate DESC;


CREATE OR REPLACE TABLE gold_churn_by_payment_method AS
SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(AVG(ChurnFlag) * 100, 2) AS churn_rate
FROM silver_customers
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;


CREATE OR REPLACE TABLE gold_churn_by_tenure_group AS
SELECT
    tenure_group,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(AVG(ChurnFlag) * 100, 2) AS churn_rate
FROM silver_customers
GROUP BY tenure_group
ORDER BY churn_rate DESC;


CREATE OR REPLACE TABLE gold_churn_by_monthly_charge_group AS
SELECT
    monthly_charge_group,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(AVG(ChurnFlag) * 100, 2) AS churn_rate
FROM silver_customers
GROUP BY monthly_charge_group
ORDER BY churn_rate DESC;


CREATE OR REPLACE TABLE gold_revenue_summary AS
SELECT
    COUNT(*) AS total_customers,
    ROUND(SUM(TotalCharges), 2) AS total_revenue,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge,
    ROUND(AVG(TotalCharges), 2) AS avg_total_charge,
    ROUND(AVG(ChurnFlag) * 100, 2) AS churn_rate
FROM silver_customers;


CREATE OR REPLACE TABLE gold_churn_by_internet_service AS
SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(AVG(ChurnFlag) * 100, 2) AS churn_rate,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
FROM silver_customers
GROUP BY InternetService
ORDER BY churn_rate DESC;