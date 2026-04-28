create database BLINKIT_SALES;
SHOW databases;
USE BLINKIT_SALES;
show tables;

-- blinkit_products table creation
CREATE table blinkit_products(
    product_id INT,
    product_name VARCHAR(255),
    category VARCHAR(100),
    brand VARCHAR(100),
    price DECIMAL(10,2),
    mrp DECIMAL(10,2),
    margin_percentage INT,
    shelf_life_days INT,
    min_stock_level INT,
    max_stock_level INT
);

-- blinkit_orders table creation
CREATE TABLE blinkit_orders (
    order_id BIGINT,
    customer_id BIGINT,
    order_date VARCHAR(30),
    promised_delivery_time VARCHAR(30),
    actual_delivery_time VARCHAR(30),
    delivery_status VARCHAR(50),
    order_total DECIMAL(10,2),
    payment_method VARCHAR(50),
    delivery_partner_id INT,
    store_id INT
);

-- blinkit_order_items  table creation
CREATE TABLE blinkit_order_items (
    order_id BIGINT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2)
);

-- blinkit_customers table creation
CREATE TABLE blinkit_customers (
    customer_id BIGINT,
    customer_name VARCHAR(150),
    email VARCHAR(150),
    phone VARCHAR(20),
    address VARCHAR(255),
    area VARCHAR(100),
    pincode VARCHAR(20),
    registration_date VARCHAR(20),
    customer_segment VARCHAR(50),
    total_orders INT,
    avg_order_value DECIMAL(10,2)
);

-- blinkit_delivery_performance  table creation
CREATE TABLE blinkit_delivery_performance (
    order_id BIGINT,
    delivery_partner_id INT,
    promised_time VARCHAR(30),
    actual_time VARCHAR(30),
    delivery_time_minutes INT,
    distance_km DECIMAL(5,2),
    delivery_status VARCHAR(50),
    reasons_if_delayed VARCHAR(255)
);



