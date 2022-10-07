--These are the only 2 practice challenges on HackerRank listed as "Alternative Queries"

--Draw The Triangle 1
--https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?isFullScreen=true
--P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
--* * * * * 
--* * * * 
--* * * 
--* * 
--* 
--Write a query to print the pattern P(20).

delimiter // --This sets up a delimiter which creates a repeatable procedure, and changes the delimiter_character from default (;) to (//)
create procedure triangleD(n int) --This names the prcedure 'triangle' with a variable 'n' which is an integer
begin
    declare a int;
    set a = n;
    while a > 0 do --Makes the procedure stop once a becomes 0
        select repeat('* ', a);
        set a = a-1; --set's a to be 1 less than what it was so when the procedure is repeated it makes a triangle shape pointing down
    end while;
end //
delimiter //
call triangleD(20); --begins the procedure with n being 20

--Draw The Triangle 2
--https://www.hackerrank.com/challenges/draw-the-triangle-2/problem?isFullScreen=true
--P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
--* 
--* * 
--* * * 
--* * * * 
--* * * * *
--Write a query to print the pattern P(20).

delimiter //
create procedure triangleU(n int)
begin
    declare a int;
    set a = 1;
    while a <= n do --makes sure the procedure stops at the inpunt number of levels
        select repeat('* ', a);
        set a = a+1;
    end while;
end //
delimiter //
call triangleU(20);