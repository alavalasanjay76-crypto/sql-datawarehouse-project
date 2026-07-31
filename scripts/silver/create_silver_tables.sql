USE DataWarehouseDB;
GO


CREATE SCHEMA silver;
GO


CREATE TABLE silver.dim_customer
(
    customer_key INT IDENTITY PRIMARY KEY,

    customer_id INT,

    customer_name VARCHAR(100),

    gender VARCHAR(10),

    country VARCHAR(50)
);



CREATE TABLE silver.dim_product
(
    product_key INT IDENTITY PRIMARY KEY,

    product_id INT,

    product_name VARCHAR(100),

    category VARCHAR(50),

    cost DECIMAL(10,2)
);



CREATE TABLE silver.fact_sales
(
    sales_key INT IDENTITY PRIMARY KEY,

    order_id INT,

    customer_id INT,

    product_id INT,

    quantity INT,

    sales_amount DECIMAL(10,2)

);


PRINT 'Silver tables created';
