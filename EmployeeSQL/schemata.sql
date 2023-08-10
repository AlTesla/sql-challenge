DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

SET DateStyle = 'SQL, MDY';

CREATE TABLE titles (
  title_id VARCHAR PRIMARY KEY,
  title VARCHAR
);

CREATE TABLE employees (
  emp_no INT PRIMARY KEY NOT NULL,
  emp_title_id VARCHAR(5) NOT NULL,
  birth_date VARCHAR(10) NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL ,
  sex VARCHAR(1)  NOT NULL ,
  hire_date VARCHAR(10) NOT NULL,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments (
  dept_no VARCHAR(4) PRIMARY KEY,
  dept_name VARCHAR(25)
);

CREATE TABLE dept_emp(
  emp_no INT UNIQUE REFERENCES employees (emp_no), 
  dept_no VARCHAR(4) REFERENCES departments(dept_no),
  PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
  dept_no VARCHAR(4) NOT NULL, 
  emp_no INT UNIQUE NOT NULL, 
  PRIMARY KEY(dept_no, emp_no),
  FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE salaries (
  emp_no INT UNIQUE REFERENCES employees(emp_no),
  salary INT NOT NULL
);
ALTER TABLE employees
ALTER COLUMN hire_date TYPE DATE USING TO_DATE(hire_date, 'MM/DD/YYYY');

ALTER TABLE employees
ALTER COLUMN birth_date TYPE DATE USING TO_DATE(birth_date, 'MM/DD/YYYY');