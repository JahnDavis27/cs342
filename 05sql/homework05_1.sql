--Jahn Davis
--CS342
--March 10th, 2017
--Keith Vander Linden
------------------------------------
	--a. Get a list of the employees who have finished all of their jobs (i.e., all their jobs in the job_history table have non-null end_dates).
		SELECT E.first_name, E.last_name
		FROM EMPLOYEES, JOB_HISTORY JH
		WHERE E.employee_id = JH.employee_id
		AND JH.end_date IS NOT NULL;


	--b. Get a list of employees along with their manager such that the managers have less seniority at the company and that all the employees’ jobs have been within the manager’s department.

		SELECT DISTINCT E.first_name || ' ' || E.last_name AS employee_Name, M.first_name || ' ' || M.last_name AS manager_Name
		FROM EMPLOYEES E, EMPLOYEES M, JOB_HISTORY JH
		WHERE E.employee_id = M.employee_id
		AND E.hire_date < M.hire_date
		AND JH.department_id = M.department_id; 

	--c. The countries in which at least one department is located. Try to write thisas both a join and a nested query. If you can, explain which is better. If you can’t, explain which is not possible and why.

		--Join query
		SELECT DISTINCT country_name
		FROM COUNTRIES C, LOCATIONS L, DEPARTMENTS D
		WHERE C.country_id = L.country_id AND L.location_id = D.location_id;

		--Nested query
		SELECT DISTINCT country_name 
		FROM COUNTRIES C, LOCATIONS L
		WHERE C.country_id = L.country_id IN
			(SELECT L.location_id FROM LOCATIONS L, DEPARTMENTS D
				WHERE L.location_id = D.location_id);
			
   
		--The join query is the better option here. The nested query requires much more work to be done when searching through the database to fit those
		--	requirements of the query. The join query is simple, and is the preferred method by most developers anyways. So I would simply choose the join
		--	query if it was my decision to make. 