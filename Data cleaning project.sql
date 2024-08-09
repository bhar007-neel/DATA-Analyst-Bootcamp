-- Data cleaning -fixing alot of raw data before you start using it for visualisation or for your product, so thatthere are less issues with it.alter

select *
from layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the data
-- 3. Null values and blank values
-- 4. remove col and rows that are not neccasary (Optional)

create table layoffs_staging
like layoffs;

select *
from layoffs_staging;

insert layoffs_staging
select *
from layoffs;


-- Best practice is to do the staging for the raw data, so that if we make any mistakes our raw orignal data is not effected.




with duplicate_cte as
(
select *,
ROW_NUMBER() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging
)
select *
from duplicate_cte 
where row_num > 1;





CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num`int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


insert into layoffs_staging2
select *,
ROW_NUMBER() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging;

delete
from layoffs_staging2
where row_num>1
;

select *
from layoffs_staging2
where row_num>1
;

select*
from layoffs_staging2;

-- standardizing data- findind isseues and and fixing it.

select company, trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);

select *
from layoffs_staging2
where industry like 'crypto%';

select *
from layoffs_staging2;

update layoffs_staging2
set industry = 'Crypto'
where industry like 'crypto%';

select distinct country, Trim(Trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = trim(trailing'.' from country)
where country like 'united states%';

select distinct country
from layoffs_staging2;


select `date`,
str_to_date(`date`,'%m/%d/%Y' )
from layoffs_staging2;

update layoffs_staging2
set `date`=str_to_date(`date`,'%m/%d/%Y' );

select *
from layoffs_staging2;


Alter table layoffs_staging2
modify column `date` DATE;

select *
from layoffs_staging2
where total_laid_off is NULL
and percentage_laid_off is null;


select *
from layoffs_staging2
where industry is null or industry ='';


select *
from layoffs_staging2
where company='Airbnb';



select t1.industry, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
       on t1.company=t2.company
where (t1.industry is null or t1.industry='') and t2.industry is not null;


update layoffs_staging2
set industry = null
where industry ='';



update layoffs_staging2 t1
join layoffs_staging2 t2
       on t1.company=t2.company
 set t1.industry= t2.industry
 where t1.industry is null  and t2.industry is not null;
 
 
 select *
 from layoffs_staging2;
 
 
select *
from layoffs_staging2
where total_laid_off is NULL
and percentage_laid_off is null;


Delete
from layoffs_staging2
where total_laid_off is NULL
and percentage_laid_off is null;


Alter table layoffs_staging2
drop column row_num;