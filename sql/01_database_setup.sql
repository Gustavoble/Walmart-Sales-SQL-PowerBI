-- =====================================================
-- WALMART SALES DATA ANALYSIS
-- Database Setup
-- =====================================================

-- Create the database
CREATE DATABASE IF NOT EXISTS walmart_sales;

-- Select the database
USE walmart_sales;

-- =====================================================
-- Create the Walmart Sales table
-- =====================================================

CREATE TABLE IF NOT EXISTS walmart_sales (
    invoice_id VARCHAR(30),
    branch VARCHAR(10),
    city VARCHAR(50),
    customer_type VARCHAR(30),
    gender VARCHAR(10),
    product_line VARCHAR(100),
    unit_price DECIMAL(10,2),
    quantity INT,
    tax_5_percent DECIMAL(10,2),
    total DECIMAL(10,2),
    date DATE,
    time TIME,
    payment VARCHAR(30),
    cogs DECIMAL(10,2),
    gross_margin_percentage DECIMAL(10,2),
    gross_income DECIMAL(10,2),
    rating DECIMAL(3,1)
);

-- Check the table structure
DESCRIBE walmart_sales;

-- View the imported data
SELECT *
FROM walmart_sales
LIMIT 10;
