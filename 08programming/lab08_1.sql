CREATE PROCEDURE CastActorMovie
(actorId IN Actor.id%type, movieId IN Movie.id%type, roleIn IN Role.role%type) AS counter INTEGER
BEGIN
	SELECT COUNT(*) INTO counter FROM Role
	WHERE actorIdIn = Actor.id AND movieIdIn = Movie.id and roleIn = Role.role;
	IF counter >= 1 THEN
		RAISE_APPLICATION_ERROR(-20000, 'Actor' || actorIdIn || 'is already cast in' || movieIdIn || 'as role' || roleIn);
	END IF;
	INSERT INTO Role(actorId, movieId, role) VALUES (actorIdIn, movieIdIn, roleIn);
	dbms_output.put_line('Actor' || actorIdIn || 'cast in movie' || movieIdIn || 'as role' || roleIn);
END;


CREATE TRIGGER noOverfill BEFORE INSERT ON Role FOR each row
DECLARE
	counter INTEGER;
	movieTooBig EXCEPTION;
BEGIN
	SELECT COUNT(*) INTO counter FROM Role
		WHERE movieId = :new.movieId AND actorId = :new.actorId AND role = :new.role
	dbms_output.put_line('Checking cast list...');
	IF counter >=230 THEN
		raise movieTooBig;
	END IF;
	EXCEPTION
		WHEN movieTooBig THEN
			RAISE_APPLICATION_ERROR(-20001, 'full movie:' || :new.movieId);
END;