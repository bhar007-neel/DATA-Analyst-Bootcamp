SELECT *
FROM parks_and_recreation.employee_demographics;


SELECT first_name,
 last_name,
 birth_date,
 age+10
FROM parks_and_recreation.employee_demographics;
#PEMDAS

SELECT distinct gender
FROM parks_and_recreation.employee_demographics;

SELECT distinct gender, first_name
FROM parks_and_recreation.employee_demographics;