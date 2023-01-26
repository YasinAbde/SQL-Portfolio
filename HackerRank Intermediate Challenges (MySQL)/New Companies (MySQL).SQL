--This was a practice problem on HackerRank for testing advanced query writing 
--This statement lists the company code and the name of the founder of each company, as well as how many Lead Managers, Senior Managers, Managers, and Emploees each company has. It also disregards duplicate entries.

--New Companies
--MySQL
--https://www.hackerrank.com/challenges/the-company/copy-from/294158738?isFullScreen=true
--Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Select 
	E.company_code, 
	max(C.founder), --The max function is used on founder because it isn't included in the group function so it has to be aggregated.
	count(distinct(lead_manager_code)), 
	count(distinct(senior_manager_code)), 
	count(distinct(manager_code)), 
	count(distinct(E.employee_code))
From Employee E
Left Join Company C on C.company_code = E.company_code --I only need to join Employee and Company because the Employee table has recods for all the managers and I'm only counting distinct entries.
Group by E.company_code order by E.company_code asc;