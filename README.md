# Task 6 – Subqueries and Nested Queries

## 🎯 Objective
Learn to use **scalar, correlated, and nested subqueries** in different clauses of SQL.

## 📂 Tables Created
1. **Customers**
   - `customer_id` (Primary Key)
   - `name`
   - `city`
2. **Orders**
   - `order_id` (Primary Key)
   - `customer_id` (Foreign Key → Customers.customer_id)
   - `amount`
   - `product`

## 📊 Sample Data
- Customers: Alice, Bob, Charlie, David
- Orders: Laptop, Mouse, Keyboard, Phone, Charger

## 🔗 Queries Implemented
1. **Scalar Subquery** – Customers with total order amount > average order amount  
2. **Correlated Subquery** – Customers with an order > 10,000  
3. **Derived Table (FROM Subquery)** – Top spenders by total orders  
4. **Subquery with IN** – Customers who ordered Laptop/Phone  
5. **Scalar Subquery with =** – Customer who placed the max order  

## ✅ Key Concepts
- **Subquery**: Query inside another query  
- **Scalar Subquery**: Returns a single value  
- **Correlated Subquery**: Depends on outer query values  
- **Derived Table**: Subquery in `FROM` clause  

## ⚡ Tools Used
- DB Browser for SQLite / MySQL Workbench

---

📤 After running queries, push `.sql` + screenshots + this README to GitHub.
