--Exercise 8.1
--Jahn Davis
--CS342
--March 31st, 2017
--Keith Vander Linden
----------------------------------

--Procedure which checks if the movie and actor exists in the database
--Actor/Actress and Movie must already exist in the database.
------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE castActorMovie
(actorId IN Actor.id%type, movieId IN Movie.id%type, roleIn IN Role.role%type) 
AS 
actorIdIn INTEGER;
movieIdIn INTEGER;
BEGIN
	SELECT ID INTO actorIdIn FROM Actor A
	WHERE actorId = A.id;
	
	IF actorIdIn IS NULL THEN
		dbms_output.put_line('Actor does not exist');
	ELSE
		dbms_output.put_line('Actor exists');
		
		SELECT ID INTO movieIdIn FROM Movie M
		WHERE movieIdIn = M.id;
	
		IF movieIdIn IS NULL THEN
			dbms_output.put_line('Movie does not exist');
		ELSE
			dbms_output.put_line('Movie exists');
	
			INSERT INTO Role VALUES (actorIdIn, movieIdIn, role);
			dbms_output.put_line('Actor' || actorIdIn || 'cast in movie' || movieIdIn || 'as role' || role);
		END IF;
	END IF;
END;
/
SHOW ERRORS;

--Trigger that checks if the new insertion is legal
--Actor/Actress cannot already be in a movie
--No movie can have more than 230 cast members.
-------------------------------------------------------
CREATE OR REPLACE TRIGGER insertRole BEFORE INSERT ON Role FOR EACH row
DECLARE
	actorCounter INTEGER;
	movieCounter INTEGER;
	
BEGIN
	SELECT COUNT(*) INTO actorCounter FROM Role R
		WHERE R.actorId = :new.actorId AND R.movieId = :new.movieId;
	dbms_output.put_line('Checking cast list...');
	
	IF actorCounter >= 0 THEN
		RAISE_APPLICATION_ERROR(-20000, 'Actor/Actress' || :new.actorId || 'is already in movie' || :new.movieId);
	END IF;
	
	SELECT COUNT(*) INTO movieCounter FROM Role R
		WHERE R.movieId = :new.movieId;
		
	IF movieCounter > 229 THEN
		RAISE_APPLICATION_ERROR(-20000, 'Movie' || :new.movieId || 'has a full cast');
	END IF;
END;
/
SHOW ERRORS;

	
-- Test the procedue and trigger
-- George Clooney already cast in this movie
BEGIN castActor(89558, 238072, 'Danny Ocean'); END;
/

-- George Clooney not cast in this movie
BEGIN castActor(89558, 238073, 'Danny Ocean'); END;
/

-- JFK movie already has full (230) casting
BEGIN castActor(89558, 167324, 'Danny Ocean'); END;
/