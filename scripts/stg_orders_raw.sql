-- Cleaned the columns names in the ORDERS_RAW Table and save as STG_ORDERS_RAW
CREATE OR REPLACE TABLE STG_ORDERS_RAW AS
SELECT
    CAST(TRY_TO_TIMESTAMP_NTZ("DATE", 'MM/DD/YYYY HH24:MI') AS DATE) AS order_date_orders,
    "Order #" AS order_number,
    TRY_TO_NUMBER(REPLACE(REPLACE("N. Revenue (formatted)", '$', ''), ',', '')) AS net_revenue,
    "STATUS" AS sales_status,
    "CUSTOMER" AS customer_name,
    "CUSTOMER_TYPE" AS customer_type,
    "Product(s)" AS products,
    "ITEMS_SOLD" AS items_sold,
    TRY_TO_NUMBER(REPLACE(REPLACE("NET_SALES", '$', ''), ',', '')) AS net_sales,
    "ATTRIBUTION" AS pro_attribution 
FROM ORDERS_RAW;
