-- This command file loads a simple movies database, dropping any existing tables
-- with the same names, rebuilding the schema and loading the data fresh.
--
-- CS 342, Spring, 2017
-- Jahn Davis

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
	
CREATE TABLE Status(
	name varchar(6),
	PRIMARY KEY (name)
	};

CREATE TABLE Casting (
	movieId integer,
	performerId integer,
	FOREIGN KEY (movieId) REFERENCES Movie(Id) ON DELETE CASCADE,
	FOREIGN KEY (performerId) REFERENCES Performer(Id) ON DELETE SET NULL,
	FOREIGN KEY (status) REFERENCES Status(name) ON DELETE SET NULL
	);
	
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

INSERT INTO Status VALUES ('star');
INSERT INTO Status VALUES ('extra');
INSERT INTO Status VALUES ('costar');

----------------------------------Exercise 2.3-----------------------------------------------
-- I added in a Status relation, and inserted values into that relation that represented the 3 types
--	of statuses. In the Casting relation, the status attribute was changed into a foreign key that
-- 	refers to the primary key of the Status relation. This change removes the CHECK from the Casting
--	relation, while also adding a method to add new statuses later on to the Status relation. 