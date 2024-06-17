-- CTEs

with CTE_Example as
(
select gender, avg(salary), max(salary), min(salary), count(salary)
from employee_demographics dem
join employee_salary sal
      on dem.employee_id =sal.employee_id
group by gender      
)
select *
from CTE_Example;