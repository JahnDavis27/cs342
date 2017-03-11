--Jahn Davis
--CS342
--March 10th, 2017
--Keith Vander Linden
--Lab06
-----------------------------------------------

-----------------Exercise 6.1------------------
--a. Get the names and mandate statements of all teams along with the ID of their “chair” member. If a chair member does not exist, include NULL for the ID.
	SELECT PT.personID, T.name, T.mandate FROM Team T LEFT OUTER JOIN PersonTeam PT
	ON T.name = PT.teamName AND PT.role = 'chair' OR PT.role IS NULL;
		
-----------------Exercise 6.2------------------
--a. Compute the average age of all the people in the database.
	SELECT AVG(DATEDIFF(YEAR(NOW()), YEAR(birthdate))) FROM Person;