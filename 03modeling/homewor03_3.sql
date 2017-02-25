-----------------------Exercise 9.11---------------------------
--Schema design for MAIL_ORDER database

--Jahn Davis
--CS342
--February 24th, 2017
---------------------------------------------------------------

DROP TABLE Employee;
DROP TABLE Customer;
DROP TABLE Part;
DROP TABLE Orders;
DROP TABLE Part_Orders;
DROP TABLE Handles;


--Create the schema
CREATE TABLE Employee(
	ID integer PRIMARY KEY, 
	firstName varchar(20), 
	lastName varchar(20), 
	zip integer
	);
CREATE TABLE Customer(
	ID integer PRIMARY KEY, 
	firstName varchar(20), 
	lastName varchar(20), 
	zip integer
	);
	
CREATE TABLE Part(
	ID integer PRIMARY KEY, 
	name varchar(30), 
	price float, 
	stockQty integer
	);
	
CREATE TABLE Orders(
	ID integer PRIMARY KEY, 
	expectShipDate date, 
	actualShipDate date, 
	receiveDate date 
	);

--If employee is removed, order should still be fulfilled.
--If a customer is deleted, the order should be canceled, as there is no one to deliver it to.
--If an order is deleted, the record in this table should be deleted as well. 	
CREATE TABLE Handles(
	employeeID integer,
	customerNumber integer,
	orderNumber integer,
	FOREIGN KEY (employeeID) REFERENCES Employee(ID) ON DELETE SET NULL,
	FOREIGN KEY (customerNumber) REFERENCES Customer(ID) ON DELETE CASCADE.
	FOREIGN KEY (orderNumber) REFERENCES Orders(ID) ON DELETE CASCADE.
	PRIMARY KEY (employeeID, customerNumber, orderNumber)
	);

--If a part is deleted, it should be removed from any orders it is in, as it can no longer be a part of 
--			that order.

--If an order is deleted, all related records in the Part_Orders table should be deleted as well. 
CREATE TABLE Part_Orders(
	partNumber integer,
	orderNumber integer,
	quantity integer,
	FOREIGN KEY (partNumber) REFERENCES Part(ID) ON DELETE CASCADE,
	FOREIGN KEY (orderNumber) REFERENCES Orders(ID) ON DELETE CASCADE,
	PRIMARY KEY (partNumber, orderNumber)
	);
	
--Create sample data
INSERT INTO Employee VALUES (1, 'John', 'Cena', 43523);
INSERT INTO Employee VALUES (2, 'Optimus', 'Prime', 98465);
INSERT INTO Employee VALUES (3, 'Jason', 'Bourne', 32458);

INSERT INTO Customer(1, 'Jahn', 'Davis', '49512');
INSERT INTO Customer(2, 'Vonetta', 'Davis', '46342');
INSERT INTO Customer(3, 'Jerry', 'Davis', '46342');

INSERT INTO Part VALUES (1, 'Steel', 49.99, 1500);
INSERT INTO Part VALUES (2, 'Titanium', 30.99, 900);
INSERT INTO Part VALUES (3, 'Bolts', 2.99, 25000);

INSERT INTO Orders VALUES (1, '16-May-2016', '17-May-2016', '19-May-2016');
INSERT INTO Orders VALUES (2, '10-Feb-2017', '12-Feb-2017', '13-Feb-2017');
INSERT INTO Orders VALUES (3, '01-Jun-2016', '03-June-2016', '10-June-2016');
INSERT INTO Orders VALUES (4, '30-Jan-2015', '02-Feb-2015', '04-Feb-2015');

INSERT INTO Handles VALUES (1, 3, 1);
INSERT INTO Handles VALUES (1, 2, 2);
INSERT INTO Handles VALUES (3, 1, 4);
INSERT INTO Handles VALUES (2, 1, 3);

INSERT INTO Part_Orders VALUES (1, 1, 100);
INSERT INTO Part_Orders VALUES (2, 1, 15);
INSERT INTO Part_Orders VALUES (1, 3, 45);
INSERT INTO Part_Orders VALUES (3, 2, 4500);
INSERT INTO Part_Orders VALUES (3, 4, 3290);

-- Sample queries
SELECT * FROM Employee;

SELECT Employee.lastName, Orders.orderNumber FROM Orders, Handles, Employee
WHERE Employee.empNumber = Handles.empNumber AND Handles.orderNumber = Orders.orderNumber
AND Employee.firstName = 'Optimus' ORDER BY Orders.orderNumber DESC;

SELECT * FROM Orders, Customer, Handles WHERE Customer.custNumber = Handles.custNumber
AND Handles.orderNumber = Orders.orderNumber AND Customer.custNumber = 1;
