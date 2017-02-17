-- This command file loads a customer database, dropping any tables with the same names
-- and rebuilding the schema and loading the data fresh. 
--
-- CS342, Spring 2017
-- Jahn Davis
-- Homework 2


------------------------------------Exercise 5.14---------------------------------------------------
-- Drop tables
DROP TABLE Customer;
DROP TABLE Order;
DROP TABLE Order_Item;
DROP TABLE Item;
DROP TABLE Shipment;
DROP TABLE Warehouse;

--Create schema for the database
CREATE TABLE Customer (
	customerNumber integer,
	customerName varchar(50) NOT NULL,
	customerCity varchar(70) NOT NULL,
	customerState varchar(70) NOT NULL,
	PRIMARY KEY (customerNumber)
	);

CREATE TABLE Order (
	orderNumber integer,
	orderDate date,
	customerNum integer,
	orderAmount integer,
	PRIMARY KEY (orderNumber),
	FOREIGN KEY (customerNum) REFERENCES Customer(customerNumber) ON DELETE SET NULL,
	CHECK (orderAmount > 0)
	);
	
CREATE TABLE Item (
	itemNumber integer,
	name varchar(50),
	unit_price float,
	PRIMARY KEY (itemNumber),
	CHECK (itemNumber > 0)
	);
	
CREATE TABLE Order_Item(
	orderNum integer,
	itemNum integer,
	quanity integer,
	FOREIGN KEY (orderNum) REFERENCES Order(orderNumber) ,
	FOREIGN KEY (itemNum) REFERENCES Item(itemNumber)
	);
	
CREATE TABLE Shipment(
	order_Number integer,
	warehouseNum integer,
	shipDate date,
	FOREIGN KEY (order_Number) REFERENCES Order(orderNumber) ON DELETE CASCADE,
	FOREIGN KEY (warehouseNum) REFERENCES Warehouse(warehouseNumber) ON DELETE SET NULL
	);
	
CREATE TABLE Warehouse(
	warehouseNumber integer,
	city varchar(70) NOT NULL,
	stateName varchar(50) NOT NULL,
	PRIMARY KEY (warehouseNumber)
	);

-- Sample data	
 INSERT INTO Customer VALUES (1, 'John Smith', 'Los Angeles', 'California');
 INSERT INTO Customer VALUES (2, 'Jane Doe', 'Dallas', 'Texas');
 INSERT INTO Customer VALUES (3, 'David Beckham', 'Grand Rapids', 'Michigan');


 INSERT INTO Order VALUES (1, '2017/02/12', 3, 16);
 INSERT INTO Order VALUES (2, '2016/12/22', 2, 10);
 INSERT INTO Order VALUES (3, '2017/01/20', 1, 4);
 INSERT INTO Order VALUES (4, '2017/01/12', 3, 6);
 

 INSERT INTO Item VALUES (1, 'Baseball', 15.00);
 INSERT INTO Item VALUES (2, 'Bat', 45.00);
 INSERT INTO Item VALUES (3, 'Helmet', 90.00);
 INSERT INTO Item VALUES (4, 'Cleats', 120.00);

 
 INSERT INTO Order_Item VALUES (1, 1, 8);
 INSERT INTO Order_Item VALUES (1, 2, 4);
 INSERT INTO Order_Item VALUES (1, 3, 4);
 INSERT INTO Order_Item VALUES (1, 4, 3);
 INSERT INTO Order_Item VALUES (2, 2, 5);
 

 INSERT INTO Shipment VALUES (3, 1, '2017/01/21');
 INSERT INTO Shipment VALUES (2, 1, '2017/12/23');
 INSERT INTO Shipment VALUES (1, 2, '2017/02/13');
 INSERT INTO Shipment VALUES (4, 2, '2017/01/13');
 

 INSERT INTO Warehouse VALUES (1, 'Boston', 'Massachusetts');
 INSERT INTO Warehouse VALUES (2, 'Chicago', 'Illinois');
 
 ---------------------------------------------------------------------------------------------
 --------------------------------------Exercise 5.20------------------------------------------
 -- a.
 
 
 -- c. There are some advantages to using surrogate keys. Surrogate keys, unlike natural keys, are not 
 -- connected to the real world or the business world, meaning that are not affected by changes in your
 -- business or the real world, thus making them easier to maintain. However, one of the main disadvantages
 -- to surrogate keys is that they’re not very readable to most people outside of whoever chose the keys. 
 -- Therefore, they aren’t very friendly for the end users of the database. 
 
 ---------------------------------------------------------------------------------------------
 --------------------------------------Question 3---------------------------------------------
 
 --Queries
 -- a. SELECT orderDate, orderAmount FROM Order, Customer WHERE customerName IS 'John Smith' ORDER BY orderDate DESC
	
 -- b. SELECT customerNumber FROM Customer c 
		-- WHERE EXISTS (SELECT NULL FROM Order o WHERE o.customerNum = c.customerNumber);
 
 -- c. SELECT customerNumber, customerName FROM Customer c WHERE EXISTS 
 --		(SELECT NULL FROM Order o where o.)