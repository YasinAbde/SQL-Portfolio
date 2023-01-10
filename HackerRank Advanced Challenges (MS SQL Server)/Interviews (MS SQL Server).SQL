--This was a practice challenge from HackerRank to test advanced query writing using joins.
--This statement joins 5 tables and prints the contest ID, contestant's ID, contestant's, total number of submissions, total number of submissions that recieved full scores (total accepted submissions), total number times a candidate viewed the challenge, and the total number of times unique candidates viewed the challenge.

--Interviews
--MS SQL Server
--https://www.hackerrank.com/challenges/interviews/problem
--Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are 0.

With submit as --Making CTEs with the With statement the submissions and views can be consolodated by the group by function before they are joined in the main query.
    (Select
            coll.contest_id,
            sum(ss.total_submissions) as sumts,
            sum(ss.total_accepted_submissions) as sumtas
    From Colleges coll
    Join Challenges chall on chall.college_id = coll.college_id
    Join Submission_Stats ss on ss.challenge_id = chall.challenge_id
    Group by coll.contest_id),
    
total_view as
    (Select
            coll.contest_id,
            sum(vs.total_views) as sumtv, 
            sum(vs.total_unique_views) as sumtuv
    From Colleges coll
    Join Challenges chall on chall.college_id = coll.college_id
    Join View_Stats vs on vs.challenge_id = chall.challenge_id
    Group by coll.contest_id)
            
Select 
        cont.contest_id, 
        cont.hacker_id, 
        cont.name, 
        ts.sumts,
        ts.sumtas, 
        tv.sumtv, 
        tv.sumtuv
From Contests cont
Join submit ts on ts.contest_id = cont.contest_id
Join total_view tv on tv.contest_id = cont.contest_id
Where ts.sumts > 0 or ts.sumtas > 0 or tv.sumtv > 0 or tv.sumtuv > 0 --This ensures results with all 4 sums as 0 are excluded.
Order by cont.contest_id;