--Create the user and database.

--Create the user.
DROP USER jrd58 CASCADE;
CREATE USER jrd58
		IDENTIFIED BY LowBrassSpecialBeam3
		QUOTA 5M ON System;
GRANT 
		CONNECT,
		CREATE TABLE,
		CREATE SESSION,
		CREATE SEQUENCE,
		CREATE VIEW,
		CREATE MATERIALIZED VIEW,
		CREATE PROCEDURE,
		CREATE TRIGGER,
		UNLIMITED TABLESPACE
		TO jrd58;
		
--Connect to the user's account/schema.
CONNECT jrd58/LowBrassSpecialBeam3;

--Create the database
DEFINE jrd58=
@&jrd58\load