--This was a practice challenge on HackerRank to test basic query writing using joins.
--This statement uses a case function to list all students who got a grade lower than 8 as NULL instead of their name.

--The Report
--MS SQL Server
--https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true
--Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order. Write a query to help Eve.

Select 
Case
    When g.grade >= 8 Then s.name
    Else NULL
    End as 'Name',
g.grade,
s.marks From students s
Join grades g on s.marks between g.min_mark and g.max_mark --The between function is needed because the Grades table converts the double didget Mark into a single didget Grade, so to assign a mark a grade you can't just use an equals sign like most join functions. Instead between is used to assign the grade if the mark is between the assigned range for that grade (Min_Mark through Max_Mark).
Order by g.grade desc, s.name asc, s.marks asc;