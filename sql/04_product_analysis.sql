-- ============================================
-- SUPERSTORE SQL ANALYSIS
-- 04 - PRODUCT ANALYSIS
-- ============================================

USE SuperstoreDB;
GO

-- 1. Sales and profit by category
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM Orders
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 2. Sales and profit by sub-category
SELECT
    Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM Orders
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;


-- 3. Top 10 products by sales
SELECT TOP 10
    Product_ID,
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY
    Product_ID,
    Product_Name
ORDER BY Total_Sales DESC;


-- 4. Top 10 products by profit
SELECT TOP 10
    Product_ID,
    Product_Name,
    SUM(Profit) AS Total_Profit,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY
    Product_ID,
    Product_Name
ORDER BY Total_Profit DESC;


-- 5. Bottom 10 products by profit
SELECT TOP 10
    Product_ID,
    Product_Name,
    SUM(Profit) AS Total_Profit,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY
    Product_ID,
    Product_Name
ORDER BY Total_Profit ASC;


-- 6. Loss-making products
SELECT
    Product_ID,
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY
    Product_ID,
    Product_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit;


-- 7. Product profit margin
SELECT
    Product_ID,
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 /
        NULLIF(SUM(Sales), 0),
        2
    ) AS Profit_Margin_Percentage
FROM Orders
GROUP BY
    Product_ID,
    Product_Name
ORDER BY Profit_Margin_Percentage DESC;


-- 8. Sales and profit by category and sub-category
SELECT
    Category,
    Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY
    Category,
    Sub_Category
ORDER BY
    Category,
    Total_Sales DESC;


-- 9. Products with high sales but negative profit
SELECT
    Product_ID,
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY
    Product_ID,
    Product_Name
HAVING
    SUM(Sales) > 1000
    AND SUM(Profit) < 0
ORDER BY Total_Sales DESC;


-- 10. Products with the highest quantity sold
SELECT TOP 10
    Product_ID,
    Product_Name,
    SUM(Quantity) AS Total_Quantity,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY
    Product_ID,
    Product_Name
ORDER BY Total_Quantity DESC;