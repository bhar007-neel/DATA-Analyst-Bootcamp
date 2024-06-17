-- joins 
-- inner join is goin to returns same rows that have same  in two coloumn , that are same in both the table.

Select *
From employee_demographics;

select *
From employee_salary;

select *
from employee_demographics as dem
inner join employee_salary as sal
     on employee_demographics. employee_id = employee_salary.employee_id
;

select dem.employee_id, age, occupation
from employee_demographics as dem
inner join employee_salary as sal
     on dem. employee_id = sal.employee_id
;

-- outer joins
-- in this we have a left and right outer joins. left is going take everything from the left join eventhough there is no matches and then it will return only matches from the right join.


select *
from employee_demographics as dem
left outer join employee_salary as sal
     on dem. employee_id = sal.employee_id
;

select *
from employee_demographics as dem
right outer join employee_salary as sal
     on dem. employee_id = sal.employee_id
;

-- self join- tieing the table to itself

select emp1.employee_id as emp_santa, 
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_santa, 
emp2.first_name as first_name_santa,
emp2.last_name as last_name_santa
from employee_salary emp1
join employee_salary emp2
    on emp1.employee_id + 1 = emp2.employee_id ;
    
    
    
-- joining multiple table together


select *
from employee_demographics as dem
inner join employee_salary as sal
     on dem. employee_id = sal.employee_id
inner join  parks_departments pd
          on sal.dept_id = pd.department_id  
;

select *
from parks_departments;
    
