select h.hacker_id, h.name, count(c.challenge_id) as tch from hackers h
join challenges c on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having tch in
    (select max(ch_count) 
     from
     (select count(challenge_id) as ch_count FROM challenges
     group by hacker_id) as t3)
     or tch in
     (select ch_count from
     (select count(challenge_id) as ch_count from challenges
     group by hacker_id) as t4
     group by ch_count having count(ch_count) = 1)
order by tch desc, h.hacker_id;