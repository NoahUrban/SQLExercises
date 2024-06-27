/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
-- cat id 1 is computers
SELECT categories.name, products.name
FROM products
LEFT JOIN categories
ON products.categoryid = categories.categoryid
WHERE categories.categoryid = 1 AND products.categoryid = 1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
-- tables - products and reviews
-- product id is UID
SELECT products.name, products.price, reviews.rating
FROM products
LEFT JOIN reviews
ON products.productid = reviews.productid
ORDER BY rating DESC;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
-- Tables: sales and employees
-- employeeID is UID
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
-- Tables: sales and employees
-- employeeID is UID
SELECT employees.firstname, employees.lastname, sum(sales.quantity)
FROM sales
INNER JOIN employees
ON sales.employeeid = employees.employeeid
GROUP BY employees.firstname, employees.lastname
ORDER BY sum(sales.quantity) DESC
Limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
-- Tables: departments amd categories
-- categoryid is UID 
-- games = 3; appliances = 1;
SELECT categories.name, departments.name
FROM categories
LEFT JOIN departments
ON categories.departmentid = departments.departmentid
WHERE categories.name in ('Appliances', 'Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
-- Tables: sales and products
-- ProductID is UID
SELECT products.name, sum(sales.quantity), sum(sales.priceperunit)
FROM products
INNER JOIN sales
ON products.productid = sales.productid
WHERE products.name IN ('EAGLES: Hotel California');

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
-- Tables: products and reviews
-- ProductID is UID
-- visio productID is 857

-- select productid from products
-- where name like 'Visio TV';

SELECT products.name, reviews.reviewer, reviews.rating, reviews.comment
FROM reviews
LEFT JOIN products
ON reviews.productid = products.productid
WHERE products.productid IN (857);

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

-- Tables: employees, sales, and products
-- Products and sales UID is productid
-- sales and employees UID is employeeid
SELECT employees.employeeid,
       employees.firstname,
       employees.lastname,
       products.name,
       SUM(sales.quantity)
FROM sales
JOIN products ON products.productid = sales.productid
JOIN employees ON employees.employeeid = sales.employeeid
GROUP BY employees.employeeid, employees.firstname, employees.lastname, products.name
ORDER BY SUM(sales.quantity) DESC;
