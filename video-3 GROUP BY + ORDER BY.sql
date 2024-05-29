-- Group BY


Select *
from employee_demographics;

Select gender 
from employee_demographics
group by gender
;

-- this one not suppossed to work
Select first_name
from employee_demographics
group by gender
;

Select gender, avg(age) 
from employee_demographics
group by gender
;


Select occupation,salary
from employee_salary
group by occupation,salary
;


Select gender, avg(age), MAX(age),min(age), count(age)
from employee_demographics
group by gender
;

-- order by - acesnding or descending order

Select *
from employee_demographics
order by first_name;

Select *
from employee_demographics
order by first_name DESC;

Select *
from employee_demographics
order by gender, age;

Select *
from employee_demographics
order by  age ,gender;

Select *
from employee_demographics
order by 5,4;


