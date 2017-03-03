-----------------Exercise5.1a-------------------------
--Retrieve the cross-product of all person and all household records. How many records to you get and why? As an optional challenge, can you use SQL to compute this number?
SELECT Household.* , Person.* FROM HouseHold, Person
	--128 rows were found, there are 8 households and 16 people. 16 * 8 is equal to 128.


-----------------Exercise5.1b--------------------------
--Retrieve the people who have birthdays specified in the database, ordered by day-of-year (i.e., Jan 1 birthdays go before Jan 2 birthdays, regardless of the year). 
--Note that you can compute the day of year value using the Oracle function: TO_CHAR(birthdate, 'DDD').
SELECT firstName, lastName, birthdate FROM Person WHERE birthdate IS NOT NULL ORDER BY birthdate DESC;