-- Lab10_4.sql
-- Jahn Davis
-- April 21st, 2017
-- CS342
-- Keith Vander Linden
-------------------------------------------------
-- Consider the following stored procedure.

CREATE OR REPLACE PROCEDURE incrementRank
	(movieIdIn IN Movie.id%type, 
	 deltaIn IN integer
    ) AS
	x Movie.rank%type;
BEGIN
	FOR i IN 1..50000 LOOP
		SELECT rank INTO x FROM Movie WHERE id=movieIdIn FOR UPDATE;
		UPDATE Movie SET rank=x+deltaIn WHERE id=movieIdIn;
		COMMIT;
	END LOOP;
END;
/

-- Restart your two SQL*Plus sessions, run the given stored procedure simultaneously in each of them using:

-- EXECUTE incrementRank(movieId, smallIncrementValue);

-- Now, determine if it ran correctly. If it does, explain how. If it doesn’t, identify the problem and modify the code to fix it.


-- ******* ANSWERS ********

-- When I ran this procedure simultaneously on my two SQL*Plus sessions, I did so with the statement below:

--		EXECUTE incrementRank(238075, 0.01);

-- In both sessions, I wanted to increment the rank of the movie "Ocean's Fourteen" by 0.01 50,000 times each (so the final updated rank should be 1004.5).
-- Instead, the updated rank was 623.49. I believe this should be attributed to the lost update problem, where some of the updates were being lost by 
-- the other session overwriting them. Thus, to fight this issue, I decided to lock down these tables. 

-- Using the FOR UPDATE locking tool that Oracle provides, I was able to lock just the affected rows in the table each time the procedure
-- needed to update the rank of a movie table record. By using this lock, it allowed the procedure to not lose any update information, 
-- and after running the procedure again both times, the final rank result for "Ocean's Fourteen" was properly calculated.