CREATE TRIGGER maxNumber BEFORE INSERT ON Player FOR each row
DECLARE
  counter INTEGER;
  tooManyPlayers EXCEPTION;
BEGIN
  SELECT COUNT(*) INTO counter FROM Player WHERE Player.teamID = :new.teamID;
  IF counter > 5 THEN
	raise tooManyPlayers
  END IF;
EXCEPTION
  WHEN tooManyTeams THEN
    RAISE_APPLICATION_ERROR(-20001,'There are only 5 players allowed per team');
END;

