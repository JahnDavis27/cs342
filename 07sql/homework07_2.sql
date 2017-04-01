-- Homework 07_2
-- Jahn Davis
-- CS 342
-- March 31st, 2017
-- Keith Vander Linden
-------------------------------------------------

-- This query gets all the employee records, including the one with a NULL department_id
CREATE MATERIALIZED VIEW departmentView AS
	SELECT E.employee_id, E.first_name, E.last_name, E.email, E.hire_date, D.department_name
	FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.department_id = D.department_id;

	-- I cannot get the FOR UPDATE materialized view to work because it gives an error saying 'updatable
	--		materialized views must be simple enough to do fast refresh'. My guess is that the LEFT OUTER
	--		JOIN is causing the materialized view to be inefficient for what I'm trying to do.

-- Homework 7.2a----------------
	SELECT * FROM (
		SELECT employee_id, first_name, last_name
		FROM deptView
		WHERE department_name = 'Executive'
		ORDER BY hire_date DESC
	) WHERE ROWNUM = 1;


-- Homework 7.2b----------------
	-- This query produces an error saying 'data manipulation operation not legal on this view'. I believe
	-- this is because the departmentView is not a FOR UPDATE materialized view, but I can't figure out a method
	-- for the view to work using FOR UPDATE. 

	UPDATE departmentView SET department_name = 'Bean Counting' WHERE department_name = 'Administration';


-- Homework 7.2c----------------
	-- This update query produces the same error as part b above 'data manipulation operation not legal on this view'.
	-- 		Again, if I could get the FOR UPDATE materialized view to work, I believe that this update query would work correctly,
	--		changing both the Jose Manuel tuple in departmentView and the Jose Manuel tuple in the EMPLOYEES table.
	
	UPDATE departmentView SET first_name = 'Manuel' WHERE first_name = 'Jose Manuel';


-- Homework 7.2d-----------------
	-- What a shock, this query produces the same error as parts b and c. (-_-) However, if I were to have the FOR UPDATE 
	-- materialized view working, I would get the same error as part d where I can't modify more than one base 
	-- table at a time through the join view.
	
	INSERT INTO departmentView VALUES (1000, 'Jahn', 'Davis', 'JahnDavis27', '05-26-1995', 'Payroll');


