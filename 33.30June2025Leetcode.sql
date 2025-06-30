--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 1211 Queries Quality and Percentage

create table if not exists 24QueriesAndQuality1211(
    query_name varchar(50),
    result varchar(50),
    position int,
    rating int
);

insert into 24QueriesAndQuality1211 values 
('Dog', 'Golden Retriever', 1, 5),
('Dog', 'German Shepherd', 2, 5),
('Dog', 'Mule', 200, 1),
('Cat', 'Shirazi', 5, 2),
('Cat', 'Siamese', 3, 3),
('Cat', 'Sphynx', 7, 4);


mysql> select * from 24QueriesAndQuality1211;
+------------+------------------+----------+--------+
| query_name | result           | position | rating |
+------------+------------------+----------+--------+
| Dog        | Golden Retriever |        1 |      5 |
| Dog        | German Shepherd  |        2 |      5 |
| Dog        | Mule             |      200 |      1 |
| Cat        | Shirazi          |        5 |      2 |
| Cat        | Siamese          |        3 |      3 |
| Cat        | Sphynx           |        7 |      4 |
+------------+------------------+----------+--------+
6 rows in set (0.01 sec)



--We define query quality as:
--The average of the ratio between query rating and its position.
--We also define poor query percentage as:
--The percentage of all queries with rating less than 3
--Write a solution to find each query_name, the quality and poor_query_percentage.
--Both quality and poor_query_percentage should be rounded to 2 decimal places.
--Return the result table in any order.

select query_name, 
round(avg(rating/position),2) as quality,
round(sum(case when rating < 3 then 1 else 0 end) * 100 / count(*),2) as poor_query_percentage
from 24QueriesAndQuality1211
group by query_name;


Output 


+------------+---------+-----------------------+
| query_name | quality | poor_query_percentage |
+------------+---------+-----------------------+
| Dog        |    2.50 |                 33.33 |
| Cat        |    0.66 |                 33.33 |
+------------+---------+-----------------------+
2 rows in set (0.01 sec)




---------------------------------------------------------------------------------------------------------


