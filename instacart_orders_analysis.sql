-- ==============================================================================
-- Project: Instacart Grocery Orders Analysis
-- Purpose: Extract key metrics and trends for the performance dashboard
-- ==============================================================================

-- 1. Order Volume Analysis
-- Calculate the total number of products per order to identify the largest orders (Bulk Buyers).
SELECT 
    order_id, 
    COUNT(product_id) AS total_order
FROM `data-analysis-projects-496119.instacart_db.order_product`
GROUP BY order_id
ORDER BY total_order DESC;

-- ==============================================================================

-- 2. Peak Order Times Analysis
-- Determine the distribution of orders throughout the day to identify high-traffic hours.
SELECT 
    order_hour_of_day,
    COUNT(order_id) AS total_orders
FROM `data-analysis-projects-496119.instacart_db.orders`
GROUP BY order_hour_of_day
ORDER BY order_hour_of_day ASC;

-- ==============================================================================

-- 3. Customer Retention & Product Popularity
-- Retrieve the top 10 most frequently reordered products (Hook Products).
SELECT 
    p.product_name,
    SUM(op.reordered) AS total_reorders
FROM `data-analysis-projects-496119.instacart_db.order_product` op
JOIN `data-analysis-projects-496119.instacart_db.products` p
    ON op.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_reorders DESC
LIMIT 10;

-- ==============================================================================

-- 4. High-Level KPI Metrics
-- Generate summary statistics for the main dashboard cards.

-- A. Total Orders Placed
SELECT 
    COUNT(order_id) AS total_orders_millions
FROM `data-analysis-projects-496119.instacart_db.orders`;

-- B. Total Products Reordered
SELECT 
    SUM(reordered) AS total_reorders_millions
FROM `data-analysis-projects-496119.instacart_db.order_product`;
