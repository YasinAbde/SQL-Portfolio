--This was a practice problem on HackerRank for testing advanced query writing 
--This statement lists the company code and the name of the founder of each company, as well as how many Lead Managers, Senior Managers, Managers, and Emploees each company has. It also disregards duplicate entries.

--New Companies
--MS SQL Server
--https://www.hackerrank.com/challenges/the-company/copy-from/294158738?isFullScreen=true
--Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Select
    co.company_code,
    co.founder,
    count (distinct em.lead_manager_code),
    count (distinct em.senior_manager_code),
    count (distinct em.manager_code),
    count (distinct em.employee_code)
From company co
Join employee em on co.company_code = em.company_code --Only the Employee table needs to be joined on the Company table because it contains records for all the managers and the question asks for only distinct entries.
Group by co.company_code, co.founder --The founder needs to be included in the group by function because it isn't aggregated.
Order by co.company_code asc; 