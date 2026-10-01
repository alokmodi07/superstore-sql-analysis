-- ============================================
-- SUPERSTORE SQL ANALYSIS
-- 05 - ADVANCED ANALYSIS
-- ============================================

USE SuperstoreDB;
GO


-- 1. Rank products by profit
SELECT
    Product_ID,
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    RANK() OVER (
        ORDER BY SUM(Profit) DESC
    ) AS Profit_Rank
FROM Orders
GROUP BY
    Product_ID,
    Product_Name
ORDER BY Profit_Rank;


-- 2. Rank products within each category
SELECT
    Category,
    Product_ID,
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    RANK() OVER (
        PARTITION BY Category
        ORDER BY SUM(Profit) DESC
    ) AS Category_Profit_Rank
FROM Orders
GROUP BY
    Category,
    Product_ID,
    Product_Name
ORDER BY
    Category,
    Category_Profit_Rank;


-- 3. Top 3 products in each category
WITH ProductRanking AS
(
    SELECT
        Category,
        Product_ID,
        Product_Name,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit,
        RANK() OVER (
            PARTITION BY Category
            ORDER BY SUM(Profit) DESC
        ) AS Profit_Rank
    FROM Orders
    GROUP BY
        Category,
        Product_ID,
        Product_Name
)
SELECT
    Category,
    Product_ID,
    Product_Name,
    Total_Sales,
    Total_Profit,
    Profit_Rank
FROM ProductRanking
WHERE Profit_Rank <= 3
ORDER BY
    Category,
    Profit_Rank;


-- 4. Monthly sales with previous month sales
WITH MonthlySales AS
(
    SELECT
        YEAR(Order_Date) AS Order_Year,
        MONTH(Order_Date) AS Order_Month,
        SUM(Sales) AS Total_Sales
    FROM Orders
    GROUP BY
        YEAR(Order_Date),
        MONTH(Order_Date)
)
SELECT
    Order_Year,
    Order_Month,
    Total_Sales,
    LAG(Total_Sales) OVER (
        ORDER BY Order_Year, Order_Month
    ) AS Previous_Month_Sales
FROM MonthlySales
ORDER BY
    Order_Year,
    Order_Month;


-- 5. Monthly sales growth percentage
WITH MonthlySales AS
(
    SELECT
        YEAR(Order_Date) AS Order_Year,
        MONTH(Order_Date) AS Order_Month,
        SUM(Sales) AS Total_Sales
    FROM Orders
    GROUP BY
        YEAR(Order_Date),
        MONTH(Order_Date)
),
SalesWithPrevious AS
(
    SELECT
        Order_Year,
        Order_Month,
        Total_Sales,
        LAG(Total_Sales) OVER (
            ORDER BY Order_Year, Order_Month
        ) AS Previous_Month_Sales
    FROM MonthlySales
)
SELECT
    Order_Year,
    Order_Month,
    Total_Sales,
    Previous_Month_Sales,
    ROUND(
        (Total_Sales - Previous_Month_Sales)
        * 100.0 /
        NULLIF(Previous_Month_Sales, 0),
        2
    ) AS Sales_Growth_Percentage
FROM SalesWithPrevious
ORDER BY
    Order_Year,
    Order_Month;


-- 6. Running total of sales
WITH MonthlySales AS
(
    SELECT
        YEAR(Order_Date) AS Order_Year,
        MONTH(Order_Date) AS Order_Month,
        SUM(Sales) AS Total_Sales
    FROM Orders
    GROUP BY
        YEAR(Order_Date),
        MONTH(Order_Date)
)
SELECT
    Order_Year,
    Order_Month,
    Total_Sales,
    SUM(Total_Sales) OVER (
        ORDER BY Order_Year, Order_Month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Running_Total_Sales
FROM MonthlySales
ORDER BY
    Order_Year,
    Order_Month;


-- 7. Customer ranking by sales
SELECT
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROW_NUMBER() OVER (
        ORDER BY SUM(Sales) DESC
    ) AS Customer_Rank
FROM Orders
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Customer_Rank;


-- 8. Customer sales compared with segment average
WITH CustomerSales AS
(
    SELECT
        Customer_ID,
        Customer_Name,
        Segment,
        SUM(Sales) AS Total_Sales
    FROM Orders
    GROUP BY
        Customer_ID,
        Customer_Name,
        Segment
)
SELECT
    Customer_ID,
    Customer_Name,
    Segment,
    Total_Sales,
    ROUND(
        AVG(Total_Sales) OVER (
            PARTITION BY Segment
        ),
        2
    ) AS Segment_Average_Sales
FROM CustomerSales
ORDER BY Total_Sales DESC;


-- 9. Category contribution to total sales
WITH CategorySales AS
(
    SELECT
        Category,
        SUM(Sales) AS Total_Sales
    FROM Orders
    GROUP BY Category
)
SELECT
    Category,
    Total_Sales,
    ROUND(
        Total_Sales * 100.0 /
        SUM(Total_Sales) OVER (),
        2
    ) AS Sales_Contribution_Percentage
FROM CategorySales
ORDER BY Total_Sales DESC;


-- 10. High-value customers using CTE
WITH CustomerSummary AS
(
    SELECT
        Customer_ID,
        Customer_Name,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM Orders
    GROUP BY
        Customer_ID,
        Customer_Name
)
SELECT
    Customer_ID,
    Customer_Name,
    Total_Sales,
    Total_Profit,
    CASE
        WHEN Total_Sales >= 10000 THEN 'High Value'
        WHEN Total_Sales >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Value_Segment
FROM CustomerSummary
ORDER BY Total_Sales DESC;