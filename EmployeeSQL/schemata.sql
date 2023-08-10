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
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR,
  birth_date VARCHAR,
  first_name VARCHAR,
  last_name VARCHAR,
  sex VARCHAR,
  hire_date VARCHAR,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments (
  dept_no VARCHAR PRIMARY KEY,
  dept_name VARCHAR
);

CREATE TABLE dept_emp(
  emp_no INT REFERENCES employees (emp_no), 
  dept_no VARCHAR REFERENCES departments(dept_no),
  PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
  dept_no VARCHAR NOT NULL, 
  emp_no INT NOT NULL, 
  PRIMARY KEY(dept_no, emp_no),
  FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE salaries (
  emp_no INT UNIQUE REFERENCES employees(emp_no),
  salary INT
);

