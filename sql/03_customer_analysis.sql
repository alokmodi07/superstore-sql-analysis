-- ============================================
-- SUPERSTORE SQL ANALYSIS
-- 03 - CUSTOMER ANALYSIS
-- ============================================

USE SuperstoreDB;
GO

-- 1. Total sales and profit by customer
SELECT
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM Orders
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Total_Sales DESC;


-- 2. Top 10 customers by sales
SELECT TOP 10
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Total_Sales DESC;


-- 3. Top 10 customers by profit
SELECT TOP 10
    Customer_ID,
    Customer_Name,
    SUM(Profit) AS Total_Profit,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Total_Profit DESC;


-- 4. Customers generating losses
SELECT
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY
    Customer_ID,
    Customer_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit;


-- 5. Customer count by segment
SELECT
    Segment,
    COUNT(DISTINCT Customer_ID) AS Customer_Count
FROM Orders
GROUP BY Segment
ORDER BY Customer_Count DESC;


-- 6. Average sales per customer
SELECT
    AVG(Customer_Sales) AS Average_Sales_Per_Customer
FROM
(
    SELECT
        Customer_ID,
        SUM(Sales) AS Customer_Sales
    FROM Orders
    GROUP BY Customer_ID
) AS CustomerTotals;


-- 7. Average profit per customer
SELECT
    AVG(Customer_Profit) AS Average_Profit_Per_Customer
FROM
(
    SELECT
        Customer_ID,
        SUM(Profit) AS Customer_Profit
    FROM Orders
    GROUP BY Customer_ID
) AS CustomerTotals;


-- 8. Customers with more than 10 orders
SELECT
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Number_of_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY
    Customer_ID,
    Customer_Name
HAVING COUNT(DISTINCT Order_ID) > 10
ORDER BY Number_of_Orders DESC;


-- 9. Customer profit margin
SELECT
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 /
        NULLIF(SUM(Sales), 0),
        2
    ) AS Profit_Margin_Percentage
FROM Orders
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Profit_Margin_Percentage DESC;


-- 10. Customers with high sales but low profit
SELECT
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 /
        NULLIF(SUM(Sales), 0),
        2
    ) AS Profit_Margin_Percentage
FROM Orders
GROUP BY
    Customer_ID,
    Customer_Name
HAVING
    SUM(Sales) > 5000
    AND SUM(Profit) < 500
ORDER BY Total_Sales DESC;