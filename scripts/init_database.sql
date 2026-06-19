/* At the initial stage
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--CREATE DATABASE AND SCHEMAS
================================================================================================================================================================================
============================================================
Database Setup Script
============================================================

Purpose:
This script is used to create the DataWarehouse database for
my Data Warehouse project.

The script performs the following tasks:

1. Checks whether the DataWarehouse database already exists.
2. Drops the existing database (if available).
3. Creates a fresh DataWarehouse database.
4. Creates the required schemas:
      - bronze
      - silver
      - gold

Schema Description:

bronze  -> Stores raw data loaded directly from source systems.
silver  -> Stores cleaned and transformed data.
gold    -> Stores business-ready data models for reporting
           and analytics.

Note:
This script is intended for development and project setup.
Running it will reset the database and recreate all schemas.

============================================================
--if you only want to check the database is existed with desired name then
  use database_name;
 */ 
--check if the database name existed and delete the database
if Exists(select 1 from sys.databases where name='Datawarehouse')
begin 
alter database Datawarehouse set single_user with rollback immediate;
drop database Datawarehouse;
end;
go
  --create datawarehouse 
  use master;
  create database Datawarehouse;
  use Datawarehouse;
  create schema bronze;
  go
  create schema silver;
  go
  create schema gold;
  go
