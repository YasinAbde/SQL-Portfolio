--This was a practice challenge on HackerRank to test intermediate querie writing using joins.
--This statement selects the ID, name, and total score of students from the HACKERS and SUBMISSIONS tables, adding the best attempts of each student for each challenge to get their total scores, and excluding students who got a total score of 0, ordered by descending total scores and ascending ID.

--Contest Leaderboard
--https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true
--Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0 from your result.

Select hacker_id, name, sum(score) as total --the 'sum(score)' reffers to the subquerey below so it's adding the best attempts of each challenge to get the total score
From
    (Select h.hacker_id, h.name, s.challenge_id, max(s.score) as score 
        From hackers h join submissions s on h.hacker_id = s.hacker_id
        Group by h.hacker_id, h.name, s.challenge_id) as t1 --aggregates just the best attempts of each hacker for each challenge
Group by hacker_id, name having total > 0
Order by total desc, hacker_id; 