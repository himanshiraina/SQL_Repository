--Database TechShop
CREATE DATABASE TechShop;

-- Customers table 
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);
-- Products table 
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);
--Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
--OrderDetails 
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
--Inventory
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert values into Customers table 
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
    (1, 'John', 'Doe', 'johndoe@gmail.com', '1234567890', '365 Main St'),
    (2, 'Ram', 'Anand', 'ramanand@gmail.com', '9876543210', '367 Jalsa Roorkee'),
    (3, 'Alice', 'Hao', 'alicehao@gmail.com', '4587543210', '020 Oak St'),
    (4, 'Aman', 'Das', 'amandas@gmail.com', '9894576310', '100 Surat'),
    (5, 'Raj', 'Sharma', 'rajsharma@gmail.com', '6005842365', '978 Ram Nagar'),
    (6, 'Krishan', 'Raaj', 'krishanraaj@gmail.com', '7005213658', '634 Delhi'),
    (7, 'Michael', 'Johnson', 'michaelj@gmail.com', '9778542697', '789 Elm St'),
    (8, 'Kriti', 'Kapoor', 'kritikapoor@gmail.com', '6448751236', '200 Bhopal'),
    (9, 'Pooja', 'Bhatt', 'poojabhatt@gmail.com', '9797856321', '256 Dehradun'),
    (10, 'Smith', 'Lace', 'smithlace@gmail.com', '8546975216', '444 Gopalganj');

-- Insert values into Products table 
INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
    (1, 'Smartphone', 'High-end smartphone with advanced features', 999.99),
    (2, 'Laptop', 'Thin and lightweight laptop with powerful performance', 1299.99),
    (3, 'Tablet', 'Portable tablet with a high-resolution display', 599.99),
    (4, 'Headphones', 'Wireless noise-cancelling headphones', 249.99),
    (5, 'Smartwatch', 'Fitness tracking smartwatch with heart rate monitor', 199.99),
    (6, 'Gaming Console', 'Next-generation gaming console', 499.99),
    (7, 'Wireless Earbuds', 'True wireless earbuds with long battery life', 149.99),
    (8, 'Camera', 'High-resolution digital camera with advanced features', 799.99),
    (9, 'Drone', 'Quadcopter drone with 4K camera', 1299.99),
    (10, 'Smart Home Hub', 'Central control for smart home devices', 199.99);

-- Insert values into Orders table 
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (101, 1, '2023-11-01', 899.99),
    (201, 2, '2023-11-02', 749.99),
    (301, 3, '2023-11-03', 1599.99),
    (401, 4, '2023-11-04', 499.99),
    (501, 5, '2023-11-05', 299.99),
    (601, 6, '2023-11-06', 1149.99),
    (701, 7, '2023-11-07', 699.99),
    (801, 8, '2023-11-08', 899.99),
    (901, 9, '2023-11-09', 349.99),
    (1001, 10, '2023-11-10', 1899.99);

-- Insert values into OrderDetails table 
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
    (1, 101, 1, 2),
    (2, 201, 3, 1),
    (3, 301, 6, 1),
    (4, 401, 2, 3),
    (5, 501, 4, 2),
    (6, 601, 9, 1),
    (7, 701, 7, 1),
    (8, 801, 8, 2),
    (9, 901, 5, 1),
    (10, 1001, 10, 3);

-- Insert values into Inventory table 
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
    (1, 1, 50, '2023-11-01'),
    (2, 2, 75, '2023-11-02'),
    (3, 3, 100, '2023-11-03'),
    (4, 4, 30, '2023-11-04'),
    (5, 5, 60, '2023-11-05'),
    (6, 6, 25, '2023-11-06'),
    (7, 7, 80, '2023-11-07'),
    (8, 8, 40, '2023-11-08'),
    (9, 9, 20, '2023-11-09'),
    (10, 10, 55, '2023-11-10');

SELECT * from Products
SELECT * FROM Orders
SELECT * FROM OrderDetails
select * from Customers
select * from Inventory

--1.Write an SQL query to retrieve the names and emails of all customers. 
select FirstName, LastName, Email from Customers 

--2.Write an SQL query to list all orders with their order dates and corresponding customer names. 
select Orders.OrderDate, Customers.FirstName, Customers.LastName from Orders join Customers on Orders.CustomerID=Customers.CustomerID 

--3.Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address. 
INSERT INTO Customers(CustomerID, FirstName,LastName,Address) 
Values (11,'Himanshi', 'Raina','Jammu')

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%. 
update Products 
set Price=Price+Price*0.1 

--5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter. 
declare @id int 
set @id=101 
delete from Orders where OrderID=@id 
delete from OrderDetails where OrderID=@id 

--6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information. 
INSERT INTO Orders VALUES(6001,11,'2022-05-16',1400)

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information. 
UPDATE Customers
SET Email='jd@gmail.com', Address='123 Mumbai'
WHERE CustomerID=1

--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table. 
update Orders
SET TotalAmount=(SELECT SUM(D.Quantity*P.Price)
FROM OrderDetails as D
JOIN Products as P
on D.ProductID=P.ProductID
WHERE D.OrderID=Orders.OrderID
)

--9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter. 
declare @cid int 
set @cid=7 
delete from Orders where CustomerID=@cid 
delete from OrderDetails where OrderID in
(select OrderID from Orders where CustomerID=@cid) 

--10. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details. 
INSERT INTO Products
VALUES(11,'TV','Television is entertaining',25000)

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status. 
ALTER Table Orders
ADD Status VARCHAR(50)
UPDATE Orders
set Status='Shipped'
WHERE TotalAmount>1400

