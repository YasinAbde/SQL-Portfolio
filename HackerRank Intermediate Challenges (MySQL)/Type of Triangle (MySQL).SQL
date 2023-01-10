--This was a practice challenge on HackerRank to test advanced querey writing.
--This statement uses a case function to sort the given data entries into categories based on which triangles their measurements make.

--Type of Triangle
--MySQL
--https://www.hackerrank.com/challenges/what-type-of-triangle/problem?isFullScreen=true
--Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
	--Equilateral: It's a triangle with 3 sides of equal length.
	--Isosceles: It's a triangle with 2 sides of equal length.
	--Scalene: It's a triangle with 3 sides of differing lengths.
	--Not A Triangle: The given values of A, B, and C don't form a triangle.

Select 
Case
	When (A+B<=C or B+C<=A or A+C<=B) then "Not A Triangle" --A triangle can't have 1 side longer than the combined length of the other sides.
	When A=B and B=C then "Equilateral" --If all sides are the same then it's an equilateral triangle.
	when A<>B and B<>C and A<>C then "Scalene" --If none of the sides are the same then it's scalene.
	Else "Isosceles" --Triangles with 2 equal sides are isosceles.
END
From TRIANGLES;