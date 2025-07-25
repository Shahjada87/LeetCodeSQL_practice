--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 1693 Daily leads and Partners 

Create table if not exists 47DailyLeadsPartners1693(
    date_id date,
    make_name varchar(50),
    lead_id int,
    partner_id int
);

Insert into 47DailyLeadsPartners1693 values 
('2020-12-08', 'toyota', 0, 1),
('2020-12-08', 'toyota', 1, 0),
('2020-12-08', 'toyota', 1, 2),
('2020-12-07', 'toyota', 0, 2),
('2020-12-07', 'toyota', 0, 1),
('2020-12-08', 'honda', 1, 2),
('2020-12-08', 'honda', 2, 1),
('2020-12-07', 'honda', 0, 1),
('2020-12-07', 'honda', 1, 2),
('2020-12-07', 'honda', 2, 1);


mysql> select * from 47DailyLeadsPartners1693;
+------------+-----------+---------+------------+
| date_id    | make_name | lead_id | partner_id |
+------------+-----------+---------+------------+
| 2020-12-08 | toyota    |       0 |          1 |
| 2020-12-08 | toyota    |       1 |          0 |
| 2020-12-08 | toyota    |       1 |          2 |
| 2020-12-07 | toyota    |       0 |          2 |
| 2020-12-07 | toyota    |       0 |          1 |
| 2020-12-08 | honda     |       1 |          2 |
| 2020-12-08 | honda     |       2 |          1 |
| 2020-12-07 | honda     |       0 |          1 |
| 2020-12-07 | honda     |       1 |          2 |
| 2020-12-07 | honda     |       2 |          1 |
+------------+-----------+---------+------------+
10 rows in set (0.00 sec)


--For each date_id and make_name, find the number of distinct lead_id's and distinct partner_id's.
--Return the result table in any order.


Select date_id,make_name,
    count(DISTINCT lead_id) as lead_id,
    count(DISTINCT partner_id) as partner_id
from 47DailyLeadsPartners1693 
group by date_id, make_name;



Output 


+------------+-----------+---------+------------+
| date_id    | make_name | lead_id | partner_id |
+------------+-----------+---------+------------+
| 2020-12-07 | honda     |       3 |          2 |
| 2020-12-07 | toyota    |       1 |          2 |
| 2020-12-08 | honda     |       2 |          2 |
| 2020-12-08 | toyota    |       2 |          3 |
+------------+-----------+---------+------------+
4 rows in set (0.01 sec)

