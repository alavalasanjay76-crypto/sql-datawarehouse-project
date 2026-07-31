USE DataWarehouseDB;
GO


------------------------------------------------
-- Load Customer Dimension
------------------------------------------------

INSERT INTO silver.dim_customer
(
customer_id,
customer_name,
gender,
country
)

SELECT DISTINCT

customer_id,

CONCAT(first_name,' ',last_name),

UPPER(gender),

UPPER(country)


FROM bronze.crm_customers;



------------------------------------------------
-- Load Product Dimension
------------------------------------------------

INSERT INTO silver.dim_product
(
product_id,
product_name,
category,
cost
)

SELECT DISTINCT

product_id,

TRIM(product_name),

UPPER(category),

cost


FROM bronze.erp_products;



------------------------------------------------
-- Load Sales Fact
------------------------------------------------

INSERT INTO silver.fact_sales
(
order_id,
customer_id,
product_id,
quantity,
sales_amount
)


SELECT

order_id,

customer_id,

product_id,

quantity,

sales_amount


FROM bronze.crm_sales;



PRINT 'Silver transformation completed';
