--This was a practice challenge on HackerRank to test advanced query writing using joins.
--This statement uses three joins on three tables, joining one of the tables twice but on different columns, to list people who's best friends were offered higher salaries than them.

--Placements
--https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true
--Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.

Select S.name From students S
    Join friends F on F.ID = S.ID
    Join packages PS on PS.ID = S.ID
    Join packages PF on PF.ID = F.Friend_ID
Where PS.salary < PF.salary --By joining packages on both ID and Friend_ID, after joining friends on students, we can easily compare the salaries of a student and their best friend.
Order by PF.salary;