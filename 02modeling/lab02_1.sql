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
	status varchar(6),
	FOREIGN KEY (movieId) REFERENCES Movie(Id) ON DELETE CASCADE,
	FOREIGN KEY (performerId) REFERENCES Performer(Id) ON DELETE SET NULL,
	CHECK (status in ('star', 'costar', 'extra'))
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

--------------------------------------------------------------------

--Exervcise 2.1a

--i. INSERT INTO Movie VALUES(1, 'WIIIIBBBBY: THE MUSICAL', 1986, 8.2)
	--This command does not work properly because a record must be unique to maintain the integrity
	-- of the table. Multiple entities with the same primary key violates that integrity.
	
--ii. INSERT INTO Movie VALUES(NULL, 'WIIIIBBBBY: THE MUSICAL', 1986, 8.2);
	--This command does not work because a NULL primary key cannot be entered, as this basically says
	-- that the record's value is unknown and is unable to found later on.
	
--iii. INSERT INTO Movie VALUES(3, 'WIIIIBBBBY: THE MUSICAL', 1786, 8.2);
	--This command will not work because the CHECK constraint ensures that all data in a record 
	--maintains the proper entry format for the table. Entering an invalid year would ruin the table's
	--integrity.
	
--iv. INSERT INTO Movie VALUES(banana, 'WIIIIBBBBY: THE MUSICAL', 1786, 8.2);
	--This command won't work because the datatype for the ID must be an integer. Anything else 
	-- violates integrity.

--v. INSERT INTO Movie VALUES(banana, 'WIIIIBBBBY: THE MUSICAL', 1786, -9.5);
	--Works because score does not get checked for positive or negative value.

----------------------------------------------------------------------

--Exercise 2.1b

--i. INSERT INTO Casting VALUES (NULL, 1, 'Nah');
	--Cannot insert value that doesn't know the value of a foreign key
--ii. INSERT INTO Casting VALUES (3,2,'star');
	--Does not work, cannot create a record where the foreign key references a value that is nonexistent,
	-- as this would violate the integrity.
--iii. INSERT INTO Performer VALUES (5, 'Bruce Lee');
	--This works, because there can be a Performer that is simply not in any recorded movies that are in
	-- the database, as this doesn't violate entity integrity.
	
-----------------------------------------------------------------------

--Exercise 2.1c

--i. DELETE FROM Performer WHERE id=1;
	--This works, as it simply deletes a performer, which isn't really referenced by any movies. 
--ii. DELETE FROM Casting WHERE movieId=1;
	--This works because the Casting record is simply deleted, not the movie that is referenced, so
	--it simply removes a performer from a movie. 
--iii. UPDATE Movie SET id=3 WHERE id=2;
	--This does not work because the child record would be altered by changing a movie's id from its value.
------------------------------------------------------------------------