--Hackerrank.com hosts several challenge problems to help people prepare for coding interviews. https://www.hackerrank.com/domains/sql?filters%5Bstatus%5D%5B%5D=unsolved&badge_type=sql
--These are all the easy challenges I completed, using MySQL, that I don't think need an expanation.

--Revising the Select Query I
--https://www.hackerrank.com/challenges/revising-the-select-query/problem?isFullScreen=true
--Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

Select * From City Where Population > 100000 and countrycode = 'USA';

--Revisiting the Select Query II
--https://www.hackerrank.com/challenges/revising-the-select-query-2/problem?isFullScreen=true
--Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

Select name From city where countrycode = 'USA' and population > 120000;

--Select All
--https://www.hackerrank.com/challenges/select-all-sql/problem?isFullScreen=true
--Query all columns (attributes) for every row in the CITY table.

Select * From City;

--Select By ID
--https://www.hackerrank.com/challenges/select-by-id/problem?isFullScreen=true
--Query all columns for a city in CITY with the ID 1661.

Select * From city where ID = 1661;

--Japanese Cities' Attributes
--https://www.hackerrank.com/challenges/japanese-cities-attributes/problem?isFullScreen=true
--Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

select * from city where countrycode = 'JPN';

--Japanese Cities' Names
--https://www.hackerrank.com/challenges/japanese-cities-name/problem?isFullScreen=true
--Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

Select name From city where countrycode = 'JPN';

--Weather Observation Station 1
--https://www.hackerrank.com/challenges/weather-observation-station-1/problem?isFullScreen=true
--Query a list of CITY and STATE from the STATION table.

Select city, state From station;

--Weather Observation Station 2
--https://www.hackerrank.com/challenges/weather-observation-station-2/problem?isFullScreen=true
--Query the following two values from the STATION table: The sum of all values in LAT_N rounded to a scale of 2 decimal places. The sum of all values in LONG_W rounded to a scale of 2 decimal places.

Select round(sum(lat_n),2),round(sum(long_w),2) From station;

--Weather Observation Station 3
--https://www.hackerrank.com/challenges/weather-observation-station-3/problem?isFullScreen=true
--Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

Select distinct city From station where ID%2 = 0;

--Weather Observation Station 4
--https://www.hackerrank.com/challenges/weather-observation-station-4/problem?isFullScreen=true
--Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

Select (count(city) - count(distinct city)) From station;

--Weather Observation Station 5
--https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true
--Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

Select city, length(city) From station order by length(city), city limit 1;
Select city, length(city) From station order by length(city) desc, city limit 1;

--Weather Observation Station 6
--https://www.hackerrank.com/challenges/weather-observation-station-6/problem?isFullScreen=true
--Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

Select Distinct City From Station Where City rlike '^[aeiou]';

--Weather Observation Station 7
--https://www.hackerrank.com/challenges/weather-observation-station-7/problem?isFullScreen=true
--Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

Select Distinct city From station where right(city,1) in ('a','e','i','o','u');

--Weather Observation Station 8
--https://www.hackerrank.com/challenges/weather-observation-station-8/problem?isFullScreen=true
--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

Select Distinct city From station where city regexp '[aeiou]$' and city regexp '^[aeiou]';

--Weather Observation Station 9
--https://www.hackerrank.com/challenges/weather-observation-station-9/problem?isFullScreen=true
--Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

Select Distinct city From station where city not regexp '^[aeiou]';

--Weather Observation Station 10
--https://www.hackerrank.com/challenges/weather-observation-station-10/problem?isFullScreen=true
--Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

Select Distinct city From station where city not regexp '[aeiou]$';

--Weather Observation Station 11
--https://www.hackerrank.com/challenges/weather-observation-station-11/problem?isFullScreen=true
--Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

Select Distinct city From station where city not regexp '^[aeiou]' or city not regexp '[aeiou]$';

--Weather Observation Station 12
--https://www.hackerrank.com/challenges/weather-observation-station-12/problem?isFullScreen=true
--Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

Select Distinct city From station where city not regexp '^[aeiou]' and city not regexp '[aeiou]$';

--Weather Observation Station 13
--https://www.hackerrank.com/challenges/weather-observation-station-13/problem?isFullScreen=true
--Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.

Select round(sum(lat_n),4) From station where lat_n > 38.7880 and lat_n < 137.2345;

--Weather Observation Station 14
--https://www.hackerrank.com/challenges/weather-observation-station-14/problem?isFullScreen=true
--Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.

Select round(max(lat_n),4) From station where lat_n < 137.2345;

--Weather Observation Station 15
--https://www.hackerrank.com/challenges/weather-observation-station-15/problem?isFullScreen=true
--Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.

Select round(long_w,4) From station where lat_n < 137.2345 order by lat_n desc limit 1;

--Weather Observation Station 16
--https://www.hackerrank.com/challenges/weather-observation-station-16/problem?isFullScreen=true
--Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.

Select round(min(lat_n),4) From station where lat_n > 38.7780;

--Weather Observation Station 17
--https://www.hackerrank.com/challenges/weather-observation-station-17/problem?isFullScreen=true
--Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.

Select round(long_w,4) From station where lat_n > 38.7780 order by lat_n asc limit 1;

--Higher Than 75 Marks
--https://www.hackerrank.com/challenges/more-than-75-marks/problem?isFullScreen=true
--Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

Select name From students where marks > 75 order by (right(name,3)), id asc;

--Employee Names
--https://www.hackerrank.com/challenges/name-of-employees/problem?isFullScreen=true
--Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

Select name From Employee order by name;

--Employee Salaries
--https://www.hackerrank.com/challenges/salary-of-employees/problem?isFullScreen=true
--Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.

Select name From employee where salary > 2000 and months < 10 order by employee_id;

--Revising Aggregations - The Count Function
--https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem?isFullScreen=true
--Query a count of the number of cities in CITY having a Population larger than 100,000.

Select count(name) From city where population > 100000;

--Revising Aggregations - The Sum Function
--https://www.hackerrank.com/challenges/revising-aggregations-sum/problem?isFullScreen=true
--Query the total population of all cities in CITY where District is California.

Select sum(population) From city where district = "California";

--Revising Aggregations - Averages
--https://www.hackerrank.com/challenges/revising-aggregations-the-average-function/problem?isFullScreen=true
--Query the average population of all cities in CITY where District is California.

Select avg(population) From city where district ="California";

--Average Population
--https://www.hackerrank.com/challenges/average-population/problem?isFullScreen=true
--Query the average population for all cities in CITY, rounded down to the nearest integer.

Select round(avg(population),0) From city;

--Japan Population
--https://www.hackerrank.com/challenges/japan-population/problem?isFullScreen=true
--Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

Select sum(population) From city where countrycode = "JPN";

--Population Density Difference
--https://www.hackerrank.com/challenges/population-density-difference/problem?isFullScreen=true
--Query the difference between the maximum and minimum populations in CITY.

select (max(population)-min(population)) from city;

--Population Census
--https://www.hackerrank.com/challenges/asian-population/problem?isFullScreen=true
--Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Select sum(city.population) From city 
Join country cu on city.countrycode = cu.code
Where cu.continent = 'Asia';

--African Cities
--https://www.hackerrank.com/challenges/african-cities/problem?isFullScreen=true
--Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Select city.name From city 
Join country cu on city.countrycode = cu.code
Where continent='Africa';

--Average Population of Each Continent
--https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=true
--Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Select country.continent, floor(avg(ci.population)) From country
Join city ci on country.code = ci.countrycode group by continent;