-- Homework09_3
-- Jahn Davis
-- April 14th, 2017
-- CS342
-- Keith Vander Linden
--------------------------------------

-- Attempt 1
	SELECT A.id, A.firstName, A.lastName, TRUNC(AVG(M.rank), 1) as Average_Rank, COUNT(1) as numMovies
	FROM Actor A, Movie M, Role R
	WHERE A.id = R.actorId AND M.id = R.movieId
	HAVING AVG(M.rank) > 8.5 AND COUNT(*) > 9
	GROUP BY A.id, A.firstName, A.lastName
	ORDER BY AVG(M.rank) ASC;
		-- Runtime of 2.92 seconds
		
-- Attempt 2
	-- Didn't work during the lab, so it most likely wouldn't work here etiher --CREATE INDEX tempIndex ON Role(actorId, movieId);
	
	--SELECT A.id, A.firstName, A.lastName, TRUNC(AVG(M.rank), 1) as Average_Rank, COUNT(1) as numMovies
	--FROM Actor A, Movie M, Role R
	--WHERE A.id = R.actorId AND M.id = R.movieId
	--HAVING AVG(M.rank) > 8.5 AND COUNT(*) > 9
	--GROUP BY A.id, A.firstName, A.lastName
	--ORDER BY AVG(M.rank) ASC;
	
	--DROP INDEX tempIndex; 
	
	
	--Due to the issues that arose in the lab with this approach, I believe that the only way to solve this query is by using the form that I gave. This
	-- returns what is wanted from the queries. The heuristic I considered using involved using COUNT(1) instead of using COUNT(*) because it is minutely faster. 