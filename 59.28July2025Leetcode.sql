--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 2356 Number of Unique Subjects Taught by Each Teacher


create table if not exists 50NoOfUniqueSubsTaughtByEachTeacher2356(
    teacher_id int,
    subj_id int,
    dept_id int,
    Primary Key (subj_id, dept_id)
);


insert into 50NoOfUniqueSubsTaughtByEachTeacher2356 values
(1, 2, 3),
(1, 2, 4),
(1, 3, 3),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(2, 4, 1);


mysql> select * from 50NoOfUniqueSubsTaughtByEachTeacher2356;
+------------+---------+---------+
| teacher_id | subj_id | dept_id |
+------------+---------+---------+
|          2 |       1 |       1 |
|          2 |       2 |       1 |
|          1 |       2 |       3 |
|          1 |       2 |       4 |
|          2 |       3 |       1 |
|          1 |       3 |       3 |
|          2 |       4 |       1 |
+------------+---------+---------+
7 rows in set (0.00 sec)




select teacher_id, count(distinct subj_id) as total_sub_by_each_teacher
from 50NoOfUniqueSubsTaughtByEachTeacher2356
group by teacher_id;


Output 


+------------+-------------------------+
| teacher_id | count(distinct subj_id) |
+------------+-------------------------+
|          1 |                       2 |
|          2 |                       4 |
+------------+-------------------------+
2 rows in set (0.01 sec)