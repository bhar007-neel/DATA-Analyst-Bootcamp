-- case statements

select first_name, last_name,age,
case	
	when age<= 30 then 'young'
    when age between 31 and 50 then 'old'
    when age >= 50 then "RETIRE PLEASE "
end as age_bracket
from employee_demographics;


-- PAY INCREASE AND Bonus
-- <50000 =5%
-- > 50000 = 7%
-- finance =10% BONUS
select first_name, last_name, salary,
case
      when salary < 50000 then salary *1.05
      when salary > 50000 then  salary *1.07
end as new_salary      

from employee_salary;

select first_name, last_name, salary,
case
     when dept_id =6 then  salary *1.10
end as new_salary
from employee_salary

