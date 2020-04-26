-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
Select 
		employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.gender,
		salaries.salary
From employees
LEFT Join salaries
on employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1986.
SELECT 
	first_name, 
	last_name, 
	hire_date 
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT 
	public."Departments".dept_no, 
	public."Departments".dept_name, 
	dept_manager.emp_no, 
	employees.last_name, 
	employees.first_name, 
	dept_manager.from_date, 
	dept_manager.to_date
FROM public."Departments"
LEFT JOIN dept_manager
ON public."Departments".dept_no = dept_manager.dept_no
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name
SELECT 
	dept_emp.emp_no, 
	employees.last_name, 
	employees.first_name, 
	public."Departments".dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN public."Departments"
ON dept_emp.dept_no = public."Departments".dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	first_name, 
	last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
	dept_emp.emp_no, 
	employees.last_name, 
	employees.first_name, 
	public."Departments".dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN public."Departments"
ON dept_emp.dept_no = public."Departments".dept_no
WHERE public."Departments".dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	dept_emp.emp_no, 
	employees.last_name, 
	employees.first_name, 
	public."Departments".dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN public."Departments"
ON dept_emp.dept_no = public."Departments".dept_no
WHERE public."Departments".dept_name in ('Sales','Development') ;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	last_name,
	COUNT(last_name) AS "frequency_count"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;