

use leetcode;

show tables;



Q. 2356 Number of Unique Subjects Taught by Each Teacher

create table if not exists 43UniqueSubsTaughtByTeacher2356(
    teacher_id int,
    subject_id int,
    dept_id int,
    Primary Key (subject_id, dept_id)
);

insert into 43UniqueSubsTaughtByTeacher2356 values 
(1, 2, 3),
(1, 2, 4),
(1, 3, 3),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(2, 4, 1);


mysql> Select * from 43UniqueSubsTaughtByTeacher2356;
+------------+------------+---------+
| teacher_id | subject_id | dept_id |
+------------+------------+---------+
|          2 |          1 |       1 |
|          2 |          2 |       1 |
|          1 |          2 |       3 |
|          1 |          2 |       4 |
|          2 |          3 |       1 |
|          1 |          3 |       3 |
|          2 |          4 |       1 |
+------------+------------+---------+


--Write a solution to calculate the number of unique subjects each teacher teaches in the university.
--Return the result table in any order.

SELECT teacher_id, count(DISTINCT subject_id) as cnt
from 43UniqueSubsTaughtByTeacher2356
group by teacher_id