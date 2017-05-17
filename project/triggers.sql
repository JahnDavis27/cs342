--This trigger is designed to limit the number of players that can be a member
-- of a certain team. The limit value is 5, as an NBA roster has five players.
-- If there is an attempt to add a player to a team that already has five players, 
-- then the trigger will fire and raise an exception that prevents the transaction
-- from happening.  
CREATE TRIGGER maxNumber BEFORE INSERT ON PlayerTeam FOR each row
DECLARE
  counter INTEGER;
  tooManyPlayers EXCEPTION;
BEGIN
  SELECT COUNT(*) INTO counter FROM PlayerTeam PT WHERE PT.teamID = :new.teamID;
  IF counter > 5 THEN
	raise tooManyPlayers
  END IF;
  --Throws an exception
EXCEPTION
  WHEN tooManyPlayers THEN
    RAISE_APPLICATION_ERROR(-20001,'There are only 5 players allowed per team');
END;
