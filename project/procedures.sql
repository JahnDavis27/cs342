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
	
	--Creates savepoint for potential rollbacks
	SAVEPOINT temp;
	
	--Locks tables in case an edit happens
	LOCK TABLE PlayerTeam IN EXCLUSIVE MODE NOWAIT;
	LOCK TABLE Player IN EXCLUSIVE MODE NOWAIT;
	LOCK TABLE Team IN EXCLUSIVE MODE NOWAIT;
	
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
			notOnTeamOneException;
		END IF;
		
		-- Check if the second player is on their team
		SELECT COUNT(*) INTO counter FROM PlayerTeam WHERE teamID = teamTwoID AND playerID = playerTwoID;
		IF counter = 0 THEN
			notOnTeamTwoException;
		END IF;
		
		--Execute the trade between the two teams
		DELETE FROM PlayerTeam WHERE teamID = teamOneID and playerID = playerOneID;
		DELETE FROM PlayerTeam WHERE teamID = teamTwoID and playerID = playerTwoID;
		
		--Add the players to their new teams
		INSERT INTO PlayerTeam VALUES(playerOneID, teamOneID);
		INSERT INTO PlayerTEam VALUES(playerTwoID, teamTwoID);
		
	END IF;
	COMMIT;
	
	EXCEPTION
		
		--When player not on team one
		WHEN notOnTeamOneException
			RAISE_APPLICATION_ERROR(-20000, 'Player' || playerOneID || 'is not on team' || teamOneID);
			--Rollback to temp
			ROLLBACK TO temp;
	
		--When player not on team two
		WHEN notOnTeamTwoException
			RAISE_APPLICATION_ERROR(-20000, 'Player' || playerTwoID || 'is not on team' || teamTwoID);
			--Rollback to temp
			ROLLBACK TO temp;
				
		--Any other errors		
		WHEN OTHERS THEN
			dbms_output.put_line("Unknown error. Rolling back to last savepoint");
			--Rollback to temp
			ROLLBACK TO temp;
		
END;
/
SHOW ERRORS;