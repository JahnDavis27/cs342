-- Homework 07_1
-- Jahn Davis
-- CS342
-- March 31st, 2017
-- Keith Vander Linden
----------------------------------------------------------------------

-- This view gets all 107 employees, including the one that has a NULL department_id
CREATE VIEW departmentView AS
	SELECT E.employee_id, E.first_name, E.last_name, E.email, E.hire_date, D.department_name
	FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.department_id = D.department_id;


-- Homework 7.1a.
------------------
	SELECT * FROM (
		SELECT employee_id, first_name, last_name
		FROM deptView
		WHERE department_name = 'Executive'
		ORDER BY hire_date DESC
	) WHERE ROWNUM = 1;


-- Homework 7.1b.
-- This query fails, and produces an error which says 'cannot modify a column which maps to a non key-preserved table'.
	-- This is because the primary key of the departments table is not stored in the departmentView, so
	-- Oracle does not allow an update or change to any information regarding the department attributes, as it
	-- cannot refer back to the base table to update that information.
------------------------------------------------------------------------------------------------------------------------
	UPDATE departmentView SET department_name = 'Bean Counting' WHERE department_name = 'Administration';


-- Homework 7.1c.
	-- This query works because this time, we key preserve the information
	-- from the employees table (employee_id), so the update to this information is allowed. This also
	-- updates the record in the employees table so that Jose Manuel's first name is changed to just Manuel
	-- as well.
--------------------------------------------------------------------------------------------------------------
	UPDATE deptartmentView SET first_name = 'Manuel' WHERE first_name = 'Jose Manuel';


-- Homework 7.1d.
	-- This query gives the error 'cannot modify more than one base table through a join view'. This means
	-- 		that because our view combines both employees and departments tables so it cannot insert into this view.
-------------------------------------------------------------------------------------------------------------------
	INSERT INTO departmentView VALUES (1000, 'Jahn', 'Davis', 'JahnDavis27', '05-26-1995', 'Payroll');

