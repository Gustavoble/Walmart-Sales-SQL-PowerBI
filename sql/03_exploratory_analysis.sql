-- =====================================================
-- WALMART SALES DATA ANALYSIS
-- Exploratory Data Analysis
-- =====================================================

USE walmart_sales;

-- Total number of transactions
SELECT
    COUNT(*) AS total_transactions
FROM walmart_sales;

-- Total revenue
SELECT
    ROUND(SUM(total), 2) AS total_revenue
FROM walmart_sales;

-- Total units sold
SELECT
    SUM(quantity) AS total_units_sold
FROM walmart_sales;

-- Average transaction value
SELECT
    ROUND(AVG(total), 2) AS average_transaction_value
FROM walmart_sales;

-- Average customer rating
SELECT
    ROUND(AVG(rating), 2) AS average_customer_rating
FROM walmart_sales;

-- Number of branches
SELECT
    COUNT(DISTINCT branch) AS total_branches
FROM walmart_sales;

-- Number of cities
SELECT
    COUNT(DISTINCT city) AS total_cities
FROM walmart_sales;

-- Number of product lines
SELECT
    COUNT(DISTINCT product_line) AS total_product_lines
FROM walmart_sales;

-- Distinct payment methods
SELECT DISTINCT payment
FROM walmart_sales;

-- Revenue by branch
SELECT
    branch,
    ROUND(SUM(total), 2) AS revenue
FROM walmart_sales
GROUP BY branch
ORDER BY revenue DESC;
