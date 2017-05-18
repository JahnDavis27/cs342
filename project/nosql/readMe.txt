Readme file for noSQL deliverable of Project 5.
Jahn Davis
May 12th, 2017
CS342
Keith Vander Linden
---------------------------------------------------

I believe that my database can be done with this system of using KV-Lite. However, I most likely would use a document database in a real world setting for this kind of
data. Each record might have different information at some point so a document database would be better, and the large number of fields would be easier to understand in 
a document database setting. KV-Lite works well with simple information from a single table, but becomes much more complicated when joining together multiple tables. 

/*******************PLAYER TABLE************************/
getPlayers has the following key-value structure for storing players:
      /player/{Id}/-/firstName/{firstName}
      /player/{Id}/-/lastName/{lastName}
      /player/{Id}/-/heightInches/{heightInches}
      /player/{Id}/-/weightLbs/{weightLbs}
      /player/{Id}/-/position/{position
	  /player/{Id}/-/salary/{salary}
	  
This key-value structure will allow me to get all the information for a given player at any time.
      I use this key-value structure to query for all information for one specific player (getplayerValues)
      and for getting the first and last name for a specific player (getPlayerTeams).

/******************TEAM TABLE*****************************/
getTeams has the following the key-value structure for storing  teams:
      /team/{Id}/-/name/{name}
	  /team/{Id}/-/homeCity/{homeCity}
	  /team/{Id}/-/homeState/{homeState}
      /team/{Id}/-/conference/{conference}	  
      /team/{Id}/-/wins/{wins}
      /team/{Id}/-/losses/{losses}
	  
This key-value structure will allow me to get the necessary information needed for sorting all the team
      records by number of regular season wins (getSortedTeams).
	  
	  
/*****************PLAYERTEAM TABLE***********************/
getPlayerTeam has the following key-value structure for storing the PlayerTeam records
      /playerTeam/{teamId}/{playerId}/-/NO-VALUE
 This key-value structure allows me to get the players that are on a team given the team id. 
