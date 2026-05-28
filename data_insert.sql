-- =========================================
-- RETAIL ANALYTICS PROJECT
-- DATA INSERT FILE
-- Objective: Insert sample data
-- =========================================

-- Customers
INSERT INTO customers VALUES
(1, 'Aarav', 'Lucknow', '2024-01-10'),
(2, 'Neha', 'Delhi', '2024-02-15'),
(3, 'Rohan', 'Mumbai', '2024-03-20'),
(4, 'Priya', 'Pune', '2024-04-05'),
(5, 'Aman', 'Bangalore', '2024-05-01');

-- Products
INSERT INTO products VALUES
(101, 'iPhone 14', 'Electronics', 60000, 75000),
(102, 'Samsung TV', 'Electronics', 30000, 40000),
(103, 'Nike Shoes', 'Fashion', 3000, 6000),
(104, 'HP Laptop', 'Electronics', 50000, 65000),
(105, 'Office Chair', 'Furniture', 4000, 8000);

-- Orders
INSERT INTO orders VALUES
(1001, 1, '2024-06-01', 'Completed'),
(1002, 2, '2024-06-03', 'Completed'),
(1003, 3, '2024-06-05', 'Completed'),
(1004, 1, '2024-06-07', 'Pending'),
(1005, 4, '2024-06-10', 'Completed');

-- Order Items
INSERT INTO order_items VALUES
(1, 1001, 101, 1, 75000),
(2, 1001, 103, 2, 6000),
(3, 1002, 102, 1, 40000),
(4, 1003, 105, 1, 8000),
(5, 1004, 104, 1, 65000),
(6, 1005, 103, 1, 6000);