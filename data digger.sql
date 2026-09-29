CREATE DATABASE data_digger;
USE data_digger;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Address VARCHAR(255)
);



INSERT INTO Customers (CustomerID, Name, Email, Address) VALUES
(1, 'Alice', 'alice@gmail.com', 'Mumbai'),
(2, 'Bob', 'bob@gmail.com', 'Delhi'),
(3, 'Charlie', 'charlie@gmail.com', 'Ahmedabad'),
(4, 'David', 'david@gmail.com', 'Surat'),
(5, 'Alice', 'alice2@gmail.com', 'Pune');
          
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
 select * from  Customers
 
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, CURDATE() - INTERVAL 5 DAY, 2500.00),
(102, 2, CURDATE() - INTERVAL 10 DAY, 1500.00),
(103, 3, CURDATE() - INTERVAL 20 DAY, 4200.00),
(104, 4, CURDATE() - INTERVAL 40 DAY, 800.00),
(105, 1, CURDATE() - INTERVAL 2 DAY, 3200.00);
    

 
 CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL
);


    
    
INSERT INTO Products (ProductID, ProductName, Price, Stock) VALUES
(201, 'Laptop', 55000.00, 10),
(202, 'Smartphone', 25000.00, 20),
(203, 'Headphones', 1500.00, 50),
(204, 'Keyboard', 800.00, 30),
(205, 'Mouse', 500.00, 0);





CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    SubTotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails
(OrderDetailID, OrderID, ProductID, Quantity, SubTotal) VALUES
(301, 101, 203, 2, 3000.00),
(302, 101, 204, 1, 800.00),
(303, 102, 202, 1, 25000.00),
(304, 103, 201, 1, 55000.00),
(305, 105, 203, 3, 4500.00);

---  CUSTOMER QUERIES

-- Update a customer's address
UPDATE Customers
SET Address = 'Bangalore'
WHERE CustomerID = 1;

-- Delete a customer using CustomerID
-- Customer 5 has no order, so this is safe to demonstrate.
DELETE FROM Customers
WHERE CustomerID = 5;





-- Display all customers named Alice
SELECT * FROM Customers
WHERE Name = 'Alice';


--- 7. ORDER QUERIES
-- Retrieve all orders made by CustomerID 1
SELECT *
FROM Orders
WHERE CustomerID = 1;

-- Update an order's total amount
UPDATE Orders
SET TotalAmount = 2800.00
WHERE OrderID = 101;


-- Retrieve orders placed in the last 30 days
SELECT *
FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;

-- Highest, lowest and average order amount
SELECT
    MAX(TotalAmount) AS Highest_Order,
    MIN(TotalAmount) AS Lowest_Order,
    AVG(TotalAmount) AS Average_Order
FROM Orders;




-- Delete an order using OrderID
-- Order 104 has no OrderDetails, so it is safe to delete.
DELETE FROM Orders
WHERE OrderID = 104;

-- Retrieve products sorted by price descending
SELECT *
FROM Products
ORDER BY Price DESC;

-- Update the price of a specific product
UPDATE Products
SET Price = 1400.00
WHERE ProductID = 203;


-- Retrieve products priced between Rs.500 and Rs.2000
SELECT *
FROM Products
WHERE Price BETWEEN 500 AND 2000;

-- Most expensive product
SELECT *
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);

-- Cheapest product
SELECT *
FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products);
 
 -- Cheapest product
SELECT *
FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products);

-- Delete products that are out of stock
DELETE FROM Products
WHERE Stock = 0;


-- Retrieve all details for OrderID 101
SELECT *
FROM OrderDetails
WHERE OrderID = 101;

-- Calculate total revenue
SELECT SUM(SubTotal) AS Total_Revenue
FROM OrderDetails;

-- Top 3 most ordered products
SELECT
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS Total_Quantity_Sold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY Total_Quantity_Sold DESC
LIMIT 3;

-- Count how many order records contain ProductID 203
SELECT
    ProductID,
    COUNT(*) AS Times_Sold
FROM OrderDetails
WHERE ProductID = 203
GROUP BY ProductID;

-- Total units sold for ProductID 203
SELECT
    ProductID,
    SUM(Quantity) AS Total_Units_Sold
FROM OrderDetails
WHERE ProductID = 203
GROUP BY ProductID;



 

