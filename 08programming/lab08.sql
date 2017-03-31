--Procedure which checks if the movie and actor exists in the database
CREATE OR REPLACE PROCEDURE castActorMovie
(actorId IN Actor.id%type, movieId IN Movie.id%type, roleIn IN Role.role%type) 
AS 
actorIdIn INTEGER;
movieIdIn INTEGER;
BEGIN
	SELECT ID INTO newActorId FROM Actor A
	WHERE actorIdIn = A.id;
	
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
CREATE TRIGGER insertRole BEFORE INSERT ON Role FOR EACH row
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
		RAISE_APPLICATION_ERROR(-20000, 'Movie' || :new.movieId || 'is too big');
	END IF;
END;
/
SHOW ERRORS;

BEGIN castActorMovie(89558, 238072, 'Danny Ocean');
END;