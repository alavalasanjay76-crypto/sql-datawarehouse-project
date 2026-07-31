# Data Warehouse Data Dictionary

## Bronze Layer

The Bronze layer stores raw data exactly as received from source systems.

---

# bronze.crm_customer

| Column | Data Type | Description |
|---|---|---|
| customer_id | INT | Unique customer identifier |
| first_name | VARCHAR | Customer first name |
| last_name | VARCHAR | Customer last name |
| gender | VARCHAR | Customer gender |
| birth_date | DATE | Customer date of birth |
| country | VARCHAR | Customer country |

---

# bronze.crm_sales

| Column | Data Type | Description |
|---|---|---|
| order_id | INT | Unique order identifier |
| customer_id | INT | Customer reference |
| order_date | DATE | Date of purchase |
| product_id | INT | Product reference |
| quantity | INT | Quantity purchased |
| sales_amount | DECIMAL | Total sales amount |

---

# bronze.erp_products

| Column | Data Type | Description |
|---|---|---|
| product_id | INT | Unique product identifier |
| product_name | VARCHAR | Product name |
| category | VARCHAR | Product category |
| cost | DECIMAL | Product cost |

---

# Silver Layer

The Silver layer contains cleaned and transformed data.

---

# silver.dim_customer

| Column | Description |
|---|---|
| customer_key | Surrogate key |
| customer_id | Business customer ID |
| customer_name | Full customer name |
| gender | Standardized gender |
| country | Standardized country |

---

# silver.dim_product

| Column | Description |
|---|---|
| product_key | Surrogate key |
| product_id | Product identifier |
| product_name | Product name |
| category | Product category |
| cost | Product cost |

---

# silver.fact_sales

| Column | Description |
|---|---|
| sales_key | Sales surrogate key |
| order_id | Order identifier |
| customer_id | Customer identifier |
| product_id | Product identifier |
| quantity | Units sold |
| sales_amount | Revenue generated |

---

# Gold Layer

The Gold layer provides business-ready analytical views.

---

# gold.fact_sales_report

Contains:

- Customer details
- Product details
- Category information
- Sales metrics

Used for:

- Reporting
- Dashboards
- Business analysis
