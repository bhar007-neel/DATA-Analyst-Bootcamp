-- union - helps to combine rows of data

select first_name, last_name
from employee_demographics
union distinct
select first_name, last_name
from employee_salary;

select first_name, last_name
from employee_demographics
union all
select first_name, last_name
from employee_salary;

-- label
select first_name, last_name, "old" AS label
from employee_demographics
where age> 50
union
select first_name, last_name, "High Paying" AS label
from employee_salary
where salary > 70000;


select first_name, last_name, "old man" AS label
from employee_demographics
where age> 40 and gender = "Male"
union
select first_name, last_name, "old lady" AS label
from employee_demographics
where age> 50 and gender ="Female"
union
select first_name, last_name, "High Paying" AS label
from employee_salary
where salary > 70000
order by first_name, last_name;

