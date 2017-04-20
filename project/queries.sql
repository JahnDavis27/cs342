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
SELECT SUM(GS.points), AVG(SUM(GS.points)/P.salary) FROM Player P, GameStats GS
WHERE P.firstName = 'LeBron'
AND GS.playerID = P.ID; 


--This query returns all the points, assists, and rebounds from each game for a player during a certain season.
-- This query would be useful for people trying to gather the complete statistics on a player's season cumulatively. 
SELECT  P.firstName, P.lastName, GS.points, GS.assists, GS.rebounds, GS.steals, GS.blocks FROM Player P, Games G, GameStats GS
WHERE GS.points >= 10
AND GS.assists >= 10
AND GS.rebounds >= 10
AND P.ID = GS.playerID 
AND GS.gameID = G.ID;


--This query returns all games played in a certain city. This would be useful for anyone fetching all of
-- the home games for a team. 
SELECT G1.gameDate, G1.ID, G1.seasonID 
FROM Game AS G1, Game AS G2
WHERE G1.cityPlayedIn = G2.cityPlayedIn;

--This query selects all players who are over 6'6" tall. This might be useful to find all players over a certain
--height in the entire league.
SELECT P.firstName, P.lastName FROM Player P
WHERE P.height =
	(SELECT height 
	FROM Player P
	WHERE P.height > 78.0);
	
--This query calculates the average points scored for a certain player during a season based upon the player's name.
--This would be useful for anyone trying to calculate the averages for a season for any player. 
SELECT AVG(points) FROM GameStats GS, Player P
WHERE GS.playerID = P.ID 
AND GS.seasonID = 1
AND P.firstName = 'LeBron';