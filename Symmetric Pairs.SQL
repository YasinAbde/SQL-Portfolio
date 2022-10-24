--This was a challenge on HackerRank to test advanced query writing using joins.
--This statement uses an implicit self join to select entries from the table Functions who's X match another entry's Y and who's Y match the same entry's X.

--Symmetric Pairs
--https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=true
--Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1. Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.

Select a.X, a.Y From functions a, functions b --This establishes the self join and labels them a and b, to independently reference them.
Where a.X = b.Y and a.Y = b.X
Group by a.X, a.Y --This ensures each pair will only be listed once.
Having (count(a.X) > 1 and count(a.Y) > 1) or a.X < a.Y --The use of count functions makes sure entries that have the same X value as their Y value but don't actually match any other entries aren't listed.
Order by a.X asc;