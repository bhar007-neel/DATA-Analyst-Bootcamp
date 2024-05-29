-- Having vs Where

select gender, avg(age)
FROM employee_demographics
Group BY gender
having AVG(age) > 40
;

select occupation, avg(salary)
FROM employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) > 75000
;

