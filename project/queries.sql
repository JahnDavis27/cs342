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
WHERE points > 20 
AND playerID = 8;



--DOLLARS PER POINT SCORED BY LEBRON JAMES
--This query calculates the amount of money a player earned for every point they scored. In this case, we use LeBron James to determine his bucks/point ratio
--....It's going to be something ridiculously large. 
SELECT P.salary / SUM(GS.points) AS dollarsPerPoint 
FROM Player P, GameStats GS
WHERE P.firstName = 'LeBron'
AND GS.playerID = P.ID
GROUP BY P.salary;



--This query returns all the points, assists, and rebounds from each triple-double for a player during a certain season, as well the details of the game the triple double occured.
-- This query would be useful for people trying to gather the complete statistics on a player's season cumulatively. 
SELECT DISTINCT P.firstName, P.lastName, GS.points, GS.assists, GS.rebounds, GS.steals, GS.blocks FROM Player P, GameStats GS
WHERE GS.points >= 10
AND GS.assists >= 10
AND GS.rebounds >= 10
AND P.ID = GS.playerID;



--NESTED SELECTS
--This query returns all the players who are in the database who are not currently on a team. 
-- This would be a useful query to anyone trying to determine who are the free agents in the database. 
-- These players would also be able to be added to a team's roster midseason if they were given a contract in real life. 
SELECT DISTINCT firstName, lastName, ID
FROM Player, PlayerTeam
WHERE ID NOT IN (	SELECT P.ID
					FROM Player P join PlayerTeam PT on P.ID = PT.playerID
					WHERE P.ID = PT.playerID)
ORDER BY ID;


--AGGREGATE FUNCTIONS
--This query shows the number of minutes played during a season.
-- This would be useful to anyone who wanted to see what players played the most minutes throughout the whole season.
-- These queries could be modified to show what players made the most use of their minutes.
SELECT DISTINCT P.ID, SUM(GS.minutesPlayed) AS totalMinutes, ROUND(AVG(GS.minutesPlayed), 1) AS minutesPerGame
FROM Player P, GameStats GS, Games G
WHERE P.ID = GS.playerID
AND GS.gameID = G.ID 
AND GS.minutesPlayed IS NOT NULL
GROUP BY P.ID
ORDER BY minutesPerGame DESC;



--This query lists all players and their salaries for the 2016-17 season in order from largest to smallest. 
SELECT firstName, lastName, salary FROM Player P
WHERE P.firstName IS NOT NULL
ORDER BY salary desc;



--This query selects all players who are over 6'3" tall and displays their average stats. This might be useful to find all players over a certain
--height in the entire league, and to see how their height helps with scoring production (i.e. do taller players
-- always put up better numbers?).
SELECT P.ID, ROUND(AVG(GS.points), 1) AS PPG, ROUND(AVG(GS.assists), 1) AS APG, ROUND(AVG(GS.rebounds), 1) AS RPG
FROM Player P, GameStats GS
WHERE P.ID = GS.playerID
AND P.heightInches > 75.0	
GROUP BY P.ID
ORDER BY PPG DESC;


--SELF JOIN
--This query would be show a pair of players who average over 20 points per game on the same team, and how many wins their team acquires.
-- This would be interesting to see if having two higher scoring players produce better results than a player who puts up big numbers on his own. 
SELECT P1.firstName, P1.lastName, TRUNC(AVG(GS1.points), 1) AS PPG, P2.firstName, P2.lastName, TRUNC(AVG(GS2.points), 1) AS PPG, T.name AS TeamName, T.wins
FROM Player P1, Player P2, GameStats GS1, GameStats GS2, PlayerTeam PT1, PlayerTeam PT2, Team T
WHERE PT1.playerID = P1.ID
AND PT2.playerID = P2.ID
AND PT1.teamID = T.ID
AND PT2.teamID = T.ID
AND PT1.teamID = PT2.teamID
AND GS1.playerID = P1.ID
AND GS2.playerID = P2.ID
AND P2.ID > P1.ID
HAVING AVG(GS1.points) >= 20 AND AVG(GS2.points) >= 20
GROUP BY P1.firstName, P1.lastName, P2.firstName, P2.lastName, T.name, T.wins;


	
--This query calculates the average points, average assists, and average rebounds for a certain player for all their GameStats 
--in the database based upon the player's name.
--This would be useful for anyone trying to calculate the averages for a season for any player, as well as for a career. 
SELECT ROUND(AVG(GS.points),1) AS PPG, ROUND(AVG(GS.assists), 1) AS APG, ROUND(AVG(GS.rebounds), 1) AS RPG, ROUND(AVG(GS.steals), 1) AS SPG, ROUND(AVG(GS.blocks), 1) AS BPG FROM GameStats GS, Player P
WHERE GS.playerID = P.ID 
AND GS.seasonID = 1
AND P.firstName = 'LeBron';
