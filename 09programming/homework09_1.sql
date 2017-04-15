-- Homework09_1
-- Jahn Davis
-- April 14th, 2017
-- CS342
-- Keith Vander Linden
--------------------------------------

-- Get the movies directed by Clint Eastwood.
SELECT M.id, M.name, M.year, M.rank FROM Movie M, Director D, MovieDirector MD
	WHERE M.id = MD.movieId AND D.id = MD.directorId AND D.firstName = 'Clint' AND D.lastName = 'Eastwood';
		-- Runtime of 0.03 seconds.
		
	-- Attempt 2
	CREATE INDEX tempIndex ON MovieDirector(directorId);
	
	SELECT M.id, M.name, M.year, M.rank FROM Movie M, Director D, MovieDirector MD
	WHERE M.id = MD.movieId AND D.id = MD.directorId AND D.firstName = 'Clint' AND D.lastName = 'Eastwood';
	
	DROP INDEX tempIndex;
		-- Runtime of 0.01 seconds.
		
	-- Attempt 3
	CREATE INDEX tempIndex ON Director(firstName, lastName);
	
	SELECT M.id, M.name, M.year, M.rank FROM Movie M, Director D, MovieDirector MD
	WHERE M.id = MD.movieId AND D.id = MD.directorId AND D.firstName = 'Clint' AND D.lastName = 'Eastwood';
	
	DROP INDEX tempIndex;
		-- Runtime of 0.03 seconds.
		
		
	-- Of these three solutions to the queries, I would most likely use the second option, as the runtime for searching is greatly expedited when looking through the entire collection. Creating an index with the MovieDirector 
	-- table ran with the best average time (over multiple runs). The difference in the execution plan for each query is that the database does a "Table Access by Index RowId" operation instead of a "Table Access Full" 
	-- operation as in the first attempt. In the third attempt, the database does a "Table Access by Index RowId" operation on the Director table instead of a "Table Access Full" operation as in attempt one.