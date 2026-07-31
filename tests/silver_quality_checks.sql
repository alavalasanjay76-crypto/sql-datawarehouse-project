/*====================================================
Project : SQL Data Warehouse Project
File    : Silver Layer Quality Checks
Purpose : Validate cleaned data
====================================================*/


USE DataWarehouseDB;
GO


PRINT '===== Silver Layer Quality Checks =====';



------------------------------------------------
-- Check duplicate customers
------------------------------------------------

SELECT

customer_id,

COUNT(*) AS duplicate_count


FROM silver.dim_customer


GROUP BY customer_id


HAVING COUNT(*) > 1;



------------------------------------------------
-- Check missing customer names
------------------------------------------------

SELECT *

FROM silver.dim_customer

WHERE customer_name IS NULL;



------------------------------------------------
-- Check missing products
------------------------------------------------

SELECT *

FROM silver.dim_product

WHERE product_name IS NULL;



------------------------------------------------
-- Check invalid costs
------------------------------------------------

SELECT *

FROM silver.dim_product

WHERE cost < 0;



------------------------------------------------
-- Check sales without customers
------------------------------------------------

SELECT *

FROM silver.fact_sales s


LEFT JOIN silver.dim_customer c

ON s.customer_id=c.customer_id


WHERE c.customer_id IS NULL;



------------------------------------------------
-- Check sales without products
------------------------------------------------

SELECT *

FROM silver.fact_sales s


LEFT JOIN silver.dim_product p

ON s.product_id=p.product_id


WHERE p.product_id IS NULL;



PRINT 'Silver checks completed';
