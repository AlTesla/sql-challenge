DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departaments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;

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
  hire_date DATE,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departaments (
  dept_no VARCHAR PRIMARY KEY,
  dept_name VARCHAR
);

CREATE TABLE dept_emp(
  emp_no INT REFERENCES employees (emp_no), 
  dept_no VARCHAR REFERENCES departaments(dept_no),
  PRIMARY KEY (emp_no, dept_no)
);

