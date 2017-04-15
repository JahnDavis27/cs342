-- Homework09_2
-- Jahn Davis
-- April 14th, 2017
-- CS342
-- Keith Vander Linden
--------------------------------------

-- Get the number of movies directed by each director who's directed more than 200 movies.

	-- Attempt 1
	SELECT D.id, D.firstName, D.lastName, COUNT(1) AS numMovies
	FROM Director D, MovieDirector MD
	WHERE D.id = MD.directorId
	HAVING COUNT(*) > 200
	GROUP BY D.id, D.firstName, D.lastName
	ORDER BY COUNT(*) ASC;
		-- Runtime of 0.14 seconds.		
		
		
	-- Attempt 2
	CREATE INDEX tempIndex ON MovieDirector(directorId);
	
	SELECT D.id, D.firstName, D.lastName, COUNT(1) AS numMovies
	FROM Director D, MovieDirector MD
	WHERE D.id = MD.directorId
	HAVING COUNT(*) > 200
	GROUP BY D.id, D.firstName, D.lastName
	ORDER BY COUNT(*) ASC;
	
	DROP INDEX tempIndex;
		-- Runtime of 0.14 seconds.
		
		
	
	-- Of these two approaches, I would most likely choose the first approach. The runtimes are very similar, in spite of adding indexes to the queries. As there really isn't a difference in their 
	-- execution order, then it is really not worth adding an indes  in this case, as it doesn't do anything to really improve the runtimes. I figured that it would follow the same sort of pattern as 
	-- the first exercise, but it didn't really change at all, which surprised me. 