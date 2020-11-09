-- Data Analysis

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986
SELECT e.emp_no, e.last_name, e.hire_date
FROM employees as e
WHERE e.hire_date >= '1986-01-01' AND e.hire_date <= '1986-12-31';


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
SELECT d1.dept_no as "Dept No", d1.dept_name AS "Dept Name", e.emp_no AS "Manager Emp No", e.last_name as "Manager Last Name", e.first_name as "Manager First Name"
FROM departments as d1
INNER JOIN dept_manager as dm ON d1.dept_no = dm.dept_no
INNER JOIN employees as e ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d1.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON e.emp_no = de.emp_no
INNER JOIN departments as d1 ON de.dept_no = d1.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
SELECT e.first_name, e.last_name, e.sex
FROM employees as e
WHERE e.last_name LIKE 'B%' AND e.first_name = 'Hercules';

-- Create view for use in queries 6 and 7
CREATE VIEW employee_depts AS
SELECT e.emp_no, e.last_name, e.first_name, d1.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON e.emp_no = de.emp_no
INNER JOIN departments as d1 ON de.dept_no = d1.dept_no;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT *
FROM employee_depts
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT *
FROM employee_depts
WHERE dept_name IN ('Sales', 'Development');

-- 8.  In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name AS "Last Name", COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY "Last Name"
ORDER BY "Last Name Count" DESC;

