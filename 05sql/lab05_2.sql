--Lab 5 SQL Files
--Jahn Davis
--March 3rd, 2017
--CS342
-----------------------------

------------------Exercise 5.2a--------------------------------------
--Get the youngest person in the database. Write this both as a sub-select and as a ROWNUM query (see the notes below). 
--Consider implementing your sub-select without using aggregate functions (e.g., MAX()).\

--This is correlated.
SELECT ID, firstName, lastName, birthdate
FROM (SELECT * FROM Person WHERE birthdate IS NOT NULL ORDER BY  birthdate DESC)
WHERE ROWNUM = 1;

------------------Exercise 5.2b--------------------------------------
--Get the IDs and full names of people who share the same first name. What happens when there are three or more people who share the same name?
SELECT P1.ID, P1.firstName, P1.lastName, P2.ID, P2.firstName, P2.lastName  
FROM Person P1, Person P2
WHERE P1.ID < P2.ID AND P1.firstName = P2.firstName AND P1.lastName != P2.lastName;

--The original query I had didn't contained the ID condition, so the query printed duplicates of records, just flipping the order of the names being printed.
--Adding the "P1.ID < P2.ID" condition ensures that each pair will only be printed ONE time. 


------------------Exercise 5.2c---------------------------------------
--Get the names of all people who are on the music team but not in Byl’s home group. Write this both as a sub-select and as a set operations query.
--Subselect form (correlated)
SELECT P.firstName, P.lastName 
FROM Person P, PersonTeam PT 
WHERE PT.teamName = 'Music' AND PT.personID = P.ID AND NOT EXISTS 
(SELECT * FROM Homegroup HG WHERE P.homegroupID = HG.ID AND HG.name = 'Byl'); 

--Set operations form (not correlated)
SELECT P.firstName, P.lastName 
FROM Person P, PersonTeam PT 
WHERE PT.teamName = 'Music' AND PT.personID = P.ID 
MINUS
(SELECT P.firstName, P.lastName FROM Person P, Homegroup HG WHERE P.homegroupID = HG.ID AND HG.name = 'Byl'); 