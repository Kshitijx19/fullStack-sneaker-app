-- =========================================================
-- FullStack Sneaker Shop Database Schema + Seed Data
-- Author: Your Name
-- =========================================================

-- Drop tables if they exist (for clean re-setup)
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS cart_items CASCADE;
DROP TABLE IF EXISTS address CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- =========================================================
-- Users table
-- =========================================================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================================
-- Address table
-- =========================================================
CREATE TABLE address (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    line1 VARCHAR(255) NOT NULL,
    line2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    pincode VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================================
-- Products table
-- =========================================================
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    image2 VARCHAR(255)
);

-- =========================================================
-- Cart Items table
-- =========================================================
CREATE TABLE cart_items (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    product_id INT NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    quantity INT NOT NULL CHECK (quantity > 0),
    size VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================================
-- Orders table
-- =========================================================
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    address_id INT NOT NULL REFERENCES address(id) ON DELETE CASCADE,
    total DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(20) NOT NULL CHECK (payment_method IN ('cod', 'card', 'upi')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================================
-- Order Items table
-- =========================================================
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    product_id INT NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    quantity INT NOT NULL CHECK (quantity > 0),
    size VARCHAR(10)
);

-- =========================================================
-- Seed Data: Products
-- =========================================================
INSERT INTO products (id, name, description, price, image, created_at, image2) VALUES
(1, 'Blue Canvas Shoes', 'Comfortable and stylish blue canvas sneakers.', 1200.00, '/images/shoe1.jpg', '2025-09-16 16:24:06.578957', '/images/shoe1_2.avif'),
(2, 'Black High Tops', 'Classic black high-top sneakers for all occasions.', 1400.00, '/images/shoe2.avif', '2025-09-16 16:24:06.578957', '/images/shoe2_2.avif'),
(3, 'Yellow Sports Shoes', 'Lightweight yellow sports shoes for running and training.', 1100.00, '/images/shoe3.avif', '2025-09-16 16:24:06.578957', '/images/shoe3_3.avif'),
(4, 'Black High Tops', 'Classic black high-top sneakers for all occasions.', 1400.00, '/images/shoe4.avif', '2025-09-16 16:24:06.578957', '/images/shoe4_2.avif'),
(5, 'Multicolor canvas', 'A pair of colorful sneakers to express your unique style.', 1200.00, '/images/shoe5.avif', '2025-09-16 16:24:06.578957', '/images/shoe5_2.avif'),
(6, 'Red Sports Shoes', 'A pair of stylish red shoes to help you stand out.', 1300.00, '/images/shoe6.avif', '2025-09-16 16:24:06.578957', '/images/shoe6_2.avif'),
(7, 'Yellow Air Jordan', 'A classic Nike Air Jordan design in a striking yellow.', 1800.00, '/images/shoe7.avif', '2025-09-16 16:24:06.578957', '/images/shoe7_2.avif'),
(8, 'Blue Air Jordan', 'The classic Air Jordan in a sleek blue.', 1800.00, '/images/shoe8.avif', '2025-09-16 16:24:06.578957', '/images/shoe8_2.avif'),
(9, 'Green Air Jordan', 'A vibrant green Air Jordan for a fresh look.', 1700.00, '/images/shoe9.avif', '2025-09-16 16:24:06.578957', '/images/shoe9_2.avif');
