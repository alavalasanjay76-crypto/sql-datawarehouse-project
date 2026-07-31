/*====================================================
Project : SQL Data Warehouse Project
File    : Gold Layer Quality Checks
Purpose : Validate analytical layer
====================================================*/


USE DataWarehouseDB;
GO


PRINT '===== Gold Layer Quality Checks =====';



------------------------------------------------
-- Check duplicate orders
------------------------------------------------

SELECT

order_id,

COUNT(*) AS duplicate_count


FROM gold.fact_sales_report


GROUP BY order_id


HAVING COUNT(*) > 1;



------------------------------------------------
-- Check empty customer names
------------------------------------------------

SELECT *

FROM gold.fact_sales_report

WHERE customer_name IS NULL;



------------------------------------------------
-- Check empty product names
------------------------------------------------

SELECT *

FROM gold.fact_sales_report

WHERE product_name IS NULL;



------------------------------------------------
-- Check sales amount
------------------------------------------------

SELECT *

FROM gold.fact_sales_report

WHERE sales_amount <= 0;



------------------------------------------------
-- Sales summary validation
------------------------------------------------

SELECT

COUNT(*) AS Total_Records,

SUM(sales_amount) AS Total_Revenue


FROM gold.fact_sales_report;



PRINT 'Gold checks completed';
