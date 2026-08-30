-- Week 3
USE csci340;
SELECT * FROM customers;
SELECT * FROM customers WHERE Country = "Germany";
SELECT * FROM products WHERE price BETWEEN 20 AND 100;
SELECT * FROM employees WHERE YEAR(BirthDate) > 1960;
SELECT ProductName, Price, Price*1.1 AS AfterTax FROM products;
SELECT * FROM customers WHERE CustomerName LIKE "C%";