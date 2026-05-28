-- =========================================
-- RETAIL ANALYTICS PROJECT
-- KPI ANALYSIS + BUSINESS INSIGHTS
-- Objective: Generate business insights from data
-- =========================================

-- =========================================
-- 1. TOTAL REVENUE
-- =========================================

SELECT 
    SUM(quantity * price) AS total_revenue
FROM order_items;

-- Insight:
-- This represents total business revenue from all transactions.
-- It is the primary KPI for measuring business performance.


-- =========================================
-- 2. REVENUE BY CATEGORY
-- =========================================

SELECT 
    p.category,
    SUM(oi.quantity * oi.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Insight:
-- Electronics contributes the highest revenue share.
-- Business is highly dependent on high-value electronic products.


-- =========================================
-- 3. TOP PRODUCTS
-- =========================================

SELECT 
    p.product_name,
    SUM(oi.quantity * oi.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

-- Insight:
-- Few products generate most of the revenue (Pareto principle).
-- These products should be prioritized in inventory planning.


-- =========================================
-- 4. CUSTOMER SPENDING
-- =========================================

SELECT 
    o.customer_id,
    SUM(oi.quantity * oi.price) AS total_spent
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC;

-- Insight:
-- Certain customers contribute significantly higher revenue.
-- These are high-value customers for retention strategies.


-- =========================================
-- 5. MONTHLY REVENUE TREND
-- =========================================

SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(oi.quantity * oi.price) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- Insight:
-- Revenue shows monthly variation indicating business trends.
-- Helps in planning marketing and inventory strategies.


-- =========================================
-- 6. REPEAT CUSTOMERS
-- =========================================

SELECT 
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- Insight:
-- Repeat customers indicate strong loyalty.
-- Retention strategies should focus on these users.


-- =========================================
-- 7. CUSTOMER RANKING (WINDOW FUNCTION)
-- =========================================

SELECT 
    o.customer_id,
    SUM(oi.quantity * oi.price) AS total_spent,
    RANK() OVER (ORDER BY SUM(oi.quantity * oi.price) DESC) AS customer_rank
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.customer_id;

-- Insight:
-- Customers are ranked based on spending behavior.
-- Helps identify top contributors to revenue.