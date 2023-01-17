--This was a practice problem on HackerRank to test aggregation.
--This statement finds the difference between the actual average salary and the miscalculated average and round it to the highest integer. 
--To do this I needed to recreate the error with the replace function to remove all 0s and used the ceiling function to round the result to the nearest integer.

--The Blunder
--MySQL
--https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true
--Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), and round it up to the next integer.

Select ceiling(avg(cast(salary as Decimal (10,2))) - avg(cast(replace(salary,0,'') as Decimal (10,2)))) From employees;