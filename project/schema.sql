0vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv--This is the design of my basketball statistical database.
--Based upon the setup of ESPN and basketballreference.com

--Jahn Davis
--CS342
--Spring 2017
----------------------------------------------------------------
--Create tables
CREATE TABLE Position(
	ID integer PRIMARY KEY,
	name varchar(2)
	);

CREATE TABLE Team(
	ID integer PRIMARY KEY,
	name varchar(50),
	homeCity varchar(30),
	homeState varchar(30), 
	conference varchar(4)
	);

CREATE TABLE Player(
	ID integer PRIMARY KEY, 
	teamID integer,
	firstName varchar(50),
	lastName varchar(50),
	heightInches float,
	weightLbs integer,
	position integer,
	pointsPerGame float,
	assistsPerGame float,
	reboundsPerGame float,
	stealsPerGame float,
	blocksPerGame float,
	FieldGoalPct float,
	threePointPct float,
	freeThrowPct float,
	turnoversPerGame float,
	foulsPerGame float,
	minutesPerGame float,
	FOREIGN KEY (position) REFERENCES Position(name) ON DELETE SET NULL,
	FOREIGN KEY (teamID) REFERENCES Team(ID) ON DELETE SET NULL
	);
	
	
CREATE TABLE Season(
	ID integer,
	startYear integer,
	endYear integer,
	championID integer,
	mostValuablePlayerID integer,
	FOREIGN KEY (championID) REFERENCES Team(ID) ON DELETE SET NULL,
	FOREIGN KEY (mostValuablePlayerID) REFERENCES Player(ID) ON DELETE SET NULL
	);

CREATE TABLE Games(
	ID integer PRIMARY KEYS,
	teamOneID integer,
	teamTwoID integer,
	teamOneScore integer,
	teamTwoScore integer,
	gameDate date,
	seasonID integer,
	cityPlayedIn varchar(30)
	FOREIGN KEY (teamOneID) REFERENCES Team(ID) ON DELETE CASCADE,
	FOREIGN KEY (teamTwoID) REFERENCES Team(ID) ON DELETE CASCADE,
	FOREIGN KEY (seasonID) REFERENCES Season(ID) ON DELETE CASCADE
	);
	
CREATE TABLE GameStats(
	ID integer PRIMARY KEY,
	playerID integer,
	gameID integer,
	positionID integer,
	seasonID integer,
	fieldGoalsAttempted integer,
	fieldGoalsMade integer,
	threePointAttempted integer,
	threePointMade integer,
	freeThrowsAttempted integer,
	freeThrowsMade integer,
	points integer,
	assists integer,
	rebounds integer,
	steals integer,
	blocks integer,
	turnovers integer,
	fouls integer,
	minutesPlayed integer,
	FOREIGN KEY (plsyerID) REFERENCES Player(ID) ON DELETE CASCADE,
	FOREIGN KEY (gameID) REFERENCES Game(ID) ON DELETE CASCADE,
	FOREIGN KEY (positionID) REFERENCES Position(ID) ON DELETE CASCADE,
	FOREIGN KEY (seasonID) REFERENCES Season(ID) ON DELETE CASCADE
	);
	
