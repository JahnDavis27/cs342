-- This command file loads a simple movies database, dropping any existing tables
-- with the same names, rebuilding the schema and loading the data fresh.
--
-- CS 342, Spring, 2015
-- kvlinden

-- Drop current database
DROP TABLE Casting;
DROP TABLE Movie;
DROP TABLE Performer;

-- Create database schema
CREATE TABLE Movie (
	id integer,
	title varchar(70) NOT NULL, 
	year decimal(4), 
	score float,
	PRIMARY KEY (id),
	CHECK (year > 1900)
	);

CREATE TABLE Performer (
	id integer,
	name varchar(35),
	PRIMARY KEY (id)
	);
	
CREATE TABLE Casting (
	movieId integer,
	performerId integer,
	FOREIGN KEY (movieId) REFERENCES Movie(Id) ON DELETE CASCADE,
	FOREIGN KEY (performerId) REFERENCES Performer(Id) ON DELETE SET NULL,
	FOREIGN KEY (status) REFERENCES Status(name) ON DELETE SET NULL,
	CHECK (status in ('star', 'costar', 'extra'))
	);
	
-- Sequence for movie IDs
CREATE SEQUENCE movie_seq START WITH 1 INCREMENT BY 1;

-- Load sample data
INSERT INTO Movie VALUES (1,'Star Wars',1977,8.9);
INSERT INTO Movie VALUES (2,'Blade Runner',1982,8.6);

INSERT INTO Performer VALUES (1,'Harrison Ford');
INSERT INTO Performer VALUES (2,'Rutger Hauer');
INSERT INTO Performer VALUES (3,'The Mighty Chewbacca');
INSERT INTO Performer VALUES (4,'Rachael');

INSERT INTO Casting VALUES (1,1,'star');
INSERT INTO Casting VALUES (1,3,'extra');
INSERT INTO Casting VALUES (2,1,'star');
INSERT INTO Casting VALUES (2,2,'costar');
INSERT INTO Casting VALUES (2,4,'costar');
----------------------------------Exercise 2.4--------------------------------------------
-- a. I would consider adding another sequence to be unnecessary. We can simply use the same sequence
-- 		for both relationS, as long as the primary keys are unique for each relation. Sharing a sequence
--		prevents any IDs from not being unique, thus preserving integrity. 
--
--
-- b. Using the sequence in the DDL file can be problematic, because it limits the way that new records 
--		could be difficult to do in an end user environment, due to having to call the sequence every time
-- 		a record is created. 