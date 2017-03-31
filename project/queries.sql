--Queries for NBA Finals database
--Jahn Davis
--CS342
--March 31st, 2017
--Keith Vander Linden
-----------------------------------------------

--This query is a simple query that returns all the players on a team for a certain season. 
--In this example, this grabs all players in the DB who are members of the Golden State Warriors for the 
-- 2015-2016 NBA season. People who might want this query would be people trying to organize rosters for teams,
-- or determining roster sizes, etc.
SELECT * FROM Player P, Team T, Season S
WHERE P.teamID = T.ID AND S.startYear = 2015 AND S.endYear = 2016  AND Team.name = 'Golden State Warriors';


--This query returns all the games and the stats from each game for a player during a certain season.
-- This query would be useful for people trying to gather the complete statistics on a player's season cumulatively. 
SELECT * FROM Player P, Season S, Team T, Games G, GameStats GS
WHERE P.firstName = 'LeBron'
AND P.ID = GS.playerID 
AND S.startYear = 2015 
AND GS.seasonID = S.ID 
AND GS.gameID = G.ID
AND T.name = "Cleveland Cavaliers"
AND T.ID = GS.teamID;

SELECT G1.gameDate 
FROM Game AS G1, Game AS G2
WHERE G1.cityPlayedIn = G2.cityPlayedIn
AND 