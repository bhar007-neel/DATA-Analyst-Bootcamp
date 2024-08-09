-- Triggers and Events

select *
from employee_demographics;

select*
from employee_salary;


DELIMITER $$
CREATE TRIGGER employee_insert
     AFTER INSERT ON employee_salary
     FOR EACH ROW 
BEGIN      
  INSERT INTO employee_demographics(employee_id, first_name, last_name)
  values(NEW.employee_id, NEW.first_name, NEW.last_name);

END $$
DELIMITER ;

insert into employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
values(13,'neelmani', 'bhardwaj','CEO',1000000, NULL);



-- Events

select *
from employee_demographics;

delimiter $$
create Event delete_retires
on schedule every 30 second
do 
begin
	delete
	from employee_demographics
	where age >= 60;
end $$

delimiter ;