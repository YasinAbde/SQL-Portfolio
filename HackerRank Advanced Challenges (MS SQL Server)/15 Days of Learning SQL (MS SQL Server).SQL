--This was a practice challenge from HackerRank to test advanced query writing using joins and variables.
--These statements list the dates for each day of the competition, counts the number of hackers who made a submission each of those days progressively, lists the ID of the hacker who made the most submissions each day (using the lowest ID in ties), and lists the name of the hacker with the most submissions each day.

--15 Days of Learning SQL
--MS SQL Server
--https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem?isFullScreen=true
--Write a query to print total number of unique hackers who made at least 1 submission each day (starting on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number of submissions each day. If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.

Declare @consistent_hackers Table --Because only two tables are given and there's limited information in each of them multiple tables, variables, and subqueries are needed to find the hackers who made submissions each progressive day and which hacker made the most submissions each day.
(hacker_id int,
 submission_date date);

Declare @count_hackers Table
(consist_hackers int,
submission_date date);
 
Declare @subdate date;
Declare @remainingdate date;

Insert Into @consistent_hackers --For the first day I can just insert all the hackers who made a submission that day. There aren't any previous days for them to have missed, disqualifying them.
Select hacker_id, submission_date
From submissions
Where submission_date = '2016-03-01';

Set @subdate = '2016-03-01';
Set @remainingdate = '2016-03-01';

While @subdate < '2016-03-15' --I want the while loop to end once the date reaches the 15th because the date is increased inside the while loop, so if it repeated again at that point the date would increase to the 16th and then be inserted into the @consistent_hackers table. This isn't actually a problem in this case because there aren't any entries with dates past the 15th, but to be safe I'll end the loop here.
Begin
    Set @subdate = Dateadd(day,1,@subdate); --This increases the subdate variable by 1 day.
    
    Insert Into @consistent_hackers
    Select 
        s.hacker_id, 
        s.submission_date
    From submissions s
    Join @consistent_hackers ch on ch.hacker_id = s.hacker_id and 
        ch.submission_date = @remainingdate --This ensures the entries are only inserted if the hacker_id has a corresponding submission_date already in the consistent_hackers table, on the previous day, represented by the remainingdate variable.
    Where s.submission_date = @subdate;
    
    Set @remainingdate = Dateadd(day,1,@remainingdate); --Increases the remainingdate variable by 1 day.
End;

Insert Into @count_hackers
Select 
    Count(Distinct hacker_id), --I need the number of hackers who made a submission each day, not the IDs, so another table with a count of the distinct hacker IDs from the consistent hackers table is needed.
    submission_date
From @consistent_hackers
Group by submission_date;

With max_hacker as --To find which hacker made the most submissions each day a Common Table Expression (CTE) is needed so I can easily refer back to it later.
(Select 
    Row_Number() Over(Partition by submission_date order by count(s.hacker_id) DESC, s.hacker_id ASC) as Row#, --By using a Row Number function I can rank each hacker by how many submissions they make and separate it by date.
    s.hacker_id,
    submission_date,
    name
From submissions s
Join hackers h on h.hacker_id = s.hacker_id
Group by submission_date, s.hacker_id, name)

Select 
    s.submission_date, 
    coh.consist_hackers,
    mh.hacker_id,
    mh.name
From submissions s
Join max_hacker mh on mh.submission_date = s.submission_date
and Row# = 1 --Because of the partition by and order by clauses in the Row Number function above the hacker with the most submissions and lowest ID each day will be numbered 1 in Row#.
Join @count_hackers coh on coh.submission_date = s.submission_date
Group by s.submission_date, mh.hacker_id, mh.name, coh.consist_hackers
Order by s.submission_date;