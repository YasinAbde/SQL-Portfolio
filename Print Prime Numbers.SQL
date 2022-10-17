--This was a practice challenge on HackerRank to test alternative query writing.
--This query creates a while loop and uses declared variables to determine all the prime numbers up to 1000, and then list them with an ampersand between them.

--Print Prime Numbers
--https://www.hackerrank.com/challenges/print-prime-numbers/problem?isFullScreen=true
--Write a query to print all prime numbers less than or equal to 1000. Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).

Create table Prime_Numbers(nr int);

Delimiter && --This sets up a delimiter which allows for a repeatable procedure, and changes the delimiter_character from default (;) to (&&)
Create procedure insert_prime_num() --This names teh procedure 'insert_prime_num'
Begin
    Declare nr int default 2;
    Declare di int;
    Declare prime int;
    
    While nr <= 1000 do --Limits the numbers to 1000 and less
        Set di = nr - 1; --Makes sure the denominator is less than the numerator
        Set prime = 1; --Assumes numbers are prime until proven otherwise
        
	--Prime Number Test
        While di > 1 do --Excludes 1, because 1 is not a prime number.
            If nr % di = 0 then set prime = 0; --A prime number must only be divisible by itself and 1. Thus if you can divide the number by anthing between 1 and itself, and there is not a remainder, it can't be a prime number.
            End if;
        
            Set di = di - 1; --Decreases the denominator so we can test each number less than the numerator.
        End while;

        If prime = 1 then insert into Prime_Numbers values(nr);
        End if;
        Set nr = nr + 1; --Increases the numerator so we can test each number until it is stopped at 1000
    End while;
End&&
Call insert_prime_num();

Select group_concat(nr order by nr asc separator '&') From Prime_Numbers; --Lists the values in a single row with ampersands separating the values, rather than listing each value in its own row.