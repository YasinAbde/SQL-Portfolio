--This was a practice challenge on HackerRank to test alternative query writing.
--This query creates a while loop and uses declared variables to determine all the prime numbers up to 1000, and then list them with an ampersand between them.

--Print Prime Numbers
--MS SQL Server
--https://www.hackerrank.com/challenges/print-prime-numbers/problem?isFullScreen=true
--Write a query to print all prime numbers less than or equal to 1000. Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).

Create Table Prime_Numbers (number Int);

Declare @nr Int = 1; --This declares the variable for the numerator.
Declare @dr Int; --This declares the variable for the denominator.
Declare @prime Bit; --This declares the variable to mark numbers as prime or not so the bit data type is used because there's only 2 options.

While @nr <= 1000 --This limits the numbers to 1000 and under.
    Begin
    Set @dr = @nr -1; --Makes sure the denominator is less than the numerator and is set inside the loop so that it is rest for each numerator.
    Set @prime = 1; --Assumes the number is prime until proven otherwise.
    
    --Prime Number Test
    While @dr > 1 --Excludes 1 because 1 is not a prime number.
        Begin
        If @nr % @dr = 0 --A prime number must only be divisible by itself and 1. Thus if you can divide the number by anthing between 1 and itself, and there is not a remainder, it can't be a prime number.
            Set @prime = 0;
        Set @dr = @dr - 1 --Decreases the denominator so we can test each number less than the numerator.
        End
    If @prime = 1 And @nr <> 1 --Excludes 1 because 1 is not a prime number.
        Insert into Prime_Numbers (number) values (@nr);
        
    Select @nr = @nr + 1 --Increases the numerator so we can test each number until it is stopped at 1000.
    End
Select string_agg(number,'&') From Prime_Numbers; --Lists the values in a single row with ampersands separating the values, rather than listing each value in its own row.