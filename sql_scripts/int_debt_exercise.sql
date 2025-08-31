
set search_path to international_debt;

 --qtn What is the total amount of debt owned by all countries in the dataset?
select sum(debt) as Total_world_debt
from international_debt_with_missing_values idwmv ;

--ANS 2,823,894,600,000
