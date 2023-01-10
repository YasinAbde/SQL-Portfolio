--This was a practice challenge on HackerRank to test query writing using advanced joins.
--This query uses subqueries and an implicit join to list the project start date with its end date.

--SQL Project Planning
--MySQL
--https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true
--Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.

Select start_date, min(end_date) From --end_date has to be aggregated so the minimum function is used.
    (Select start_date From Projects where start_date not in 
        (Select end_date from Projects)) as a, --This subquery and the one below it eliminate the dates we don't need because they're between the start and end dates.
    (Select end_date From Projects where end_date not in
        (Select start_date From Projects)) as b
Where start_date < end_date --The start obviously needs to come before the end.
Group by start_date
Order by datediff(start_date, min(end_date)) desc, start_date; --The datediff function finds the difference between the dates so we can order by the number of days the project took.