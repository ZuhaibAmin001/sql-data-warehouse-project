/*
===============================================================
Create Database and Schemas (A script for me to remeber)
===============================================================

Script Purpose:
    This script creates a new database named 'DataWarehouse'
    after checking if it already exists.

    If the database exists, it is dropped and recreated.
    Additionally, the script sets up three schemas within
    the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'DataWarehouse'
    database if it exists.

    All data in the database will be permanently deleted.
    Proceed with caution and ensure you have proper backups
    before running this script.
*/

-- Switch to the master database
USE master;
GO

-- Drop the DataWarehouse database if it already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the DataWarehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch to the DataWarehouse database
USE DataWarehouse;
GO

-- Create the Bronze schema for storing raw source data
CREATE SCHEMA bronze;
GO

-- Create the Silver schema for storing cleaned and transformed data
CREATE SCHEMA silver;
GO

-- Create the Gold schema for storing business-ready and analytical data
CREATE SCHEMA gold;
GO
