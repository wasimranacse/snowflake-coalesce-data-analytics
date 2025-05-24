-- Cleaned the columns names in the ORDERS_RAW Table and save as STG_REVENUE_RAW
CREATE OR REPLACE TABLE STG_REVENUE_RAW AS
SELECT
    CAST(TRY_TO_TIMESTAMP_NTZ("DATE", 'MM/DD/YYYY HH24:MI') AS DATE) AS order_date_revenue,
    ORDERS as order_quantity,
    "RETURNS",
    COUPONS,
    TAXES,
    SHIPPING,
    TOTAL_SALES AS total_cost
FROM REVENUE_RAW;
