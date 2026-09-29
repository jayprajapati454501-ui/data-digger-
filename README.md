# Data Digger -- E-Commerce SQL Project

## Project Overview

**Data Digger** is a MySQL database project based on an e-commerce
store. It demonstrates how to create and manage related tables, insert
sample records, and retrieve or modify data using SQL queries.

## Project Objectives

-   Create a relational database using MySQL.
-   Practice CRUD operations (`INSERT`, `SELECT`, `UPDATE`, and
    `DELETE`).
-   Understand primary keys and foreign keys.
-   Retrieve data using filtering and sorting.
-   Use aggregate functions such as `SUM()`, `COUNT()`, `AVG()`,
    `MAX()`, and `MIN()`.
-   Explore relationships between tables using `JOIN`.

## Technologies Used

-   **Database:** MySQL
-   **Language:** SQL
-   **Recommended tool:** MySQL Workbench

## Database Name

`data_digger`

## Database Structure

The project contains four tables:

  -----------------------------------------------------------------------
  Table                   Purpose                 Main Columns
  ----------------------- ----------------------- -----------------------
  `Customers`             Stores customer         `CustomerID`, `Name`,
                          information             `Email`, `Address`

  `Orders`                Stores customer orders  `OrderID`,
                                                  `CustomerID`,
                                                  `OrderDate`,
                                                  `TotalAmount`

  `Products`              Stores product          `ProductID`,
                          information             `ProductName`, `Price`,
                                                  `Stock`

  `OrderDetails`          Stores products and     `OrderDetailID`,
                          quantities in each      `OrderID`, `ProductID`,
                          order                   `Quantity`, `SubTotal`
  -----------------------------------------------------------------------

### Table Relationships

-   `Orders.CustomerID` references `Customers.CustomerID`.
-   `OrderDetails.OrderID` references `Orders.OrderID`.
-   `OrderDetails.ProductID` references `Products.ProductID`.

These foreign keys connect order and product information to the related
records.

## Features and SQL Concepts

### 1. Database and Table Creation

The SQL script creates the `data_digger` database and the four tables
listed above.

### 2. Sample Data

The script inserts sample customer, order, product, and order-detail
records to demonstrate the queries.

### 3. CRUD Operations

-   **Create:** Add records using `INSERT`.
-   **Read:** Retrieve records using `SELECT`.
-   **Update:** Change customer addresses, order totals, and product
    prices using `UPDATE`.
-   **Delete:** Remove selected customers, orders, and out-of-stock
    products using `DELETE`.

### 4. Filtering and Sorting

The project demonstrates: - `WHERE` to filter records. - `BETWEEN` to
select products within a price range. - `ORDER BY` to sort products by
price. - `LIMIT` to restrict the number of returned rows. - Date
filtering to retrieve orders from the last 30 days.

### 5. Aggregate Functions

The project uses: - `SUM()` to calculate revenue and units sold. -
`COUNT()` to count records. - `AVG()` to calculate average order or
product prices. - `MAX()` and `MIN()` to find highest and lowest values.

### 6. JOIN and GROUP BY

JOIN queries combine customer, order, and product information.
`GROUP BY` is used to summarize quantities sold and customer spending.

## How to Run the Project

1.  Install and open MySQL Workbench, or use another MySQL client.
2.  Open the provided `data digger.sql` file.
3.  Connect to your MySQL server.
4.  Execute the SQL statements in order, starting with database
    creation.
5.  Run the `SELECT` queries to view the results.

> **Note:** The script includes `CREATE DATABASE` and `USE` statements.
> Run it on a MySQL account that has permission to create databases.
> Some `UPDATE` and `DELETE` statements modify or remove sample records,
> so run the script on a practice database.

## Example Queries

Retrieve all customers:

``` sql
SELECT * FROM Customers;
```

Find orders placed in the last 30 days:

``` sql
SELECT *
FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
```

Calculate total revenue from order details:

``` sql
SELECT SUM(SubTotal) AS Total_Revenue
FROM OrderDetails;
```

Show the top three products by units sold:

``` sql
SELECT
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS Total_Quantity_Sold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY Total_Quantity_Sold DESC
LIMIT 3;
```

## Learning Outcomes

After completing this project, a student can: - Create a MySQL database
with related tables. - Define primary and foreign key constraints. -
Insert, retrieve, update, and delete records. - Filter and sort data. -
Use aggregate functions to summarize information. - Combine related
tables with JOIN queries. - Write basic reports from relational data.

## Project Files

-   `data digger.sql` --- SQL script for creating the database, tables,
    sample records, and practice queries.
-   `README.md` --- Project documentation.

## Conclusion

Data Digger provides hands-on practice with core MySQL concepts through
a small e-commerce database. It brings together table creation,
relationships, data manipulation, filtering, joins, and aggregation in
one project.

