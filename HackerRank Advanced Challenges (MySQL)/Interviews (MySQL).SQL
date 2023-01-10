--This was a practice challenge from HackerRank to test advanced query writing using joins.
--This statement joins 5 tables and prints the contest ID, contestant's ID, contestant's, total number of submissions, total number of submissions that recieved full scores (total accepted submissions), total number times a candidate viewed the challenge, and the total number of times unique candidates viewed the challenge.

--Interviews
--MySQL
--https://www.hackerrank.com/challenges/interviews/problem
--Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are 0.

Select ct.contest_id, ct.hacker_id, ct.name, sum(total_submissions) as total_submissions,
    sum(total_accepted_submissions) as total_accepted_submissions, sum(total_views) as
    total_views, sum(total_unique_views) as total_unique_views
From Contests ct
Join Colleges cg on ct.contest_id = cg.contest_id
Join Challenges ch on cg.college_id = ch.college_id
Left join 
    (Select challenge_id, sum(total_submissions) as total_submissions,
        sum(total_accepted_submissions) as total_accepted_submissions
    From Submission_Stats
    Group by 1) ss on ch.challenge_id = ss.challenge_id --By using subqueries here and again for the views, the submissions and views are already consolodated by the group function before they are joined on the main table.
Left join
    (Select challenge_id, sum(total_views) as total_views, sum(total_unique_views) as
        total_unique_views
    From View_Stats
    Group by 1) vs on ch.challenge_id = vs.challenge_id
Group by 1,2,3 --When a number is used in a group by statement, the table is grouped by wichever column that number represents. In this case: contest_id, hacker_id, and then name.
Having total_submissions <> 0 and total_accepted_submissions <> 0 and total_views <> 0 and total_unique_views <> 0; --Using and statements instead of or statements ensures that the results only exclude entriest where all 4 sums are 0, while including entries where some, but not all, of the sums are 0.