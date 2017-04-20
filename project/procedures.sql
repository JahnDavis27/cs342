CREATE PROCEDURE addPlayer
(playerIDIn IN Player.ID%type, teamIDIn IN Team.ID%type) AS
	counter INTEGER;

BEGIN
	SELECT SUM(P.salary) INTO counter FROM Player P, Team T
	WHERE P.ID = playerIDIn AND T.ID = teamIDIn;
	IF counter >= 100,000,000 THEN
		RAISE_APPLICATION_ERROR(-20000, 'The league has denied this deal, as it would exceed the salary cap.');