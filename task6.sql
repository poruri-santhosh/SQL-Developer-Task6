-- Task 6: Subqueries and Nested Queries
-- Database: SQLite / MySQL

-----------------------------------------------------
-- 1. Customers Table
-----------------------------------------------------
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

-----------------------------------------------------
-- 2. Orders Table
-----------------------------------------------------
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    product VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-----------------------------------------------------
-- 3. Insert Sample Data
-----------------------------------------------------
INSERT INTO Customers VALUES (1, 'Alice', 'Delhi');
INSERT INTO Customers VALUES (2, 'Bob', 'Mumbai');
INSERT INTO Customers VALUES (3, 'Charlie', 'Chennai');
INSERT INTO Customers VALUES (4, 'David', 'Kolkata');

INSERT INTO Orders VALUES (101, 1, 50000, 'Laptop');
INSERT INTO Orders VALUES (102, 1, 1500, 'Mouse');
INSERT INTO Orders VALUES (103, 2, 3000, 'Keyboard');
INSERT INTO Orders VALUES (104, 3, 20000, 'Phone');
INSERT INTO Orders VALUES (105, 3, 800, 'Charger');

-----------------------------------------------------
-- 4. Scalar Subquery (single value)
-- Find customers whose total order amount > average order amount
-----------------------------------------------------
SELECT name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    GROUP BY customer_id
    HAVING SUM(amount) > (SELECT AVG(amount) FROM Orders)
);

-----------------------------------------------------
-- 5. Correlated Subquery
-- Find customers who have placed orders greater than 10,000
-----------------------------------------------------
SELECT name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
    AND o.amount > 10000
);

-----------------------------------------------------
-- 6. Subquery in FROM (Derived Table)
-- Find top spenders by total order amount
-----------------------------------------------------
SELECT t.customer_id, t.total_amount
FROM (
    SELECT customer_id, SUM(amount) AS total_amount
    FROM Orders
    GROUP BY customer_id
) t
ORDER BY t.total_amount DESC;

-----------------------------------------------------
-- 7. Subquery with IN
-- Find customers who ordered specific products (Laptop or Phone)
-----------------------------------------------------
SELECT name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    WHERE product IN ('Laptop','Phone')
);

-----------------------------------------------------
-- 8. Subquery with = (Scalar)
-- Find the customer with the maximum order amount
-----------------------------------------------------
SELECT name
FROM Customers
WHERE customer_id = (
    SELECT customer_id
    FROM Orders
    WHERE amount = (SELECT MAX(amount) FROM Orders)
);
