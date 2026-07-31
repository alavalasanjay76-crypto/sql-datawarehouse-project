USE DataWarehouseDB;
GO


CREATE SCHEMA gold;
GO



CREATE VIEW gold.fact_sales_report
AS

SELECT

    s.order_id,

    c.customer_name,

    p.product_name,

    p.category,

    s.quantity,

    s.sales_amount


FROM silver.fact_sales s


JOIN silver.dim_customer c

ON s.customer_id=c.customer_id


JOIN silver.dim_product p

ON s.product_id=p.product_id;


GO


PRINT 'Gold layer created';
