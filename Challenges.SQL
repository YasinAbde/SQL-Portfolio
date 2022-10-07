--This was a practice challenge on HackerRank to test intermediate querie writing using joins.
--This statement selects the ID, name, and number of challenges created of only the students who either didn't make the same number of challenges as any other student or made the highest number of challenges, from the CHALLENGES and HACKERS tables, ordered by ID.

--Challenges
--https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true
--Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

Select h.hacker_id, h.name, count(c.challenge_id) as tch From hackers h
Join challenges c on h.hacker_id = c.hacker_id
Group by h.hacker_id, h.name
Having tch in
    (Select max(ch_count) --selects only the hackers who created the highest number of challenges
     From
     (Select count(challenge_id) as ch_count From challenges
     Group by hacker_id) as t3) --counts how many challenges each hacker created
     Or tch in
     (Select ch_count From
     (Select count(challenge_id) as ch_count From challenges
     Group by hacker_id) as t4
     Group by ch_count having count(ch_count) = 1) --excludes hackers who made the same number of challenges as someone else
Order by tch desc, h.hacker_id;