--This was a practice challenge on HackerRank to test aggregation.
--This statement calculates the maximum total earnings for an employee and lists how many employees are earning that much.

--Top Earners
--MySQL
--https://www.hackerrank.com/challenges/earnings-of-employees/copy-from/286932589?isFullScreen=true
--Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.

Select max(salary * months), count(name) From employee 
Where salary * months = (Select max(salary * months) From employee); --A subquery is needed because max (an aggregate function) isn't allowed in the where clause.