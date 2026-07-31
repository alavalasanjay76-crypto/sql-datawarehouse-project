USE DataWarehouseDB;
GO


------------------------------------------------
-- Total Revenue
------------------------------------------------

SELECT

SUM(sales_amount) AS Total_Revenue

FROM gold.sales_summary;



------------------------------------------------
-- Top Products
------------------------------------------------

SELECT

product_name,

SUM(sales_amount) Revenue


FROM gold.sales_summary


GROUP BY product_name


ORDER BY Revenue DESC;



------------------------------------------------
-- Customer Revenue Ranking
------------------------------------------------

SELECT

customer_name,

SUM(sales_amount) Revenue,


RANK() OVER
(
ORDER BY SUM(sales_amount) DESC
)
Customer_Rank


FROM gold.sales_summary


GROUP BY customer_name;
