USE DataWarehouseDB;
GO


CREATE SCHEMA bronze;
GO


------------------------------------------------
-- CRM Customer Data
------------------------------------------------

CREATE TABLE bronze.crm_customer
(
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    birth_date DATE,
    country VARCHAR(50)
);


------------------------------------------------
-- CRM Sales Data
------------------------------------------------

CREATE TABLE bronze.crm_sales
(
    order_id INT,
    customer_id INT,
    order_date DATE,
    product_id INT,
    quantity INT,
    sales_amount DECIMAL(10,2)
);



------------------------------------------------
-- ERP Product Data
------------------------------------------------

CREATE TABLE bronze.erp_products
(
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    cost DECIMAL(10,2)
);


PRINT 'Bronze tables created';