--12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table. 
ALTER table Customers 
ADD No_of_orders int default 0

UPDATE Customers
SET No_of_orders=(SELECT count(*) from Orders
WHERE Customers.CustomerID=Orders.CustomerID);


--Aggregate Functions 

--1.Write an SQL query to find out which customers have not placed any orders. 
select * from Customers where No_of_orders=0 

SELECT C.FirstName, O.CustomerID
FROM Customers as C
LEFT JOIN Orders as O
ON C.CustomerID=O.CustomerID
WHERE O.CustomerID IS NULL 

--2. Write an SQL query to find the total number of products available for sale. 
SELECT COUNT(*) FROM Products
AS TotalProducts

--3. Write an SQL query to calculate the total revenue generated by TechShop.  
SELECT SUM(TotalAmount) from Orders as TotalRevenue

--4.Write an SQL query to calculate the average quantity ordered for products in a specific category.Allow users to input the category name as a parameter. 
ALTER table Products
ADD Category VARCHAR(50)
UPDATE Products
SET Category='electronics' where ProductID IN(3,4,6,10)
UPDATE Products
SET Category='non-electronics' where ProductID=11

SELECT AVG(D.Quantity) as AverageQuantity, P.Category
from OrderDetails AS D
JOIN Products as P
on D.ProductID=P.ProductID
GROUP BY P.Category


--5.Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter. 
SELECT SUM(TotalAmount) AS TotalRevenue,c.CustomerID
from Orders AS o
join Customers as c
on o.CustomerID=c.CustomerID
GROUP BY c.CustomerID


--6.Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed. 
SELECT FirstName, LastName, No_of_orders from Customers
where No_of_orders=(SELECT MAX(No_of_orders) from Customers)

--7.--Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders. 
SELECT P.Category from Products AS P
JOIN OrderDetails AS OD
ON P.ProductID=OD.ProductID
WHERE OD.Quantity=(SELECT MAX(OD.Quantity) from OrderDetails)
GROUP BY Category


--8.Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending. 

SELECT C.FirstName,C.LastName,O.TotalAmount 
from Customers AS C
JOIN Orders AS O
ON C.CustomerID=O.CustomerID
WHERE O.TotalAmount=(SELECT MAX(TotalAmount) FROM Orders)

--9.Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers. 

SELECT AVG(TotalAmount%No_of_orders) AS averageordervalue
from Orders as o
join Customers as c
on o.CustomerID=c.CustomerID

--10.Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count 
SELECT FirstName,LastName
from Customers as c
join Orders as o
on c.CustomerID=o.CustomerID
SELECT COUNT(*) AS TotalNoOfOrders FROM Orders 


--Joins 
SELECT * from Products
SELECT * FROM Orders
SELECT * FROM OrderDetails
SELECT * from Products
select * from Customers

--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order. 
SELECT OrderId,OrderDate,FirstName,LastName 
FROM Orders 
join Customers 
ON Orders.CustomerID=Customers.CustomerID 

--2. Write an SQL query to find the total revenue generated by each electronic gadget product.Include the product name and the total revenue. 
SELECT SUM(D.Quantity*P.Price) AS TotalRevenue, P.ProductName 
FROM OrderDetails D 
join Products P 
ON D.ProductID=P.ProductID 
GROUP BY P.ProductName 

--3. Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information. 
SELECT COUNT(*) AS NoOfPurchase, C.FirstName,C.Phone, C.CustomerID  
FROM Orders O 
join Customers C 
ON O.CustomerID=C.CustomerID 
GROUP BY C.FirstName,C.Phone,C.CustomerID 
HAVING COUNT(*)>=1 

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered. 
SELECT P.ProductName, O.Quantity 
FROM Products AS P 
join OrderDetails AS O 
ON P.ProductID=O.ProductID 
WHERE O.Quantity=(SELECT MAX(Quantity) from OrderDetails) 

--5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories. 
alter table Products 
ADD Category VARCHAR(50);
update Products
set Category ='Electronics'
where ProductID%2=0
update Products
set Category ='Non-Electronics'
where ProductID%2!=0

SELECT ProductName, Category
from Products;

--6.  Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value. 
SELECT AVG(O.TotalAmount) as AverageOrderValue, C.FirstName, C.LastName 
FROM Orders O 
join Customers C 
ON O.CustomerID=C.CustomerID 
GROUP BY C.FirstName, C.LastName 

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID,customer information, and the total revenue. 
SELECT O.OrderID,C.CustomerID,C.FirstName,O.TotalAmount 
FROM Orders O 
join Customers C 
ON O.CustomerID=C.CustomerID 
WHERE O.TotalAmount=(SELECT MAX(TotalAmount) FROM Orders) 

--8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered. 
SELECT p.ProductName, COUNT(od.OrderID) AS OrderCount
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
WHERE p.Category='Electronics'
GROUP BY p.ProductName
ORDER BY OrderCount DESC;
  
--9.Write an SQL query to find customers who have purchased a specific electronic gadget product.Allow users to input the product name as a parameter. 
declare @product varchar(100) 
set @product='Laptop' 
select C.CustomerID from Customers C 

--10. Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters. 
declare @stdate date,@eddate date 
set @stdate='2023-11-26' 
set @eddate='2023-11-28' 
SELECT SUM(TotalAmount) 
FROM Orders AS O 
join OrderDetails AS OD 
on O.OrderID=OD.OrderID 
where O.OrderDate between @stdate and @eddate 