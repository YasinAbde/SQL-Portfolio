select
    max(case when oc.occupation = 'Doctor' then oc.name end) as 'Doctor',
    max(case when oc.occupation = 'Professor' then oc.name end) as 'Professor',
    max(case when oc.occupation = 'Singer' then oc.name end) as 'Singer',
    max(case when oc.occupation = 'Actor' then oc.name end) as 'Actor'
from
(select name, occupation,
ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY OCCUPATION,NAME ASC) AS RowNumber
from OCCUPATIONS) as oc group by oc.RowNumber