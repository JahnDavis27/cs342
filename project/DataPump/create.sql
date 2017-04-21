--Create the user.
DROP USER jrd58 CASCADE;
CREATE USER jrd58
	IDENTIFIED BY bjarne
	QUOTA 5M ON System;
GRANT 
	CONNECT,
	CREATE TABLE,
	CREATE SESSION,
	CREATE ANY DIRECTORY,
	DROP ANY DIRECTORY,	
	CREATE SEQUENCE,
	CREATE VIEW,
	CREATE MATERIALIZED VIEW,
	CREATE PROCEDURE,
	CREATE TRIGGER,
	PLUSTRACE,
	UNLIMITED TABLESPACE
	TO jrd58;
		
--GRANT IMP_FULL_DATABASE, EXP_FULL_DATABASE TO jrd58;

-- Set up the Oracle directory for the dump database feature.
-- Use Oracle directories for input/output files to avoid permissions problems. (?)
-- This is needed both to create and to load the *.dmp files.
DROP DIRECTORY exp_dir;
CREATE DIRECTORY exp_dir AS 'C:\Users\jrd58\Documents\project';
GRANT READ, WRITE ON DIRECTORY exp_dir to jrd58;

-- Load the database from the dump file using:
-- impdp jrd58/bjarne parfile=jrd58.par