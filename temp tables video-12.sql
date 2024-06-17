-- temperory tables

create table temp_table
(first_name varchar(50),
last_name varchar(50),
fav_movie varchar(150)
);

select *
from temp_table;

insert into temp_table
values("neel", "bhardwaj", "mastizada");

select *
from temp_table;



-- popular way to do it

select *
from employ_salary;

create temporary table salary_50k
select *
from employee_salary
where salary >= 50000;

select *
from salary_50k;