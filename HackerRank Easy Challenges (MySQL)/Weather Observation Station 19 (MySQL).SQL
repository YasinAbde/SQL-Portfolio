--This was a practice problem on HackerRank to test aggregate query writing.
--This statement calculates the Euclidean Distance (the square root of (q1-p1)squared + (q2-p2)squared)

--Weather Observation Station 19
--MySQL
--https://www.hackerrank.com/challenges/weather-observation-station-19/problem?isFullScreen=true
--Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

Select ROUND(SQRT(POW((MAX(LAT_N)-MIN(LAT_N)),2)+POW((MAX(LONG_W)-MIN(LONG_W)),2)),4) From STATION;