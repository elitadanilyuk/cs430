-- #1 List first name,last name and the current salary of all current employees making more than $90,000
-- outputs 21
SELECT
	e.first_name, e.last_name, s.salary
FROM
	employees e, salaries s
WHERE
	s.salary>90000 AND s.to_date='9999-01-01' AND e.emp_no=s.emp_no;

-- #2 List first name,last name and the department name of all current employees whose current department number is "d008" or "d009"
-- outputs 17
SELECT
	e.first_name, e.last_name, d.dept_name
FROM
	employees e, departments d, dept_emp de
WHERE
	(d.dept_no='d008' OR d.dept_no='d009') AND e.emp_no=de.emp_no AND de.dept_no=d.dept_no AND de.to_date='9999-01-01';

-- #3 List first name,last name and the title of all current female employees who have the title as "Technique Leader"
-- outputs 9
SELECT DISTINCT
	e.first_name, e.last_name, t.title
FROM
	employees e, titles t
WHERE
	e.gender='F' AND t.title='Technique Leader' AND e.emp_no=t.emp_no AND t.to_date='9999-01-01';


-- #4 List first name,last name and the current salary of all the current employees except "Senior Engineer" (lowest salaries first)
-- outputs 73
SELECT DISTINCT
	e.first_name, e.last_name, s.salary
FROM
	employees e, salaries s, titles t
WHERE
	t.title!='Senior Engineer' AND t.to_date='9999-01-01' AND e.emp_no=t.emp_no AND t.emp_no = s.emp_no AND s.to_date='9999-01-01'
ORDER BY
	s.salary ASC;


-- #5 List the first name,last name, and the birth date all employees (current and past - youngest employee first)
-- outputs 124
SELECT
	e.first_name, e.last_name, e.birth_date
FROM
	employees e
ORDER BY
	e.birth_date ASC;
	

-- #6 List the first name and last name of all current employees who are department managers in all current departments
-- outputs 9
SELECT
	e.first_name, e.last_name
FROM
	employees e, dept_manager dm
WHERE
	dm.to_date='9999-01-01' AND e.emp_no=dm.emp_no;


-- #7 List the first name,last name and current department of the employee who is paid the maximum salary (one line of output only)
-- outputs 1
SELECT
	e.first_name, e.last_name, d.dept_name
FROM
	employees e, dept_manager dm, departments d, salaries s
WHERE
	dm.to_date='9999-01-01'
HAVING
	MAX(s.salary);