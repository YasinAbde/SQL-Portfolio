--This was a practice challenge on HackerRank to test advanced query writing.
--The first statement selects the name and first letter of their occupation of everyone in the OCCUPATIONS table, formats those names with parentheses around the first letter of the occupation, and orders them alphabetically.
--The second statement lists how many entries for each occupation there are in the OCCUPATIONS table.


--The PADS
--MySQL
--https://www.hackerrank.com/challenges/the-pads/problem?isFullScreen=true
--Generate the following two result sets:
	--Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
	--Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
		--"There are a total of [occupation_count] [occupation]s."
	--where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Select concat(name,'(',left(occupation,1),')') as name From occupations order by name asc; --Creates the template to print each name with the first letter of their occupation, capitalized, in parentheses after it.

Select concat("There are a total of ", count(occupation), " ", lcase(occupation), "s.") --Lists how many people there are in each occupation.
From occupations group by occupation order by count(occupation) asc,occupation asc;