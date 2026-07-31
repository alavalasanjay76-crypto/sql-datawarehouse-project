/*====================================================
Project : SQL Data Warehouse Project
File    : Bronze Layer Quality Checks
Purpose : Validate raw data
====================================================*/


USE DataWarehouseDB;
GO


PRINT '===== Bronze Layer Quality Checks =====';



------------------------------------------------
-- Check duplicate customer IDs
------------------------------------------------

SELECT

customer_id,

COUNT(*) AS duplicate_count


FROM bronze.crm_customer


GROUP BY customer_id


HAVING COUNT(*) > 1;



------------------------------------------------
-- Check missing customer IDs
------------------------------------------------

SELECT *

FROM bronze.crm_customer

WHERE customer_id IS NULL;



------------------------------------------------
-- Check missing sales IDs
------------------------------------------------

SELECT *

FROM bronze.crm_sales

WHERE order_id IS NULL;



------------------------------------------------
-- Check negative sales values
------------------------------------------------

SELECT *

FROM bronze.crm_sales

WHERE sales_amount < 0;



------------------------------------------------
-- Check invalid quantities
------------------------------------------------

SELECT *

FROM bronze.crm_sales

WHERE quantity <= 0;



PRINT 'Bronze checks completed';
