-- Week 4
-- 1. Count number of orders per customer.
SELECT * FROM orders;
SELECT * FROM customers;
SELECT CustomerID, COUNT(*) AS "Number of orders" FROM orders GROUP BY CustomerID;
SELECT CustomerName, COUNT(*) AS "Number of orders" FROM orders, customers WHERE orders.CustomerID = customers.CustomerID GROUP BY orders.CustomerID;

-- 2. Find average price of products in each category.
SELECT * FROM products;
SELECT * FROM categories;
SELECT CategoryID, AVG(Price) AS "Average Price" FROM products GROUP BY CategoryID;
SELECT CategoryName, AVG(Price) AS "Average Price" FROM products, categories WHERE products.CategoryID = categories.CategoryID GROUP BY products.CategoryID;

-- 3. List suppliers who supply more than 5 products.
SELECT * FROM suppliers;
SELECT SupplierID, COUNT(*) AS "Supply" FROM products GROUP BY SupplierID;
SELECT SupplierID, COUNT(*) AS "Supply" FROM products GROUP BY SupplierID HAVING COUNT(*) > 5;
SELECT SupplierName, COUNT(*) AS "Supply" FROM products, suppliers WHERE products.SupplierID = suppliers.SupplierID GROUP BY products.SupplierID HAVING COUNT(*) > 5;

-- 4. Show number of orders handled by each employee.
SELECT * FROM employees;
SELECT EmployeeID, COUNT(OrderID) AS "Number of orders" FROM orders GROUP BY EmployeeID;
SELECT CONCAT(FirstName, " ", LastName), COUNT(OrderID) AS "Number of orders" FROM orders, employees WHERE orders.EmployeeID = employees.EmployeeID GROUP BY orders.EmployeeID;

-- 5. Find countries with more than 10 customers.
SELECT * FROM customers;
SELECT Country, COUNT(CustomerID) AS "Number" FROM customers GROUP BY Country HAVING COUNT(CustomerID) > 10;