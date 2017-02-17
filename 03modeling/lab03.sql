-- Lab03
--
-- CS 342, Spring, 2017
-- Jahn Davis

--Drop tables
DROP TABLE Person;
DROP TABLE HouseHold;
DROP TABLE Mentorship;
DROP TABLE Homegroup;
DROP TABLE PersonTeam;
DROP TABLE Team;

--Create schema
CREATE TABLE HouseHold(
	ID integer PRIMARY KEY,
	street varchar(30),
	city varchar(30),
	state varchar(2),
	zipcode char(5),
	phoneNumber char(12)
	);
	
CREATE TABLE Homegroup(
	ID integer PRIMARY KEY,
	name varchar(25)
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
	);
	
CREATE TABLE Mentorship(
	mentorID integer,
	menteeID integer PRIMARY KEY,
	FOREIGN KEY (mentorID) REFERENCES Person(ID),
	FOREIGN KEY (menteeID) REFERENCES Person(ID)	
	);

CREATE TABLE Team(
	ID integer PRIMARY KEY,
	name varchar(25),
	mandate varchar(25)
	);
	
CREATE TABLE PersonTeam(
	personID integer,
	teamID integer,
	role varchar(25),
	FOREIGN KEY (personID) REFERENCES Person(ID) ON DELETE CASCADE,
	FOREIGN KEY (teamID) REFERENCES Team(ID) ON DELETE CASCADE
	);
	

INSERT INTO Household VALUES (0,'2347 Oxford Dr. SE','Grand Rapids','MI','49506','616-243-5680');

INSERT INTO Person VALUES (0,0,0,'mr.','Keith','VanderLinden', 'father',1,'m');
INSERT INTO Person VALUES (1,0,0,'ms.','Brenda','VanderLinden','mother',1,'m');


INSERT INTO Homegroup VALUES(0,'Proverbs');

INSERT INTO Team VALUES (0, 'Pastors', 'Delivering sermons');

INSERT INTO PersonTeam VALUES (0, 0, 'supreme overlord');


