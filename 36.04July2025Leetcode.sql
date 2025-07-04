--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 619 Biggest Single NUMBER

create table if not exists 27BiggestSingleNumber619(
    num int
);


insert into 27BiggestSingleNumber619 values 
(8),
(8),
(3),
(3),
(1),
(4),
(5),
(6);


mysql> select * from 27BiggestSingleNumber619;
+------+
| num  |
+------+
|    8 |
|    8 |
|    3 |
|    3 |
|    1 |
|    4 |
|    5 |
|    6 |
+------+
8 rows in set (0.01 sec)


--A single number is a number that appeared only once in the MyNumbers table.
--Find the largest single number. If there is no single number, report null.

with cte as 
(Select num
from 27BiggestSingleNumber619
group by num
having count(num) =1)
Select  case when count(num) > 1 then max(num) else null end as num
from cte 

Output

+------+
| num  |
+------+
|    6 |
+------+
1 row in set (0.01 sec)

