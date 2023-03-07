--This was a practice challenge on HackerRank to test intermediate query writing using joins.
--This statement selects the ID, name, and number of challenges created of only the students who either didn't make the same number of challenges as any other student or made the highest number of challenges, from the CHALLENGES and HACKERS tables, ordered by ID.

--Challenges
--MS SQL Server
--https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true
--Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

Select h.hacker_id, name, count(challenge_id) From hackers h
Join challenges c on h.hacker_id = c.hacker_id
Group by h.hacker_id, name
Having count(challenge_id) in
    (Select max(cc2) From --selects only the hackers who created the highest number of challenges
        (Select count(challenge_id) as cc2 From challenges
        Group by hacker_id) as t3) --counts how many challenges each hacker created
    Or count(challenge_id) in
    (Select cc3 From
        (Select count(challenge_id) as cc3 From challenges
        Group by hacker_id) as t4
    Group by cc3
    Having count(cc3) = 1) --excludes hackers who made the same number of challenges as someone else
Order by count(challenge_id) desc, h.hacker_id;