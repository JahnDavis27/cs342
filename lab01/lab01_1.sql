--1a 
SELECT * FROM departments;

--1b. 
SELECT COUNT(EMPLOYEE_ID) FROM employees;

--1c(i) 
SELECT * FROM employees WHERE salary > 15000;

--1c(ii)
SELECT * FROM employees WHERE hire_date >= TO_DATE('2002/01/01', 'yyyy/dd/mm') 
AND hire_date <= TO_DATE('2004/31/12', 'yyyy/dd/mm');

--1c(iii)
SELECT * FROM employees WHERE phone_number NOT LIKE '%515%';

--1d
SELECT first_name || '' || last_name AS full_name FROM employees WHERE department_id =100 
ORDER BY first_name;

--1e
SELECT city, state_province, country_name FROM locations, countries, regions 
WHERE regions.region_name = 'Asia' AND countries.region_id = regions.region_id 
AND locations.country_id = countries.country_id;

--1f
SELECT * FROM locations WHERE state_province IS NULL;