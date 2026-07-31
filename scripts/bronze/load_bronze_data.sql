USE DataWarehouseDB;
GO


BULK INSERT bronze.crm_customer
FROM 'C:\DataWarehouse\datasets\crm_customers.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n'
);



BULK INSERT bronze.crm_sales
FROM 'C:\DataWarehouse\datasets\crm_sales.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n'
);



BULK INSERT bronze.erp_products
FROM 'C:\DataWarehouse\datasets\erp_products.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n'
);


PRINT 'Bronze data loaded successfully';
