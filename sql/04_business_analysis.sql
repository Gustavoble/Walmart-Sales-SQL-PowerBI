-- =====================================================
-- WALMART SALES DATA ANALYSIS
-- Business Analysis
-- =====================================================

USE walmart_sales;

-- =====================================================
-- 1. Branch Performance Analysis
-- =====================================================

SELECT
    branch,
    city,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS units_sold,
    ROUND(SUM(total), 2) AS total_revenue,
    ROUND(SUM(gross_income), 2) AS total_gross_income,
    ROUND(AVG(rating), 2) AS average_rating
FROM walmart_sales
GROUP BY branch, city
ORDER BY total_revenue DESC;


-- =====================================================
-- 2. Product Line Performance
-- =====================================================

SELECT
    product_line,
    COUNT(*) AS transactions,
    SUM(quantity) AS units_sold,
    ROUND(SUM(total), 2) AS revenue,
    ROUND(SUM(gross_income), 2) AS gross_income,
    ROUND(AVG(rating), 2) AS average_rating
FROM walmart_sales
GROUP BY product_line
ORDER BY revenue DESC;


-- =====================================================
-- 3. Customer Type Analysis
-- =====================================================

SELECT
    customer_type,
    COUNT(*) AS transactions,
    ROUND(SUM(total), 2) AS revenue,
    ROUND(AVG(total), 2) AS average_transaction
FROM walmart_sales
GROUP BY customer_type
ORDER BY revenue DESC;


-- =====================================================
-- 4. Gender Analysis
-- =====================================================

SELECT
    gender,
    COUNT(*) AS transactions,
    ROUND(SUM(total), 2) AS revenue,
    ROUND(AVG(total), 2) AS average_transaction
FROM walmart_sales
GROUP BY gender
ORDER BY revenue DESC;


-- =====================================================
-- 5. Payment Method Analysis
-- =====================================================

SELECT
    payment,
    COUNT(*) AS transactions,
    ROUND(SUM(total), 2) AS revenue,
    ROUND(AVG(total), 2) AS average_transaction
FROM walmart_sales
GROUP BY payment
ORDER BY revenue DESC;


-- =====================================================
-- 6. Daily Sales Analysis
-- =====================================================

SELECT
    date,
    COUNT(*) AS transactions,
    SUM(quantity) AS units_sold,
    ROUND(SUM(total), 2) AS revenue
FROM walmart_sales
GROUP BY date
ORDER BY date;


-- =====================================================
-- 7. Sales by Hour
-- =====================================================

SELECT
    HOUR(time) AS sales_hour,
    COUNT(*) AS transactions,
    ROUND(SUM(total), 2) AS revenue
FROM walmart_sales
GROUP BY HOUR(time)
ORDER BY sales_hour;


-- =====================================================
-- 8. Best Performing Branch
-- =====================================================

SELECT
    branch,
    ROUND(SUM(total), 2) AS revenue
FROM walmart_sales
GROUP BY branch
ORDER BY revenue DESC
LIMIT 1;


-- =====================================================
-- 9. Best Performing Product Line
-- =====================================================

SELECT
    product_line,
    ROUND(SUM(total), 2) AS revenue
FROM walmart_sales
GROUP BY product_line
ORDER BY revenue DESC
LIMIT 1;


-- =====================================================
-- 10. Top 10 Highest Value Transactions
-- =====================================================

SELECT
    invoice_id,
    branch,
    city,
    product_line,
    customer_type,
    payment,
    quantity,
    ROUND(total, 2) AS total
FROM walmart_sales
ORDER BY total DESC
LIMIT 10;
