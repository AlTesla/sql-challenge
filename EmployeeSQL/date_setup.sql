ALTER TABLE employees
ALTER COLUMN hire_date TYPE DATE USING TO_DATE(hire_date, 'MM/DD/YYYY');

ALTER TABLE employees
ALTER COLUMN birth_date TYPE DATE USING TO_DATE(birth_date, 'MM/DD/YYYY');