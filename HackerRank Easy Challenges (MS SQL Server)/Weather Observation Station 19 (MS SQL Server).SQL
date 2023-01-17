--This was a practice problem on HackerRank to test aggregate query writing.
--This statement calculates the Euclidean Distance (the square root of (q1-p1)squared + (q2-p2)squared)

--Weather Observation Station 19
--MySQL
--https://www.hackerrank.com/challenges/weather-observation-station-19/problem?isFullScreen=true
--Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

Select cast(sqrt(power((max(lat_n) - min(lat_n)),2) + power((max(long_w) - min(long_w)),2)) as Decimal (10,4)) From station;