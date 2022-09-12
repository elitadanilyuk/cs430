SELECT
	e.first_name, e.last_name, s.salary
FROM
	employees e, salaries s
WHERE
	s.salary>90000 AND s.to_date='9999-01-01' AND e.emp_no=s.emp_no;


SELECT
	e.first_name, e.last_name, d.dept_name
FROM
	employees e, departments d, dept_emp de
WHERE
	(d.dept_no='d008' OR d.dept_no='d009') AND e.emp_no=de.emp_no AND de.dept_no=d.dept_no;


SELECT DISTINCT
	e.first_name, e.last_name, t.title
FROM
	employees e, titles t
WHERE
	e.gender='F' AND t.title='Technique Leader' AND e.emp_no=t.emp_no;


SELECT DISTINCT
	e.first_name, e.last_name, s.salary
FROM
	employees e, salaries s, titles t
WHERE
	t.title!='Senior Engineer' AND s.to_date='9999-01-01' AND e.emp_no=t.emp_no AND t.emp_no = s.emp_no
ORDER BY
	s.salary ASC;


SELECT
	e.first_name, e.last_name, e.birth_date
FROM
	employees e
ORDER BY
	e.birth_date ASC;
	

SELECT
	e.first_name, e.last_name
FROM
	employees e, dept_manager dm
WHERE
	dm.to_date='9999-01-01' AND e.emp_no=dm.emp_no;


SELECT
	e.first_name, e.last_name, d.dept_name
FROM
	employees e, dept_manager dm, departments d, salaries s
WHERE
	dm.to_date='9999-01-01'
HAVING
	MAX(s.salary);