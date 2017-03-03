-- This command file loads an experimental person relation.
-- The data conforms to the following assumptions:
--     * Person IDs and team names are unique for people and teams respectively.
--     * People can have at most one mentor.
--     * People can be on many teams, but only have one role per team.
--     * Teams meet at only one time.
--
-- CS 342
-- Spring, 2017
-- Jahn Davis

drop table AltPerson;

CREATE TABLE AltPerson (
	personId integer,
	name varchar(10),
	status char(1),
	mentorId integer,
	mentorName varchar(10),
	mentorStatus char(1),
    teamName varchar(10),
    teamRole varchar(10),
    teamTime varchar(10)
	);

INSERT INTO AltPerson VALUES (0, 'Ramez', 'v', 1, 'Shamkant', 'm', 'elders', 'trainee', 'Monday');
INSERT INTO AltPerson VALUES (1, 'Shamkant', 'm', NULL, NULL, NULL, 'elders', 'chair', 'Monday');
INSERT INTO AltPerson VALUES (1, 'Shamkant', 'm', NULL, NULL, NULL, 'executive', 'protem', 'Wednesday');
INSERT INTO AltPerson VALUES (2, 'Jennifer', 'v', 3, 'Jeff', 'm', 'deacons', 'treasurer', 'Tuesday');
INSERT INTO AltPerson VALUES (3, 'Jeff', 'm', NULL, NULL, NULL, 'deacons', 'chair', 'Tuesday');

-------------------------------------------------------------------------------------------------------------
--Exercise 4.1a
	--This schema violates a lot of the requirements for various levels of normalized form. There are a disgusting amount of NULL values in this relation.
		-- A lot of these attributes should be in their own separate tables. The lack of primary and foreign keys is incredibly disturbing. There will be no 
		-- way to uniquely identify ANY records, potentially resulting in duplicate records, wasting database space. 
	--We must determine whether or not this relation is in BCNF or 4NF.
		--All the left hand sides of the non-trivial functional dependencies must be a superkey of the relation. What we see here is not the case at all. There
			-- is no mechanism in place that confirms that the superkey uniquely identifies the attributes of a relation. Thus, this requirement is violated. 
			-- We also see that the only real primary key is (personId, teamId). But personId functionally defines name, thus violating BCNF requirements.
			
--Exercise 4.1b
	--Properly normalized schema:
		--Person(personId, name, status, mentorId)
		--Team(teamId, teamName, role, time)
		--Person_Team(personId, teamId)
		
	--This schema is in BCNF. For each functional dependency in the table, the left hand side of each f.d. is a superkey for the relation.		
		

		
-------------------------------------------------------------------------------------------------------------
--Exercise 4.1c

DROP TABLE Person;
DROP TABLE Team;
DROP TABLE Person_Team;

CREATE TABLE Person(
	personId integer PRIMARY KEY,
	name varchar(15),
	status char(1),
	mentorId integer,
	FOREIGN KEY (mentorId) REFERENCES Person(personId)
);

CREATE TABLE Team(
	teamName varchar(20)
);

CREATE Person_Team(
	teamName varchar(20),
	personId integer,
	teamRole varchar(20),
	teamTime varchar(20),
	FOREIGN KEY (teamName) REFERENCES Team(teamName) ON DELETE CASCADE,
	FOREIGN KEY (personId) REFERENCES Person(personId)
);

--Queries
INSERT INTO Person SELECT DISTINCT personId, name, status, mentorId FROM AltPerson;
INSERT INTO Team SELECT DISTINCT teamName FROM AltPerson;
INSERT INTO Person_Team SELECT DISTINCT teamName, personId, teamRole, teamTime FROM AltPerson;

SELECT * FROM Person;
SELECT * FROM Team;
SELECT * FROM Person_Team;