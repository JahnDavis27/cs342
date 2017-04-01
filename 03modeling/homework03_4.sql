-- Lab03 extension
--
-- CS 342, Spring, 2017
-- Jahn Davis

--Drop tables
DROP TABLE Person;
DROP TABLE HouseHold;
DROP TABLE Request;

--Create schema
CREATE TABLE HouseHold(
	ID integer PRIMARY KEY,
	street varchar(30),
	city varchar(30),
	state varchar(2),
	zipcode char(5),
	phoneNumber char(12)
	);
	

CREATE TABLE Person (
	ID integer PRIMARY KEY,
	householdID integer,
	homegroupID integer,
	title varchar(4),
	firstName varchar(15),
	lastName varchar(15),
	role varchar(15),
	mentorID integer,
	membershipStatus char(1) CHECK (membershipStatus IN ('m', 'a', 'c'))
	FOREIGN KEY (householdID) REFERENCES HouseHold(ID) ON DELETE SET NULL,
	FOREIGN KEY (homegroupID) REFERENCES Homegroup(ID) ON DELETE SET NULL
	FOREIGN KEY (mentorID) REFERENCES Person(ID) ON DELETE SET NULL
	);

CREATE TABLE Team (
	ID integer PRIMARY KEY,
	name varchar(30)
	);

-- If a Person record is removed, we would remove any record of them being on a team. 
-- If a Team record is removed, we would remove any record of a team existing. 
CREATE TABLE Person_Team (
	personID integer,
	teamID integer,
	role varchar(15),
	startDate date,
	endDate date,
	FOREIGN KEY (personID) REFERENCES Person(ID) ON DELETE CASCADE,
	FOREIGN KEY (teamID) REFERENCES Team(ID) ON DELETE CASCADE,
	CONSTRAINT PK_D PRIMARY KEY (personID, teamID)
	);

	
CREATE TABLE Request (
	submitDate date,
	text_char varchar(50),
	access_var varchar(50),
	response varchar(50),
	requestorID integer,
	responderID integer,
	FOREIGN KEY (requestorID) REFERENCES Household(ID) ON DELETE CASCADE,
	FOREIGN KEY (responderID) REFERENCES Person(ID) ON DELETE SET NULL
	);
	

INSERT INTO Household VALUES (0,'2347 Oxford Dr. SE','Grand Rapids','MI','49506','616-243-5680');
INSERT INTO Household VALUES (1,'4093 Forest Creek Rd SE','Grand Rapids','MI','49512','219-617-9554');

INSERT INTO Person VALUES (0,'mr.','Keith','VanderLinden', 0, 'husband', 'm', 0, NULL);
INSERT INTO Person VALUES (1,'ms.','Brenda','VanderLinden', 0, 'wife', 'm', 0, 0);
INSERT INTO Person VALUES (2,'mr.','Jahn','Davis', 1, 'son', 'm', NULL, 0);


INSERT INTO Homegroup VALUES(0,'Proverbs');

INSERT INTO Team VALUES (0, 'Pastors');
INSERT INTO Team VALUES (1, 'Music');

INSERT INTO Person_Team VALUES (2, 0, 'Outreach', '01-Feb-2017', '01-Oct-2017');
INSERT INTO Person_Team VALUES (0, 1, 'Leader', '19-Jan-2017', '19-Jul-2017');

INSERT INTO Request VALUES ('12-Mar-2016', 'Please pray for my family', 'placeholder', 'Know we are praying', 0, 0);
INSERT INTO Request VALUES ('03-Feb-2016', 'Please pray for my job interview', 'placeholder text', 'Know we are praying for you', 0, 1);
INSERT INTO Request VALUES ('23-Oct-2014', 'My grandfather passed away', 'text placeholder', 'We are sorry for your loss', 1, 2);

-- Sample queries
SELECT * FROM Homegroup;

SELECT Person.ID FROM Person, Homegroup WHERE Person.homegroupID = Homegroup.ID;

SELECT Person.firstName, Team.name FROM Person, Team, Person_Team
WHERE Person.ID = Person_Team.personID AND Team.ID = Person_Team.teamID;

SELECT Person.firstName, Person_Team.endDate FROM Person, Person_Team
WHERE Person.ID = Person_Team.personID ORDER BY Person_Team.endDate ASC;

SELECT submitDate, text_char, Household.ID FROM Household, Request
WHERE Household.ID = Request.requestorID AND Household.ID = 0
ORDER BY submitDate DESC;
