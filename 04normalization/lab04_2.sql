-- This command file loads an experimental person database.
-- The data conforms to the following assumptions:
--     * People can have 0 or many team assignments.
--     * People can have 0 or many visit dates.
--     * Teams and visits don't affect one another.
--
-- CS 342, Spring, 2017
-- Jahn Davis

DROP TABLE PersonTeam;
DROP TABLE PersonVisit;

CREATE TABLE PersonTeam (
	personName varchar(10),
    teamName varchar(10)
	);

CREATE TABLE PersonVisit (
	personName varchar(10),
    personVisit date
	);

-- Load records for two team memberships and two visits for Shamkant.
INSERT INTO PersonTeam VALUES ('Shamkant', 'elders');
INSERT INTO PersonTeam VALUES ('Shamkant', 'executive');
INSERT INTO PersonVisit VALUES ('Shamkant', '22-FEB-2015');
INSERT INTO PersonVisit VALUES ('Shamkant', '1-MAR-2015');

-- Query a combined "view" of the data of the form View(name, team, visit).
SELECT pt.personName, pt.teamName, pv.personVisit
FROM PersonTeam pt, PersonVisit pv
WHERE pt.personName = pv.personName;

------------------------------------------------------------------------------------------------------
--Exercise 4.2a
	--The relations in this table are technically in both BCNF and 4NF. How can we see this? The relations once again have no primary keys, and also have no functional dependencies.
		--Because there are no functional dependencies to violate, this relation is all-key. Thus, it is automatically in BCNF. There are also no multivalued dependencies, so the relation
		--is in 4NF as well. Because there isn't a situation where an attribute defines another with respect to a third attribute, there are no multivalued dependencies.

--Exercise 4.2b
	--This view is in BCNF, as all of these attributes are necessary to uniquely identify the relations. There are no functional dependencies present in this relaion, because no attribute
		-- is functionally dependpent upon another attribute. However, this relation is not in 4NF. There is a multivalued dependency where personName identifies teamName and personVisit. Thus,
		-- the multivalued dependency rule is violated, as the left side is NOT a superkey for the relation. 

--Exercise 4.2c
	--Just because the number of views and records are the same, this does not mean that they are equally 
	--appropriate. The single view needs to have all the records to account for all of the other information. 
	--The single "view" relation needs to have every combination of records to make up all the data/information 
	--for that relation. If you want all the data to appear in a single table every time, then this single 
	--relation view would be ideal for your needs. But you must take into consideration that single relation is not in 4NF. 
------------------------------------------------------------------------------------------------------
-- Exercise 4.2d
-- Create a new table to store the data queried by the combined "view" query
DROP TABLE Person;

CREATE TABLE Person (
	personName varchar(10),
    teamName varchar(10),
    personVisit date
);

INSERT INTO Person
SELECT pt.personName, pt.teamName, pv.personVisit
FROM PersonTeam pt, PersonVisit pv
WHERE pt.personName = pv.personName;

SELECT * FROM Person;