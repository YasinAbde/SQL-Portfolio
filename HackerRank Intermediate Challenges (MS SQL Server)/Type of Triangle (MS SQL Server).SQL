--This was a practice challenge on HackerRank to test advanced querey writing.
--This statement uses a case function to sort the given data entries into categories based on which triangles their measurements make.

--Type of Triangle
--MS SQL Server
--https://www.hackerrank.com/challenges/what-type-of-triangle/problem?isFullScreen=true
--Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
	--Equilateral: It's a triangle with 3 sides of equal length.
	--Isosceles: It's a triangle with 2 sides of equal length.
	--Scalene: It's a triangle with 3 sides of differing lengths.
	--Not A Triangle: The given values of A, B, and C don't form a triangle.

Select case
	When a + b <= c or b + c <= a or c + a <= b then 'Not A Triangle' --A triangle can't have one side longer or the same length as the combined length of the other two sides.
	When a = b and b = c then 'Equilateral' --If all sides are the same length then it's an equilateral triangle.
	When a <> b and b <> c and c <> a then 'Scalene' --If none of the sides are the same then it's a scalene triangle.
	Else 'Isosceles' --All that remains are triangles with only 2 equal sides, which are isosceles.
	End
From Triangles;