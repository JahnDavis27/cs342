-- Lab08_2
-- Jahn Davis
-- April 7th, 2017
-- CS342
-- Keith Vander Linden
-----------------------------

-- Insert your results into this table.
CREATE TABLE SequelTemp (
  id INTEGER,
  name varchar2(100),
  PRIMARY KEY (id)
 );
 
 -- Create procedure getSequels to find all sequels of a given movie
CREATE OR REPLACE PROCEDURE getSequel (movieIdIn IN Movie.id%type) AS
-- Create temp cursor to loop through the sequelIds
CURSOR temp IS
	SELECT sequelId FROM Movie WHERE id = movieIdIn;

-- Begin procedure code
BEGIN

	-- Remove all entries from the SequelsTemp table
	DELETE FROM SequelTemp;

	-- Loop through the results from the temp cursor
	--		Recursively call getSequels on the sequel found
	--		Insert result into SequelTemp table
	FOR sequel IN temp LOOP
			getSequel(sequel.sequelId);
			INSERT INTO SequelTemp (SELECT id, name FROM Movie WHERE id = sequel.sequelId);
	END LOOP;
END;
/
SHOW ERRORS;

-- Get the sequels for Ocean's 11, i.e., 4 of them.
BEGIN  getSequel(238071);  END;
/
SELECT * FROM SequelTemp;

-- Get the sequels for Ocean's Fourteen, i.e., none.
BEGIN  getSequel(238075);  END;
/
SELECT * FROM SequelTemp;

-- Clean up.
DROP TABLE SequelTemp;