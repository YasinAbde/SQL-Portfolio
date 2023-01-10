--This was a practice challenge on HackerRank to test query writing using joins.
--This challenge uses Harry Potter terminology to frame the problem. This statement uses a a subquery and an IN statement in the WHERE clause to select only the cheapest wands of each power level, and also restricts the wands to only non-evil wands.

--Ollivander's Inventory
--MySQL
--https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true
--Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.

Select w.id, p.age, w.coins_needed, w.power from wands w
Join wands_property p on w.code = p.code
Where p.is_evil = 0 
And w.coins_needed in (Select min(wa.coins_needed) From wands wa 
                   Where wa.code = p.code 
                   Group by wa.power) --Only lists the cheapest wands of each power level that aren't evil.
Order by power desc, age desc;