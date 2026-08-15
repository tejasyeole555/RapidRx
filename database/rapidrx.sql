-- ============================================
-- RapidRx Database Setup
-- Online Medicine Shopping and Management Platform
-- ============================================

CREATE DATABASE IF NOT EXISTS rapidrx;

USE rapidrx;


-- ============================================
-- 1. USERS TABLE
-- ============================================

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'USER',
    PRIMARY KEY (id)
);


-- ============================================
-- 2. ADMINS TABLE
-- ============================================

CREATE TABLE IF NOT EXISTS admins (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);


-- ============================================
-- 3. MEDICINES TABLE
-- ============================================

CREATE TABLE IF NOT EXISTS medicines (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(100),
    price DOUBLE NOT NULL,
    stock INT NOT NULL,
    PRIMARY KEY (id)
);


-- ============================================
-- 4. ORDERS TABLE
-- ============================================

CREATE TABLE IF NOT EXISTS orders (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    address VARCHAR(500) NOT NULL,
    status VARCHAR(50) DEFAULT 'PLACED',
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50) DEFAULT 'Cash on Delivery',
    payment_status VARCHAR(50) DEFAULT 'Pending',

    PRIMARY KEY (id),

    CONSTRAINT fk_orders_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);


-- ============================================
-- 5. ORDER ITEMS TABLE
-- ============================================

CREATE TABLE IF NOT EXISTS order_items (
    id INT NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    medicine_id INT NOT NULL,
    medicine_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id)
        REFERENCES orders(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_order_items_medicine
        FOREIGN KEY (medicine_id)
        REFERENCES medicines(id)
);


-- ============================================
-- SAMPLE ADMIN ACCOUNT
-- ============================================

INSERT INTO admins (username, password)
VALUES ('admin', 'admin123');


-- ============================================
-- SAMPLE MEDICINES
-- ============================================

INSERT INTO medicines (name, category, price, stock) VALUES

('Paracetamol 500mg', 'Pain Relief', 25.00, 100),

('Dolo 650', 'Fever and Pain', 35.00, 80),

('Crocin Advance', 'Fever', 30.00, 75),

('Cetirizine', 'Allergy', 20.00, 60),

('Amoxicillin 500mg', 'Antibiotic', 120.00, 50),

('Pantoprazole 40mg', 'Gastric', 45.00, 70),

('Vitamin C Tablets', 'Supplements', 90.00, 100),

('ORS Powder', 'Hydration', 25.00, 90);