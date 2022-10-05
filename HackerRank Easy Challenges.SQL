--Hackerrank.com hosts several challenge problems to help people prepare for coding interviews. https://www.hackerrank.com/domains/sql?filters%5Bstatus%5D%5B%5D=unsolved&badge_type=sql
--These are all the easy difficult challenges and the answers I submitted as I practiced for the SQL Basic Certification.

--Revising the Select Query I
--https://www.hackerrank.com/challenges/revising-the-select-query/problem?isFullScreen=true
--Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

Select * From City Where Population > 100000 and countrycode = 'USA';

--Revisiting the Select Query II
--https://www.hackerrank.com/challenges/revising-the-select-query-2/problem?isFullScreen=true
--Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

Select name From city where countrycode = 'USA' and population > 120000;