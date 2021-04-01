-- 1 List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT a.emp_no, a.last_name, a.first_name, a.sex, b.salary
FROM employee a
LEFT JOIN salary b
ON a.emp_no = b.emp_no
ORDER BY salary DESC;

--2. List first name, last name, and hire date for employees who were hired in 1986. "1986-11-14"
SELECT first_name, last_name, hire_date 
FROM employee 
WHERE to_char(hire_date :: DATE, 'yyyy') = '1986';

-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.
SELECT d.dept_no, c.dept_name, d.emp_no, d.last_name, d.first_name FROM department c LEFT JOIN (
SELECT a.dept_no, a.emp_no, b.last_name, b.first_name 
FROM dept_manager a
LEFT JOIN employee b ON a.emp_no = b.emp_no)d 
ON c.dept_no = d.dept_no;  


--4. List the department of each employee with the following information: employee number, last name, 
--first name, and department name.
SELECT c.emp_no, c.last_name, c.first_name, c.dep_no
FROM (SELECT a.emp_no, a.last_name, a.first_name, b.dep_no 
FROM employee a LEFT JOIN dept_employee b ON a.emp_no = b.emp_no
)c
LEFT JOIN department d ON c.dep_no = d.dept_no;


-- 5. List first name, last name, and sex for employees whose first name is 
--"Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name ASC;

-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name FROM (
SELECT a.emp_no, last_name, first_name, dep_no FROM employee a
INNER JOIN dept_employee b
ON a.emp_no = b.emp_no) c
LEFT JOIN department d 
ON c.dep_no = d.dept_no
WHERE dept_name = 'Sales'
ORDER BY last_name ASC

-- 7 .List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name from (
SELECT a.emp_no, last_name, first_name, dep_no FROM employee a
INNER JOIN dept_employee b
ON a.emp_no = b.emp_no) c
LEFT JOIN department d 
ON c.dep_no = d.dept_no
WHERE dept_name IN ('Sales', 'Development')
ORDER BY last_name ASC

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS freq
FROM employee
group by last_name
ORDER BY freq DESC


