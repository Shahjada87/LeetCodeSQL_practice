--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1693 Daily leads and Partners 

Create table if not exists 57DailyLeadsPartners1693(
    date_id date,
    make_name varchar(50),
    lead_id int,
    partner_id int
);

Insert into 57DailyLeadsPartners1693 values 
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

mysql> select * from 57DailyLeadsPartners1693;
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
10 rows in set (0.01 sec)


--For each date_id and make_name, find the number of distinct lead_id's and distinct partner_id's.
--Return the result table in any order.




SELECT date_id, make_name, 
       COUNT(DISTINCT lead_id) AS unique_leads, 
       COUNT(DISTINCT partner_id) AS unique_partners
FROM 57DailyLeadsPartners1693
GROUP BY date_id, make_name;

Output

+------------+-----------+--------------+-----------------+
| date_id    | make_name | unique_leads | unique_partners |
+------------+-----------+--------------+-----------------+
| 2020-12-07 | honda     |            3 |               2 |
| 2020-12-07 | toyota    |            1 |               2 |
| 2020-12-08 | honda     |            2 |               2 |
| 2020-12-08 | toyota    |            2 |               3 |
+------------+-----------+--------------+-----------------+