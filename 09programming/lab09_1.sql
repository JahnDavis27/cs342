-- Lab09_1
-- Jahn Davis
-- April 7th, 2017
-- CS342
-- Keith Vander Linden
---------------------------

--Exercise 9.1
-- a. there is a benefit to using either COUNT(1) , COUNT(*) or SUM(1) for simple counting queries.
	DECLARE
		temp integer;
	BEGIN
	FOR i IN 1..100 LOOP
		SELECT COUNT(*) INTO temp FROM Actor;
	END LOOP;
	END;
	/
	
	-- Time elapsed: 00:00:01.25
	
	DECLARE
		temp integer;
	BEGIN
	FOR i IN 1..100 LOOP
		SELECT COUNT(1) INTO temp FROM Actor;
	END LOOP;
	END;
	/
	
	-- Time elapsed: 00:00:01.23
	
	DECLARE
		temp integer;
	BEGIN
	FOR i IN 1..100 LOOP
		SELECT SUM(1) INTO temp FROM Actor;
	END LOOP;
	END;
	/
	
	-- Time elapsed: 00:00:02.46
	
-- b. the order of the tables listed in the FROM clause affects the way Oracle executes a join query.
	SELECT COUNT(*) FROM Actor A, Movie M, Role R
	WHERE R.movieID = M.id and A.id = R.actorID AND A.id = 22591;
	/
	
	--Time elapsed: 00:00:00.06
	
	SELECT COUNT(*) FROM  Movie M, Role R, Actor A
	WHERE R.movieID = M.id and A.id = R.actorID AND A.id = 22591;
	/
	
	--Time elapsed: 00:00:00.06
	
-- c. the use of arithmetic expressions in join conditions (e.g., FROM Table1 JOIN Table2 ON Table1.id+0=Table2.id+0 ) affects a query’s efficiency.
	DECLARE
		temp integer;
	BEGIN
	FOR i IN 1..100 LOOP
		SELECT COUNT(*) INTO temp FROM  Movie M JOIN Actor A ON M.id = A.id;
	END LOOP;
	END;
	/
	
	-- Time elapsed: 00:00:14.43
	
-- d. running the same query more than once affects its performance.
	DECLARE
		temp integer;
	BEGIN
	FOR i IN 1..100 LOOP
		SELECT COUNT(*) INTO temp FROM  Movie M JOIN Actor A ON M.id = A.id;
	END LOOP;
	END;
	/
	-- Time elapsed on first run: 00:00:14.36
	-- Time elapsed on second run: 00:00:14.58
	
-- e. adding a concatenated index on a join table improves performance (see the create index command described above).
	--no index
	SELECT COUNT(*) FROM  Role R1 JOIN Role R2 on R1.actorID = R2.movieID;
	
	--with index
	CREATE INDEX roleIndex ON Role(movieID, actorID);
	SELECT COUNT(*) FROM  Role R1 JOIN Role R2 on R1.actorID = R2.movieID;

	--DOES NOT EXECUTE
	-- ERROR at line 1:
	-- ORA-01652: unable to extend temp segment by 128 in tablespace SYSTEM
