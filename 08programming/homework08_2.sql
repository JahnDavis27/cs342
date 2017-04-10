-- Homework08_2
-- Jahn Davis
-- April 7th, 2017
-- CS342
-- Keith Vander Linden
-------------------------------

-- Create the BaconTable
CREATE TABLE BaconTable (
	actorId integer PRIMARY KEY,
	baconNumber integer
);

-- Procedure to get the baconNumber of all actors given any valid actorId
CREATE OR REPLACE PROCEDURE baconNumber (actorId_Base IN INTEGER, depthLevel IN INTEGER) AS

-- Variables
inBaconTable INTEGER;
currentDepthLevel INTEGER;
foundActors INTEGER;

BEGIN

	-- Check to see if the base actor is in the database
	SELECT COUNT(*) INTO foundActors FROM Actor WHERE id = actorId_Base;

	-- If base actor is not in the database, raise an application error
	IF foundActors = 0 THEN
		RAISE_APPLICATION_ERROR(-20000, 'Actor/Actress ' || actorId_Base || ' does not exist in database!');
	END IF;

	-- If first call of baconNumber, insert actorId with baconNumber 0
	IF depthLevel = 1 THEN
		INSERT INTO BaconTable VALUES (actorId_Base, 0);
	END IF;

	--Only go 4 levels deep
	IF depthLevel > 4 THEN
		RETURN;
	END IF;

	-- Loop through cursor results
	FOR actor IN (SELECT actorId FROM Role WHERE movieId IN (SELECT movieId FROM Role WHERE actorId = actorId_Base)) LOOP
		-- If actor is already in the BaconTable
		SELECT COUNT(*) INTO inBaconTable FROM BaconTable WHERE actorId = actor.actorId;
		-- If actor is not already in the BaconTable, insert into the table
		IF inBaconTable = 0 THEN
			INSERT INTO BaconTable VALUES (actor.actorId, depthLevel);
			baconNumber(actor.actorId, depthLevel + 1);
		-- Check for smaller baconNumber already on record
		ELSE
			SELECT baconNumber INTO currentDepthLevel FROM BaconTable WHERE actorId = actor.actorId;
			IF currentDepthLevel > depthLevel THEN
				UPDATE BaconTable SET baconNumber = depthLevel WHERE actorId = actor.actorId;
				baconNumber(actor.actorId, depthLevel + 1);
			END IF;
		END IF;
	END LOOP;
END;
/
SHOW ERRORS;

-- Test the baconNumber procedure with Kevin Bacon's actorId
BEGIN baconNumber(22591, 1); END;
/

-- Get all the actors with baconNumber of 1
SELECT * FROM BaconTable WHERE baconNumber = 1;
DELETE FROM BaconTable;

-- Test the baconNumber procedure with an actorId that doesn't exist
BEGIN baconNumber(1, 1); END;
/

-- Test the baconNumber procedure with a different actorId
BEGIN baconNumber(837199, 1); END;
/

-- Get all the actors with baconNumber of 1
--		I.e. Actors who acted in a movie with Kate Winslett
SELECT * FROM BaconTable WHERE baconNumber = 1;

-- Drop BaconTable
DROP TABLE BaconTable;
