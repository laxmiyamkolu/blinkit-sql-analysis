-- =====================================================
--  BLINKIT SALES & DELIVERY ANALYSIS USING SQL
-- =====================================================




-- =========================
-- 1. SALES ANALYSIS
-- =========================

-- 1.1 Total Revenue
SELECT SUM(order_total) AS total_revenue
FROM blinkit_orders;


-- 1.2 Orders Over Time
SELECT DATE(order_date) AS order_day, COUNT(*) AS total_orders
FROM blinkit_orders
GROUP BY DATE(order_date)
ORDER BY order_day;


-- =========================
-- 2. PRODUCT ANALYSIS
-- =========================

--  2.1 Top Selling Products
SELECT 
p.product_name,
SUM(oi.quantity) AS total_quantity_sold
FROM blinkit_order_items oi
JOIN blinkit_products p 
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;


-- 2.2 Revenue by Category
SELECT 
p.category,
SUM(oi.quantity * oi.unit_price) AS revenue
FROM blinkit_order_items oi
JOIN blinkit_products p 
ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;


-- =========================
-- 3. CUSTOMER ANALYSIS
-- =========================

-- 3.1 Top Customers by Total Spend
SELECT 
c.customer_name,
SUM(o.order_total) AS total_spent
FROM blinkit_customers c
JOIN blinkit_orders o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;


-- 3.2 Customer Segment Analysis
SELECT 
customer_segment,
COUNT(*) AS total_customers,
AVG(avg_order_value) AS avg_value
FROM blinkit_customers
GROUP BY customer_segment;


-- 3.3 Average Order Value
SELECT AVG(order_total) AS avg_order_value
FROM blinkit_orders;


-- =========================
-- 4. DELIVERY ANALYSIS
-- =========================

-- 4.1 Delivery Performance
SELECT 
delivery_status,
COUNT(*) AS total_orders,
ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM blinkit_delivery_performance
GROUP BY delivery_status;


-- 4.2 Delivery Efficiency (Distance vs Time)
SELECT 
ROUND(distance_km,1) AS distance,
AVG(delivery_time_minutes) AS avg_time
FROM blinkit_delivery_performance
GROUP BY distance
ORDER BY distance;


-- 4.3 Delay Analysis
SELECT 
reasons_if_delayed,
COUNT(*) AS occurrences
FROM blinkit_delivery_performance
WHERE delivery_status = 'Significantly Delayed'
GROUP BY reasons_if_delayed
ORDER BY occurrences DESC;