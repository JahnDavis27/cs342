--Queries for NBA Finals database
--Jahn Davis
--CS342
--March 31st, 2017
--Keith Vander Linden
-----------------------------------------------

--This view only contains the gameID and the playerID and the five main statistical categories.
--This would be useful for stakeholders who simply want to see the most important stats for a player's
--performance in a game. 
CREATE VIEW mainStats AS
SELECT ID, gameID, playerID, points, assists, rebounds, steals, blocks
FROM GameStats
WHERE points > 30 
AND playerID = 8;

--This query calculates the amount of money a player earned for every point they scored. In this case, we use LeBron James to determine his bucks/point ratio
--....It's going to be something ridiculously large. 
SELECT P.salary / SUM(GS.points) AS dollarsPerPoint 
FROM Player P, GameStats GS
WHERE P.firstName = 'LeBron'
AND GS.playerID = P.ID
GROUP BY P.salary ;

--This query returns all the points, assists, and rebounds from each game for a player during a certain season, as well the details of the game the triple double occured.
-- This query would be useful for people trying to gather the complete statistics on a player's season cumulatively. 
SELECT DISTINCT P.firstName, P.lastName, GS.points, GS.assists, GS.rebounds FROM Player P, GameStats GS
WHERE GS.points >= 10
AND GS.assists >= 10
AND GS.rebounds >= 10
AND P.ID = GS.playerID;


--This query lists all players and their salaries for the 2016-17 season in order from largest to smallest. 
SELECT firstName, lastName, salary FROM Player P
WHERE P.firstName IS NOT NULL
ORDER BY salary desc;

--This query selects all players who are over 6'6" tall. This might be useful to find all players over a certain
--height in the entire league.
SELECT P.firstName, P.lastName, AVG(GS.points) FROM Player P, GameStats GS
WHERE P.ID = GS.playerID
AND P.height =
	(SELECT height 
	FROM Player P
	WHERE P.height > 78.0);
	
--This query calculates the average points, average assists, and average rebounds for a certain player for all their GameStats 
--in the database based upon the player's name.
--This would be useful for anyone trying to calculate the averages for a season for any player, as well as for a career. 
SELECT ROUND(AVG(GS.points),1) AS PPG, ROUND(AVG(GS.assists), 1) AS APG, ROUND(AVG(GS.rebounds), 1) AS RPG, ROUND(AVG(GS.steals), 1) AS SPG, ROUND(AVG(GS.blocks), 1) AS BPG FROM GameStats GS, Player P
WHERE GS.playerID = P.ID 
AND GS.seasonID = 1
AND P.firstName = 'LeBron';