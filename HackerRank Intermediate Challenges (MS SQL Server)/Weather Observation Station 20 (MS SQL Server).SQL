--This was a practice challenge on HackerRank to test intermediate aggregate statement writing.
--This statement selects the median of the Northern Latitudes from the STATION table rounded to 4 decimal places.

--Weather Observation Station 20
--MS SQL Server
--https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true
--Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

WITH MED AS
(SELECT *,
	ROW_NUMBER() OVER(ORDER BY LAT_N ASC) rn,
	ROW_NUMBER() OVER(ORDER BY LAT_N DESC) dn
FROM STATION) --This creates two lists of the same values, and assigns row numbers to each value, but one is orderd acending and the other is descending.
SELECT CAST(AVG(LAT_N) AS DECIMAL (9,4)) FROM MED
WHERE ABS(rn - dn) <= 1; --Because these are the same rown numbers listed in opposing directions, if the absolute value of their difference is 1 or 0 then those numbers are in the center of the list which is the median. Since we're selecting the average of these values this covers the cases where there are 2 numbers in the center of the number line.