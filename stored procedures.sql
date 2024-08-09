-- stored Procedures

select *
from employee_salary
where salary >= 50000
;

CREATE PROCEDURE large_salaries()
select *
from employee_salary
where salary >= 50000
;


call large_salaries();


DELIMITER $$
CREATE PROCEDURE large_salaries2()
select *
from employee_salary
where salary >= 50000;
select *
from employee_salary
where salary >= 100000
;
END $$

DELIMITER ;
call large_salaries2();









DELIMITER $$
CREATE PROCEDURE large_salaries_3(id int)
select salary
from employee_salary
where employee_id = id;


END $$

DELIMITER ;

Call large_salaries_3(1);