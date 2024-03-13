Create Database Customers_Orders_Products 

Use Customer_Orders_Products
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);
 Select* from Customers

INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com');

  CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

 Select* from Orders

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1);

  
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

Select* from Products

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99);


  ----------TASK 1---------------------------------------

  -------1.	Write a query to retrieve all records from the Customers table..

   Select* from Customers

   -----2.	Write a query to retrieve the names and email addresses of customers whose names start with 'J'.

   SELECT Name, Email 
FROM Customers
WHERE Name LIKE 'J%';

-----3.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..

SELECT OrderID, ProductName, Quantity 
FROM Orders;


---------4.	Write a query to calculate the total quantity of products ordered.

SELECT SUM(Quantity) AS TotalQuantity 
FROM Orders;

------5.	Write a query to retrieve the names of customers who have placed an order.

SELECT DISTINCT c.Name 
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

----6.	Write a query to retrieve the products with a price greater than $10.00.

SELECT * 
FROM Products 
WHERE Price > 10.00;


----7.	Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.

SELECT c.Name, o.OrderDate 
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= '2023-07-05';

----8.	Write a query to calculate the average price of all products.

SELECT AVG(Price) AS AveragePrice 
FROM Products;

-----9.	Write a query to retrieve the customer names along with the total quantity of products they have ordered.


SELECT c.Name, SUM(o.Quantity) AS TotalQuantityOrdered 
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name;

----10.	Write a query to retrieve the products that have not been ordered.

SELECT * 
FROM Products 
WHERE ProductID NOT IN (SELECT DISTINCT ProductID FROM Orders);

---------------------------------------------------------------------------------------------------------------------------

------ TASK 2----------------------------------

----1.	Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.

Select*from Orders
Select * from Customers

Select Customers.Name,orders.ProductName,orders.OrderDate,orders.Quantity from on customers.customerid=orders.customer ID


---2.	Write a query to calculate the average price of products for each product category.

SELECT p.Price, AVG(p.Price) AS AveragePrice
FROM Products p
GROUP BY p.Price;


----3.	Write a query to retrieve the customers who have not placed any orders.

select Customers.CustomerID, Customers.Name, Orders.ProductName, Orders.orderDate, Orders.Quantity from Customers inner join orders
  on customers.CustomerID=orders.customerID where orders.OrderDate is null

---4.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'.

select * from Orders
select * from Customers

Select Customers.Name,Orders.OrderID,Orders.Quantity from Customers left Join Orders on Customers.CustomerID=Orders.CustomerID where Name like 'M%'


----5.	Write a query to calculate the total revenue generated from all orders.

Select SUM(QUANTITY) 'Total Revenue' from Orders


----6.	Write a query to retrieve the customer names along with the total revenue generated from their orders.

select orders.productName, Customers.name,quantity*products.price as total_revenue_order from customers
join orders on customers.customerID=orders.customerID join products on orders.customerID=products.productID


---7.	Write a query to retrieve the customers who have placed at least one order for each product category.

select orders.ProductName, Customers.Name,Orders.Quantity from Customers left join  Orders
on Customers.CustomerID=Orders.CustomerID where Quantity  is not null
order by ProductName

--- 8.	Write a query to retrieve the customers who have placed orders on consecutive days

Select Customers.Name ,Orders.OrderDate FROM  Customers Left Join Orders on Customers.CustomerID=Orders.CustomerID
order by OrderDate
 --- 9.	Write a query to retrieve the top 3 products with the highest average quantity ordered

 select top 3 Customers.Name,Orders.OrderID, Orders.ProductName, Orders.Quantity from Customers left join  Orders
on Customers.CustomerID=Orders.CustomerID 
order by Quantity desc

 ---10.	Write a query to calculate the percentage of orders that have a quantity greater than the average quantity.
 SELECT 
    COUNT(CASE WHEN quantity > avg_quantity THEN 1 END) * 100.0 / COUNT(*) AS percentage_more_than_average
FROM 
    orders,
    (SELECT AVG(quantity) AS avg_quantity FROM orders) AS avg_table;
 
Task 3:-


---1.	Write a query to retrieve the customers who have placed orders for all products.


SELECT CustomerID
FROM Orders
GROUP BY CustomerID
HAVING COUNT(DISTINCT CustomerID) = (SELECT COUNT(DISTINCT ProductID) FROM Products)
  --2.	Write a query to retrieve the products that have been ordered by all customers.

 select customers.name,orders.productName from customers join orders on 
customers.customerID = orders.customerID order by orders.productName

-----------------------------3.	Write a query to calculate the total revenue generated from orders placed in each month.
select (orders.quantity*products.price)  'total_revenue',orders.orderdate from orders full join
products on orders.orderID = products.productID order by orderdate desc
select * from orders


-----------------------------4.	Write a query to retrieve the products that have been ordered by more than 50% of the customers.





-----------------------------5.	Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.
select top 5 (quantity*price) as spent_money,customers.Name,orders.customerID,products.productName from orders join products on 
orders.orderID = products.productID join customers on customers.customerID =orders.customerID  order by spent_money desc




-----------------------------6.	Write a query to calculate the running total of order quantities for each customer.


-----------------------------7.	Write a query to retrieve the top 3 most recent orders for each customer.
select  top 3(orderdate) recenct_order,
orderID,ProductName 
from orders
order by orderdate desc


-----------------------------8.	Write a query to calculate the total revenue generated by each customer in the last 30 days.
select sum(quantity*price)total_revenue_last_month from orders join products on 
orders.orderID = products.productID where orderdate between '2023/07/01' and '2023/07/30'
select * from Products
select * from orders
select * from customers
-----------------------------9.	Write a query to retrieve the customers who have placed orders for at least two different product categories.

select c.customerID,c.name from customers c inner join
(select CustomerID from Orders group by CustomerID having
count(distinct ProductName)>2) orders on c.customerID = orders.customerID

-----------------------------10.	Write a query to calculate the average revenue per order for each customer.
select sum(quantity*price)/25 as avg_revenue_customer from orders join products on orders.orderID = products.productID 


-----------------------------11.	Write a query to retrieve the customers who have placed orders for every month of a specific year.
select customerID from orders where month(OrderDate)= '07' and year(orderdate)='2023'



----------------------------12.	Write a query to retrieve the customers who have placed orders for a specific product in consecutive months.
select ProductName ,orderdate from orders order by ProductName

-------------------------13.	Write a query to retrieve the products that have been ordered by a specific customer at least twice.

