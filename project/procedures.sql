CREATE PROCEDURE addPlayer
(playerIDIn IN Player.ID%type, teamIDIn IN Team.ID%type, playerFirstIn AS Player.firstName%type, 
	playerLastIn AS Player.lastName%type, playerHeightIn AS Player.heightInches%type, playerWeightIn AS Player.weightLbs%type, 
	playerSalaryIn AS Player.salary%type) AS
	counter INTEGER;

BEGIN
	SELECT SUM(P.salary) INTO counter FROM Player P, Team T
	WHERE P.ID = playerIDIn AND T.ID = teamIDIn;
	IF counter >= 100,000,000 THEN
		RAISE_APPLICATION_ERROR(-20000, 'The league has denied this deal, as it would exceed the salary cap.');
	END IF;
	INSERT INTO Player VALUES(playerIDIn, teamIDIn, playerFirstIn, playerLastIn, playerHeightIn, playerWeightIn, playerSalaryIn);
	dbms_output.put_line('Player' || playerIDIn || 'is now on the roster of team ' || teamIDIn);
END;