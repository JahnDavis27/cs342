Readme for J2EE part of Project 5 deliverable
Jahn Davis
May 12th, 2017
CS342
Keith Vander Linden
------------------------------------------------------
This program is designed to serve up any and all information about my NBA statistics database. It gives all the most important information 
stored in the tables that are loaded into Oracle. It allows access to the Player, Position, Team, Game, Season, and GameStats tables, and can be
created/modified/deleted on all fields of those tables. 

The GameStats table has a OneToMany relationship with the Games table.
	This signifies that the information for a specific game will appear in a GameStats record, while also displaying the individual statistics of a player
	who played in that game.
	
The Team table has a 



There are GET requests for the following things:
    1. Specific player
    2. All players
    3. Specific teams
    4. All teams
    5. Specific positions
    6. All positions
    7. Specific seasons
    8. All season
    9. Specific games
    10. All games
	11. Specific game statistics records
	12. All game statistics records

There are POST requests for the following things:
    1. New player
    2. New team
    3. New season
    4. New position
    5. New games
	6. New game statistics records

There are PUT requests for the following things:
    1. Modify player
    2. Modify team
    3. Modify season
    4. Modify position
    5. Modify games
	6. Modify game statistics records
	
There are DELETE requests for the following things:
	1. Remove player
    2. Remove team
    3. Remove season
    4. Remove position
    5. Remove games
	6. Remove game statistics records