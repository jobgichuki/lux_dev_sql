
set search_path to international_debt;

 --qtn What is the total amount of debt owned by all countries in the dataset?
select sum(debt) as Total_world_debt
from international_debt_with_missing_values idwmv ;
--ANS 2,823,894,600,000

-- 2. How many distinct countries are recorded in the dataset? 
select count (distinct country_name)as total_countries
from international_debt_with_missing_values idwmv ;
--ANS 125

--3. What are the distinct types of debt indicators, and what do they represent?  
select distinct indicator_code ,coalesce(max(indicator_name),'') as indicator
from international_debt_with_missing_values idwmv 
group by idwmv.indicator_code ;

--  4. Which country has the highest total debt, and how much does it owe?  
select country_name , debt
from international_debt_with_missing_values idwmv 
where debt=(select MAX(debt) from international_debt_with_missing_values );
--ANS china 96,218,620,000

-- 5. What is the average debt across different debt indicators?  
select indicator_name,AVG(debt) as average_debt
from international_debt_with_missing_values idwmv 
group by idwmv.indicator_name ;

 --6. Which country has made the highest amount of principal repayments?
select country_name, sum(debt) 
from international_debt_with_missing_values 
where indicator_name like 'Principal repayment%' and debt is not null
group by country_name
order by sum(debt)desc
limit 1;
--ANS china- 168,611,610,000

-- 7. What is the most common debt indicator across all countries? 
select indicator_name, count(*) as frequency
from international_debt_with_missing_values idwmv 
group by idwmv.indicator_name 
order by frequency desc;
--ANS: PPG,offical creditors (INT, current US$)-116









