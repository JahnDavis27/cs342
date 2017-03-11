--Jahn Davis
--CS342
--March 10th, 2017
--Keith Vander Linden
--Lab06
-----------------------------------------------

-----------------Exercise 6.2------------------
--a. Compute the average age of all the people in the database.
	SELECT AVG(TRUNC(MONTHS_BETWEEN(SYSDATE, p.birthdate)/12)) FROM Person p;

--b. Get the household ID and count of members of all households in Grand Rapids having at least 2 members. Order the results by decreasing size.
	SELECT HH.ID, COUNT(P.ID) AS total
	FROM Person P, HouseHold HH 
	WHERE HH.city = 'Grand Rapids' AND P.householdID = HH.ID
	GROUP BY HH.ID
	HAVING COUNT(P.ID) >= 2
	ORDER BY total DESC;
	
--c. Modify the previous query to retrieve the phone number of the household as well.
	SELECT HH.ID, HH.phoneNumber, COUNT(P.ID) AS total
	FROM Person P, HouseHold HH 
	WHERE HH.city = 'Grand Rapids' AND P.householdID = HH.ID
	GROUP BY HH.ID, HH.phoneNumber
	HAVING COUNT(P.ID) >= 2
	ORDER BY total DESC;
	