--This was a practice challenge on HackerRank to test advanced query writing.
--This statement selects the names of each person sepatated into columns for each profession.


--Occupations
--MySQL
--https://www.hackerrank.com/challenges/occupations/problem?isFullScreen=true
--Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Select
    max(case when oc.occupation = 'Doctor' then oc.name end) as 'Doctor',
    max(case when oc.occupation = 'Professor' then oc.name end) as 'Professor',
    max(case when oc.occupation = 'Singer' then oc.name end) as 'Singer',
    max(case when oc.occupation = 'Actor' then oc.name end) as 'Actor'
From
(Select name, occupation,
ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY OCCUPATION,NAME ASC) AS RowNumber --This assigns a row number to each name. The row number restarts if the occupation changes.
From OCCUPATIONS) as oc 
group by oc.RowNumber --This separates the names into columns for each occupation using the row numbers assigned to them above.