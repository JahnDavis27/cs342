--Lab07
--Jahn Davis
--CS342
--March 17th, 2017
--Keith Vander Linden
----------------------------------------------
CREATE VIEW Birthday AS
	SELECT P.firstName || ' ' || P.lastName AS fullName,
	TRUNC(MONTHS_BETWEEN(SYSDATE, birthdate)/12) AS Age, P.birthdate
	FROM Person P;
	
	--a.
	SELECT fullName 
	FROM Birthday 
	WHERE EXTRACT(year FROM birthdate) >= 1961 AND EXTRACT(year FROM birthdate) <= 1975;
	
	--b.
	UPDATE Person SET birthdate = '15-MAR-1969' WHERE birthdate IS NULL;
	
	--This does change the outputs of the previous query, as my UPDATE added 6 new 
	--people who fit the criteria of the query from A. The view that is created 
	--is using query modification, which runs the CREATEVIEW query each time it needs to 
	--access that view, so it accessed the updated Person table.
	
	--c.
	INSERT INTO Birthday VALUES ('Jahn Davis', 22, '15-Mar-1995');
	
	--This won't work. We cannot simply enter a value into a column that relies on a calculated value.
	--If we removed that calculation, then we'd have a better chance, but it won't work in the current
	--state. If we used a materialized view instead, the fields in the base table that are not in the 
	--view will be filled with NULL values when an entry is inserted into the materialized view. The 
	--full name would also need to be broken apart as well. 
	
	-- d.
	DROP VIEW Birthday;
	
	-- Dropping a view does not affect the Person base table in any way.