# Data Warehouse Architecture


## Overview

This project follows the Medallion Architecture approach:
Source Systems
|
|
v
+-------------+
| Bronze |
| Raw Data |
+-------------+
|
|
v
+-------------+
| Silver |
| Clean Data |
+-------------+
|
|
v
+-------------+
| Gold |
| Analytics |
+-------------+


---

# Bronze Layer

Purpose:

- Store raw source data
- Maintain historical information
- No transformations applied


Sources:

- CRM customer data
- CRM sales data
- ERP product data


---

# Silver Layer

Purpose:

- Clean data
- Remove duplicates
- Standardize values
- Apply transformations


Contains:

- Dimension tables
- Fact tables


---

# Gold Layer

Purpose:

- Business reporting
- Analytics
- Dashboard consumption


Contains:

- Sales reporting views
- Business metrics


---

# Technologies Used

- SQL Server
- T-SQL
- SQL Server Management Studio
- GitHub
