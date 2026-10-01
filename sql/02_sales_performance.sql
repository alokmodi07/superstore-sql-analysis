-- ============================================
-- SUPERSTORE SQL ANALYSIS
-- 02 - SALES PERFORMANCE
-- ============================================

USE SuperstoreDB;
GO

-- 1. Overall sales, quantity and profit
SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity,
    SUM(Profit) AS Total_Profit,
    AVG(Discount) AS Average_Discount
FROM Orders;


-- 2. Sales and profit by category
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM Orders
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 3. Sales and profit by region
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 4. Sales and profit by customer segment
SELECT
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT Customer_ID) AS Customers
FROM Orders
GROUP BY Segment
ORDER BY Total_Sales DESC;


-- 5. Monthly sales and profit
SELECT
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date)
ORDER BY
    Order_Year,
    Order_Month;


-- 6. Yearly sales and profit
SELECT
    YEAR(Order_Date) AS Order_Year,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;


-- 7. Profit margin by category
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0),
        2
    ) AS Profit_Margin_Percentage
FROM Orders
GROUP BY Category
ORDER BY Profit_Margin_Percentage DESC;


-- 8. Profit by discount level
SELECT
    Discount,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(*) AS Order_Lines
FROM Orders
GROUP BY Discount
ORDER BY Discount;


-- 9. Loss-making categories
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY Category
HAVING SUM(Profit) < 0
ORDER BY Total_Profit;


-- 10. Top 10 states by sales
SELECT TOP 10
    State,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY State
ORDER BY Total_Sales DESC;