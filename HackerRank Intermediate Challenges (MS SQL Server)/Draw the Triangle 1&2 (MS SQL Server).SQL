--These are the only 2 practice challenges on HackerRank listed as "Alternative Queries"

--Draw The Triangle 1
--MS SQL Server
--https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?isFullScreen=true
--P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
--* * * * * 
--* * * * 
--* * * 
--* * 
--* 
--Write a query to print the pattern P(20).

declare @x int = 20; --This declares the variable and sets it to 20.
while @x > 0 --This sets the While loop to stop once the triangle is finished, when it prints just one star.
	begin
	print(replicate('* ',@x)) --The combination of the print and replicate functions will print a number of stars equal to the variable.
	set @x = @x-1 --This reduces the variable by 1 so the print is in the shape of a triangle pointing down.
end;

--Draw The Triangle 2
--https://www.hackerrank.com/challenges/draw-the-triangle-2/problem?isFullScreen=true
--P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
--* 
--* * 
--* * * 
--* * * * 
--* * * * *
--Write a query to print the pattern P(20).

declare @x int = 1;
while (@x <= 20) --This ensures the print stops at the input number of levels.
begin
    print(replicate('* ',@x))
set @x = @x+1 -- This increases the variable by 1 so the print is in the shape of a triangle pointing up.
end;