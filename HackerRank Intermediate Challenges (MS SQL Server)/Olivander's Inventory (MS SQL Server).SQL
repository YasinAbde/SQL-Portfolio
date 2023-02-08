--This was a practice challenge on HackerRank to test query writing using joins.
--This challenge uses Harry Potter terminology to frame the problem. This statement uses a a subquery and an IN statement in the WHERE clause to select only the cheapest wands of each power level, and also restricts the wands to only non-evil wands.

--Ollivander's Inventory
--MS SQL Server
--https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true
--Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.

With min_coins as 
(Select 
    Row_Number() Over(Partition by code, power Order by code, power, coins_needed asc) as RowNum, --By setting up a row number that resets the count every time the code (which represents the age as well) or the power changes and is ordered by code, power, and then coins_needed the row number will always be 1 for the cheapest wand of each combination of power and code, which can be used to filter out redundant, more expensive wands.
    id,
    code,
    coins_needed,
    power
From wands)

Select 
    m.id,
    p.age,
    m.coins_needed,
    m.power
From wands_property p
Join min_coins m on m.code = p.code and m.RowNum = 1
Where p.is_evil = 0
Order by m.power desc, p.age desc;