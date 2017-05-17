--procedures.sql
--Jahn Davis
--May 17th, 2017
--Project
--CS342
--Keith Vander Linden
--------------------------------------------------------------------

--Updated stored procedure that executes a trade between two teams that involves two players. 
-- The procedure checks to see if the two teams and two players exist.
-- If all checks are successful, then we check to make sure the players on actually on their respective teams.
-- If they are, then their two records are removed from PlayerTeam, and new records are inserted into PlayerTeam
--		that swaps the two players onto their new teams. 



--Turn on the outout in order to allow error messages to appear as written.
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE tradePlayers (teamOneID IN INTEGER, playerOneID IN INTEGER, teamTwoID IN INTEGER, playerTwoID IN INTERGER) AS
	playerOne INTEGER;
	playerTwo INTEGER;
	teamOne INTEGER;
	teamTwo INTEGER;
	counter INTEGER;
BEGIN
	
	--Checks to see if the two players and teams exist in the database
	SELECT COUNT(*) INTO playerOne FROM Player WHERE ID = playerOneID;
	SELECT COUNT(*) INTO playerTwo FROM Player WHERE ID = playerTwoID;
	SELECT COUNT(*) INTO teamOne FROM Team WHERE ID = teamOneID;
	SELECT COUNT(*) INTO teamTwo FROM Team WHERE ID = teamTwoID;
	
	--Throws an error if any of these pieces does NOT exist
	IF playerOne = 0 THEN
		dbms_ouput.put_line('Player' || playerOneID || 'does not exist in the database.');
		
	ELSIF playerTwo = 0 THEN
		dbms_ouput.put_line('Player' || playerTwoID || 'does not exist in the database.');
		
	ELSIF teamOne = 0 THEN
		dbms_ouput.put_line('Team' || teamOneID || 'does not exist in the database.');
		
	ELSIF teamTwo = 0 THEN
		dbms_output.put_line('Team' || teamTwoID || 'does not exist in the database.');
		
	-- If these checks pass through, then proceed with the trade.
	ELSE
		
		--Check if the player is actually on their team
		SELECT COUNT(*) INTO counter FROM PlayerTeam WHERE teamID = teamOneID AND playerID = playerOneID;
		IF counter = 0 THEN
			RAISE_APPLICATION_ERROR(-20000, 'Player' || playerOneID || 'is not on team' || teamOneID);
		END IF;
		
		-- Check if the second player is on their team
		SELECT COUNT(*) INTO counter FROM PlayerTeam WHERE teamID = teamTwoID AND playerID = playerTwoID;
		IF counter = 0 THEN
			RAISE_APPLICATION_ERROR(-20000, 'Player' || playerTwoID || 'is not on team' || teamTwoID);
		END IF;
		
		--Execute the trade between the two teams
		DELETE FROM PlayerTeam WHERE teamID = teamOneID and playerID = playerOneID;
		DELETE FROM PlayerTeam WHERE teamID = teamTwoID and playerID = playerTwoID;
		
		--Add the players to their new teams
		INSERT INTO PlayerTeam VALUES(playerOneID, teamOneID);
		INSERT INTO PlayerTEam VALUES(playerTwoID, teamTwoID);
		
	END IF;
END;
/
SHOW ERRORS;