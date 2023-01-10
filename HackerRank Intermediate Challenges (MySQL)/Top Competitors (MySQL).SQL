--This was a practice challenge on HackerRank to test query writing using joins.
--This statement uses several joins to list the IDs and names of hackers, but only those who scored the maximum in more than 1 challenge, and orders them by how many challenges they scored maximum in and by ID.

--Top Competitors
--MySQL
--https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true
--Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

Select h.hacker_id, h.name From hackers h
    Join submissions s on h.hacker_id = s.hacker_id
    Join challenges c on s.challenge_id = c.challenge_id
    Join difficulty d on c.difficulty_level = d.difficulty_level
Group by h.hacker_id, h.name
Having sum(case
                When s.score = d.score then 1
                Else 0
                End) > 1 --This excludes all hackers who didn't earn full scores in more than 1 challenge.
Order by sum(case
                When s.score = d.score then 1
                Else 0
                End) desc, h.hacker_id asc;