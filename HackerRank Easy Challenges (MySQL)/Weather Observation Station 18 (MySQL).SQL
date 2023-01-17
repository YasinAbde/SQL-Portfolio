--This was a practice problem on HackerRank to test aggregate query writing.
--This statement calculates the Manhattan Distance (the absolute value of x1-x2 + the absolute value of y1-y2)

--Weather Observation Station 18
--MySQL
--https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true
--Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.

Select ROUND((ABS(min(Lat_N)-max(Lat_N)))+(ABS(min(Long_W)-max(Long_W))),4) From station;