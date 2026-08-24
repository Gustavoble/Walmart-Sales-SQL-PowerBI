-- =====================================================
-- WALMART SALES DATA ANALYSIS
-- Advanced SQL Analysis
-- =====================================================

USE walmart_sales;

-- =====================================================
-- 1. Rank Branches by Revenue
-- =====================================================

SELECT
    branch,
    ROUND(SUM(total), 2) AS revenue,
    RANK() OVER (ORDER BY SUM(total) DESC) AS revenue_rank
FROM walmart_sales
GROUP BY branch;


-- =====================================================
-- 2. Rank Product Lines by Revenue
-- =====================================================

SELECT
    product_line,
    ROUND(SUM(total), 2) AS revenue,
    RANK() OVER (ORDER BY SUM(total) DESC) AS revenue_rank
FROM walmart_sales
GROUP BY product_line;


-- =====================================================
-- 3. Top 3 Product Lines in Each Branch
-- =====================================================

WITH product_sales AS (
    SELECT
        branch,
        product_line,
        SUM(total) AS revenue
    FROM walmart_sales
    GROUP BY branch, product_line
),

ranked_products AS (
    SELECT
        branch,
        product_line,
        ROUND(revenue, 2) AS revenue,
        RANK() OVER (
            PARTITION BY branch
            ORDER BY revenue DESC
        ) AS product_rank
    FROM product_sales
)

SELECT *
FROM ranked_products
WHERE product_rank <= 3
ORDER BY branch, product_rank;


-- =====================================================
-- 4. Running Total of Daily Revenue
-- =====================================================

WITH daily_revenue AS (
    SELECT
        date,
        SUM(total) AS revenue
    FROM walmart_sales
    GROUP BY date
)

SELECT
    date,
    ROUND(revenue, 2) AS daily_revenue,
    ROUND(
        SUM(revenue) OVER (
            ORDER BY date
        ),
        2
    ) AS running_total
FROM daily_revenue
ORDER BY date;


-- =====================================================
-- 5. Above Average Transactions
-- =====================================================

SELECT
    invoice_id,
    branch,
    product_line,
    total
FROM walmart_sales
WHERE total > (
    SELECT AVG(total)
    FROM walmart_sales
)
ORDER BY total DESC;


-- =====================================================
-- 6. Revenue Contribution by Product Line
-- =====================================================

WITH product_revenue AS (
    SELECT
        product_line,
        SUM(total) AS revenue
    FROM walmart_sales
    GROUP BY product_line
)

SELECT
    product_line,
    ROUND(revenue, 2) AS revenue,
    ROUND(
        (revenue / SUM(revenue) OVER ()) * 100,
        2
    ) AS revenue_percentage
FROM product_revenue
ORDER BY revenue DESC;


-- =====================================================
-- 7. Identify High-Value Transactions
-- =====================================================

SELECT
    invoice_id,
    branch,
    product_line,
    total,
    CASE
        WHEN total >= 500 THEN 'High Value'
        WHEN total >= 200 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS transaction_category
FROM walmart_sales
ORDER BY total DESC;
