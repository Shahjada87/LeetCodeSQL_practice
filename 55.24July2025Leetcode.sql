--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 610 Triangle Judgement

create table if not exists 46TriangleJudgement610(
    X int primary key,
    Y int,
    Z int
)


Insert into 46TriangleJudgement610 values 
(13,15,30),
(10,20,15);



mysql> select * from 46TriangleJudgement610;
+----+------+------+
| X  | Y    | Z    |
+----+------+------+
| 10 |   20 |   15 |
| 13 |   15 |   30 |
+----+------+------+
2 rows in set (0.00 sec)



--Report for every three line segments whether they can form a triangle.
--Return the result table in any order.


select *,
case when x + y > z AND Y + Z > x AND x + z > Y  then 'Yes'
    else 'No' END
as Triangle 
from 46TriangleJudgement610;


Output 


+----+------+------+----------+
| X  | Y    | Z    | Triangle |
+----+------+------+----------+
| 10 |   20 |   15 | Yes      |
| 13 |   15 |   30 | No       |
+----+------+------+----------+
2 rows in set (0.00 sec)


------------------------------------------------------------------------------------