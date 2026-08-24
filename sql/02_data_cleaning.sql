-- =====================================================
-- WALMART SALES DATA ANALYSIS
-- Data Cleaning and Validation
-- =====================================================

USE walmart_sales;

-- =====================================================
-- 1. Check for duplicate invoice IDs
-- =====================================================

SELECT
    invoice_id,
    COUNT(*) AS duplicate_count
FROM walmart_sales
GROUP BY invoice_id
HAVING COUNT(*) > 1;

-- =====================================================
-- 2. Check for missing values
-- =====================================================

SELECT
    SUM(invoice_id IS NULL) AS missing_invoice_id,
    SUM(branch IS NULL) AS missing_branch,
    SUM(city IS NULL) AS missing_city,
    SUM(customer_type IS NULL) AS missing_customer_type,
    SUM(gender IS NULL) AS missing_gender,
    SUM(product_line IS NULL) AS missing_product_line,
    SUM(unit_price IS NULL) AS missing_unit_price,
    SUM(quantity IS NULL) AS missing_quantity,
    SUM(total IS NULL) AS missing_total,
    SUM(date IS NULL) AS missing_date,
    SUM(time IS NULL) AS missing_time,
    SUM(payment IS NULL) AS missing_payment,
    SUM(gross_income IS NULL) AS missing_gross_income,
    SUM(rating IS NULL) AS missing_rating
FROM walmart_sales;

-- =====================================================
-- 3. Check for invalid quantities
-- =====================================================

SELECT *
FROM walmart_sales
WHERE quantity <= 0;

-- =====================================================
-- 4. Check for invalid prices
-- =====================================================

SELECT *
FROM walmart_sales
WHERE unit_price <= 0;

-- =====================================================
-- 5. Check for invalid ratings
-- =====================================================

SELECT *
FROM walmart_sales
WHERE rating < 0
   OR rating > 10;

-- =====================================================
-- 6. Check for invalid transaction totals
-- =====================================================

SELECT *
FROM walmart_sales
WHERE total <= 0;

-- =====================================================
-- 7. Check the date range
-- =====================================================

SELECT
    MIN(date) AS first_sale_date,
    MAX(date) AS last_sale_date
FROM walmart_sales;

-- =====================================================
-- 8. Preview cleaned data
-- =====================================================

SELECT *
FROM walmart_sales
LIMIT 20;
