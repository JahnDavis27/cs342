-- This command file loads a customer database, dropping any tables with the same names
-- and rebuilding the schema and loading the data fresh. 
--
-- CS342, Spring 2017
-- Jahn Davis
-- Homework 2


------------------------------------Exercise 5.14---------------------------------------------------
-- Drop tables
DROP TABLE Customer;
DROP TABLE Orders;
DROP TABLE Order_Item;
DROP TABLE Item;
DROP TABLE Shipment;
DROP TABLE Warehouse;

--Create schema for the database
CREATE TABLE Customer (
	ID integer,
	name varchar(50) NOT NULL,
	city varchar(70) NOT NULL,
	PRIMARY KEY (ID)
	);

CREATE TABLE Orders (
	ID integer,
	orderDate date,
	customerID integer,
	orderAmount float,
	PRIMARY KEY (ID),
	FOREIGN KEY (customerID) REFERENCES Customer(customerID) ON DELETE SET NULL,
	CHECK (orderAmount > 0)
	);
	--I set the delete action to set null because even if a customer is deleted, the order would probably be kept for reasons like logging orders in a year, or calculating profits, etc.
	
CREATE TABLE Item (
	ID integer,
	name varchar(50),
	unit_price float,
	PRIMARY KEY (itemNumber),
	CHECK (itemNumber > 0)
	);
	

CREATE TABLE Order_Item(
	orderID integer,
	itemID integer,
	quantity integer,
	FOREIGN KEY (orderID) REFERENCES Orders(ID) ON DELETE CASCADE,
	FOREIGN KEY (itemID) REFERENCES Item(ID) ON DELETE CASCADE
	);
	--If an order or item is deleted, it should be wiped from the database or any existing orders, therefore I used ON DELETE CASCADE.
	
CREATE TABLE Shipment(
	order_ID integer,
	warehouseID integer,
	shipDate date,
	FOREIGN KEY (order_ID) REFERENCES Orders(ID) ON DELETE CASCADE,
	FOREIGN KEY (warehouseID) REFERENCES Warehouse(ID) ON DELETE SET NULL
	);
	
	--I set the order to ON DELETE CASCADE because if there's no order, then there is no reason to keep it for a shipment. 
	--If a warehouse is deleted, I feel that a shipment should not be deleted...but that's just me. 

	
CREATE TABLE Warehouse(
	ID integer,
	city varchar(70) NOT NULL,
	PRIMARY KEY (ID)
	);

-- Sample data	
 INSERT INTO Customer VALUES (1, 'John Smith', 'Los Angeles');
 INSERT INTO Customer VALUES (2, 'Jane Doe', 'Dallas');
 INSERT INTO Customer VALUES (3, 'David Beckham', 'Grand Rapids');


 INSERT INTO Orders VALUES (1, '2017/02/12', 3, 16.0);
 INSERT INTO Orders VALUES (2, '2016/12/22', 2, 10.0);
 INSERT INTO Orders VALUES (3, '2017/01/20', 1, 4.0);
 INSERT INTO Orders VALUES (4, '2017/01/12', 3, 6.0);
 

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
 

 INSERT INTO Warehouse VALUES (1, 'Boston');
 INSERT INTO Warehouse VALUES (2, 'Chicago');
 
 ---------------------------------------------------------------------------------------------
 --------------------------------------Exercise 5.20------------------------------------------
 -- a. I would recommend keeping the surrogage keys that are already in place. These keys aren't connected to the 
 --		business, which makes sure that they won't be affected by changes at Calvin. The school will be change much
 -- 	more than the frequency of student ID changes. Using natural keys would make these changes incredibly messy to
 --		handle, and are more difficult to code. Therefore, I recommend keeping surrogate keys. 
 
 
 -- c. There are some advantages to using surrogate keys. Surrogate keys, unlike natural keys, are not 
 -- connected to the real world or the business world, meaning that are not affected by changes in your
 -- business or the real world, thus making them easier to maintain. However, one of the main disadvantages
 -- to surrogate keys is that they’re not very readable to most people outside of whoever chose the keys. 
 -- Therefore, they aren’t very friendly for the end users of the database. 
 
 ---------------------------------------------------------------------------------------------
 --------------------------------------Question 3---------------------------------------------
 
 --Queries
 -- a. All the order dates and amounts for orders made by a customer with a particular name (one that exists in your database), ordered chronologically by date
	SELECT orderDate, orderAmount FROM Orders, Customer 
	WHERE Orders.customerName IS 'John Smith' 
	ORDER BY Orders.orderDate ASC;
	
 -- b. All the customer ID numbers for customers who have made at least one order in the database
	SELECT DISTINCT customerID FROM Customer, Orders 
	WHERE Orders.customerID IS NOT NULL AND Orders.customerID = Customer.ID;
 
 -- c. The customer IDs and names of the people who have ordered an item with a particular name (one that exists in your database)
	SELECT customerNumber, customerName FROM Customer, Orders, Order_Item, Item 
	WHERE Order_Item.orderID = Orders.ID 
	AND Order_Item.itemID = Item.ID
	AND Customer.ID = Orders.customerID
	AND Item.name = 'Baseball'; 
	
	
