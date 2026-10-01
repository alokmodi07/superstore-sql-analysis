\# Superstore Sales \& Profit Analysis — SQL Server



\## Project Overview



This project analyzes Superstore sales data using Microsoft SQL Server.



The objective is to identify sales trends, customer behavior, product performance, regional performance, and profitability using SQL queries ranging from basic aggregations to advanced window functions and CTEs.



\---



\## Business Questions



This analysis answers questions such as:



\- What are the total sales, profit, and quantity?

\- Which categories generate the most sales and profit?

\- Which regions perform best?

\- Which customers generate the highest sales and profit?

\- Which customers and products generate losses?

\- Which products have the highest sales and profitability?

\- How does sales performance change month over month?

\- Which products rank highest within each category?

\- What percentage of total sales does each category contribute?

\- Which customers are high-value customers?



\---



\## Dataset



The project uses a Superstore sales dataset containing order, customer, product, geographic, sales, discount, and profit information.



\### Dataset Size



\- \*\*Rows:\*\* 9,994

\- \*\*Unique Customers:\*\* 793

\- \*\*Unique Products:\*\* 1,862



\### Main Fields



\- Row ID

\- Order ID

\- Order Date

\- Ship Date

\- Ship Mode

\- Customer ID

\- Customer Name

\- Segment

\- Country

\- City

\- State

\- Postal Code

\- Region

\- Product ID

\- Category

\- Sub-Category

\- Product Name

\- Sales

\- Quantity

\- Discount

\- Profit



\---



\## Key Results



The SQL analysis produced the following overall metrics:



| KPI | Value |

|---|---:|

| Total Sales | $2,297,200.86 |

| Total Quantity | 37,873 |

| Total Profit | $286,817.02 |

| Average Discount | 15.62% |

| Customers | 793 |

| Products | 1,862 |

| Records | 9,994 |



\---



\## SQL Analysis



\### 1. Sales Performance



The project analyzes:



\- Overall sales and profit

\- Sales by category

\- Sales by region

\- Sales by customer segment

\- Monthly sales and profit

\- Yearly sales and profit

\- Profit margin by category

\- Profit by discount level

\- Loss-making categories

\- Top states by sales



\### 2. Customer Analysis



The customer analysis includes:



\- Customer sales and profit

\- Top customers by sales

\- Top customers by profit

\- Loss-making customers

\- Customer counts by segment

\- Average sales per customer

\- Average profit per customer

\- Customers with more than 10 orders

\- Customer profit margins

\- High-sales but low-profit customers



\### 3. Product Analysis



The product analysis includes:



\- Category performance

\- Sub-category performance

\- Top products by sales

\- Top products by profit

\- Bottom products by profit

\- Loss-making products

\- Product profit margins

\- Category and sub-category performance

\- High-sales but loss-making products

\- Products with the highest quantity sold



\### 4. Advanced SQL Analysis



Advanced SQL techniques were used to perform:



\- Product ranking

\- Ranking within categories

\- Top 3 products in each category

\- Month-over-month sales comparison

\- Sales growth percentage

\- Running sales totals

\- Customer ranking

\- Customer performance versus segment averages

\- Category contribution to total sales

\- Customer value segmentation



\---



\## SQL Concepts Used



\### Basic SQL



\- SELECT

\- WHERE

\- ORDER BY

\- GROUP BY

\- HAVING

\- DISTINCT

\- TOP



\### Aggregate Functions



\- SUM()

\- AVG()

\- COUNT()



\### Conditional Logic



\- CASE

\- NULLIF()

\- ROUND()



\### Advanced SQL



\- Common Table Expressions (CTEs)

\- Window Functions

\- RANK()

\- ROW\_NUMBER()

\- LAG()

\- PARTITION BY

\- Running totals

\- Subqueries



\### Date Analysis



\- YEAR()

\- MONTH()

\- Monthly aggregation

\- Yearly aggregation

\- Month-over-month growth



\---



\## Tools Used



\- Microsoft SQL Server

\- SQL Server Management Studio (SSMS)

\- SQL

\- CSV Dataset

\- Git \& GitHub



\---



\## Project Structure



```text

superstore-sql-analysis/

│

├── data/

│   └── Superstore\_Raw(3).csv

│

├── sql/

│   ├── 01\_database\_setup.sql

│   ├── 02\_sales\_performance.sql

│   ├── 03\_customer\_analysis.sql

│   ├── 04\_product\_analysis.sql

│   └── 05\_advanced\_analysis.sql

│

└── README.md

