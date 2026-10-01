-- ============================================
-- SUPERSTORE SQL ANALYSIS
-- 01 - DATABASE SETUP
-- ============================================

-- Create database
CREATE DATABASE SuperstoreDB;
GO

USE SuperstoreDB;
GO

-- Create main orders table
CREATE TABLE Orders (
    Row_ID INT,
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    Region VARCHAR(50),
    Product_ID VARCHAR(20),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(200),
    Sales DECIMAL(12,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(12,2)
);

-- Verify table
SELECT TOP 10 *
FROM Orders;

-- Check number of records
SELECT COUNT(*) AS TotalRows
FROM Orders;

-- Check unique customers
SELECT COUNT(DISTINCT Customer_ID) AS UniqueCustomers
FROM Orders;

-- Check unique products
SELECT COUNT(DISTINCT Product_ID) AS UniqueProducts
FROM Orders;