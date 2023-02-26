/* Data Engineering
	Paul Brichta */

/************************************************************/

CREATE TABLE departments(
	dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(60)
);

SELECT * FROM departments;

/************************************************************/

CREATE TABLE titles (
	emp_title_id VARCHAR(30) PRIMARY KEY NOT NULL,
	title VARCHAR(30)
);

SELECT * FROM titles;

/************************************************************/

CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(30),
	birth_date DATE,
	first_name VARCHAR(40),
	last_name VARCHAR(40),
	sex VARCHAR(20),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(emp_title_id)
);

/*ALTER TABLE employees 
   ADD CONSTRAINT fk_emp_title_id
   FOREIGN KEY (emp_title_id) 
   REFERENCES titles(emp_title_id);*/

SELECT * FROM employees;

/************************************************************/

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(30),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)    
);

SELECT * FROM dept_emp;

/************************************************************/

CREATE TABLE dept_manager (
	dept_no VARCHAR(30),
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_manager;

/************************************************************/

CREATE TABLE salaries (
	emp_no INT,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;
