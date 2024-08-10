-- Exploring Data analysis

-- we worked on the data set before, we first cleaned and now we going to explore the data more

select *
from layoffs_staging2;

select Max(total_laid_off),Max(percentage_laid_off)
from layoffs_staging2;

select *
from layoffs_staging2
where percentage_laid_off =1
order by total_laid_off desc;

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select min(`date`), max(`date`) 
from layoffs_staging2;

select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;

select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 2 desc;


select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 ;

select company, sum(percentage_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

-- rolling total layoff
select substring(`date`,6,2) as`Month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,6,2) is not null
group by `Month`
order by 2 desc;

with Rolling_Total as
(
select substring(`date`,6,2) as `Month`, sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`,6,2) is not null
group by `Month`
order by 1 asc
)
select `Month`,total_off, sum(total_off) over(order by `MONTH`) as rolling_total
from Rolling_Total;




select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc ;


select company, year(`date`),  sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by 3 desc;






















select company, year(`date`),  sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`);


With Company_Year(company, years, total_laid_off) as
(
select company, year(`date`),  sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
)
select *, dense_rank() over (partition by years order by total_laid_off desc)
from Company_Year
where years is not null
;