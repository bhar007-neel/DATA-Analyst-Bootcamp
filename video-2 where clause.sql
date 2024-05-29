-- WHERE Clause

SELECT *
FROM employee_salary
WHERE first_name="Leslie";


SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM employee_salary
WHERE salary < 50000;

SELECT *
FROM employee_demographics
WHERE gender !="Female";

SELECT *
FROM employee_demographics
WHERE birth_date> '1985-01-01';


-- AND OR NOT LOGICAL OPERATORS


SELECT *
FROM employee_demographics
WHERE birth_date> '1985-01-01' AND gender ='male';


SELECT *
FROM employee_demographics
WHERE birth_date> '1985-01-01' OR  NOT gender ='male';


-- like statement
-- %- means anything and _ means specfic values

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'jer%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___';


SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';


SELECT *
FROM employee_demographics
WHERE birth_date like '1989%';
