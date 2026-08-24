-- =====================================================
-- WALMART SALES DATA ANALYSIS
-- Views and Indexes for Reporting
-- =====================================================

USE walmart_sales;


-- =====================================================
-- 1. Dashboard KPI View
-- =====================================================

CREATE OR REPLACE VIEW vw_dashboard_kpis AS
SELECT
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_units_sold,
    ROUND(SUM(total), 2) AS total_revenue,
    ROUND(SUM(gross_income), 2) AS total_gross_income,
    ROUND(AVG(total), 2) AS average_transaction_value,
    ROUND(AVG(rating), 2) AS average_rating
FROM walmart_sales;


-- =====================================================
-- 2. Monthly Dashboard View
-- =====================================================

CREATE OR REPLACE VIEW vw_dashboard_monthly AS
SELECT
    YEAR(date) AS year,
    MONTH(date) AS month_number,
    MONTHNAME(date) AS month_name,
    COUNT(*) AS transactions,
    SUM(quantity) AS units_sold,
    ROUND(SUM(total), 2) AS revenue,
    ROUND(SUM(gross_income), 2) AS gross_income
FROM walmart_sales
GROUP BY
    YEAR(date),
    MONTH(date),
    MONTHNAME(date);


-- =====================================================
-- 3. Branch Dashboard View
-- =====================================================

CREATE OR REPLACE VIEW vw_dashboard_branch AS
SELECT
    branch,
    COUNT(*) AS transactions,
    SUM(quantity) AS units_sold,
    ROUND(SUM(total), 2) AS revenue,
    ROUND(SUM(gross_income), 2) AS gross_income,
    ROUND(AVG(rating), 2) AS average_rating
FROM walmart_sales
GROUP BY branch;


-- =====================================================
-- 4. Product Dashboard View
-- =====================================================

CREATE OR REPLACE VIEW vw_dashboard_product AS
SELECT
    product_line,
    COUNT(*) AS transactions,
    SUM(quantity) AS units_sold,
    ROUND(SUM(total), 2) AS revenue,
    ROUND(SUM(gross_income), 2) AS gross_income,
    ROUND(AVG(rating), 2) AS average_rating
FROM walmart_sales
GROUP BY product_line;


-- =====================================================
-- 5. Customer Analysis View
-- =====================================================

CREATE OR REPLACE VIEW vw_customer_analysis AS
SELECT
    customer_type,
    gender,
    COUNT(*) AS transactions,
    ROUND(SUM(total), 2) AS revenue,
    ROUND(AVG(total), 2) AS average_transaction,
    ROUND(AVG(rating), 2) AS average_rating
FROM walmart_sales
GROUP BY customer_type, gender;


-- =====================================================
-- 6. Payment Analysis View
-- =====================================================

CREATE OR REPLACE VIEW vw_payment_analysis AS
SELECT
    payment,
    COUNT(*) AS transactions,
    ROUND(SUM(total), 2) AS revenue,
    ROUND(AVG(total), 2) AS average_transaction
FROM walmart_sales
GROUP BY payment;


-- =====================================================
-- 7. Daily Sales View
-- =====================================================

CREATE OR REPLACE VIEW vw_daily_sales AS
SELECT
    date,
    COUNT(*) AS transactions,
    SUM(quantity) AS units_sold,
    ROUND(SUM(total), 2) AS revenue
FROM walmart_sales
GROUP BY date;


-- =====================================================
-- 8. Create Indexes
-- =====================================================

CREATE INDEX idx_branch ON walmart_sales(branch);

CREATE INDEX idx_product_line ON walmart_sales(product_line);

CREATE INDEX idx_customer_type ON walmart_sales(customer_type);

CREATE INDEX idx_payment ON walmart_sales(payment);

CREATE INDEX idx_date ON walmart_sales(date);


-- =====================================================
-- 9. View All Dashboard KPIs
-- =====================================================

SELECT *
FROM vw_dashboard_kpis;
