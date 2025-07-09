--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1280 Students and Examinations


create table if not exists 32StudentsAndExaminations1280(
    student_id int primary key,
    student_name varchar(50)
);

insert into 32StudentsAndExaminations1280 values 
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');


mysql> select * from 32StudentsAndExaminations1280;
+------------+--------------+
| student_id | student_name |
+------------+--------------+
|          1 | Alice        |
|          2 | Bob          |
|          6 | Alex         |
|         13 | John         |
+------------+--------------+
4 rows in set (0.00 sec)


create table if not exists 32_1Subjects1280(
    subject_name varchar(50) primary key
);


insert into 32_1Subjects1280 values 
('Math'),
('Physics'),
('Programming');

mysql> select * from 32_1Subjects1280;
+--------------+
| subject_name |
+--------------+
| Math         |
| Physics      |
| Programming  |
+--------------+
3 rows in set (0.01 sec)


create table if not exists 32_2Examinations1280(
    subject_id int,
    subject_name varchar(50)
);

alter table 32_2Examinations1280 
rename column subject_id to student_id ;

insert into 32_2Examinations1280 values 
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');


mysql> select * from 32_2Examinations1280;
+------------+--------------+
| student_id | subject_name |
+------------+--------------+
|          1 | Math         |
|          1 | Physics      |
|          1 | Programming  |
|          2 | Programming  |
|          1 | Physics      |
|          1 | Math         |
|         13 | Math         |
|         13 | Programming  |
|         13 | Physics      |
|          2 | Math         |
|          1 | Math         |
+------------+--------------+
11 rows in set (0.00 sec)



--Write a solution to find the number of times each student attended each exam.
--Return the result table ordered by student_id and subject_name.


With cte1 as (
select *
from 32StudentsAndExaminations1280
cross join 32_1Subjects1280),
cte2 as 
(Select student_id, subject_name, count(subject_name) as count
from 32_2Examinations1280 
group by student_id, subject_name)
Select a.*, 
case when count is not null then count else 0
end as attended_exams
from cte1 a
left join cte2 b
on a.student_id = b.student_id
AND a.subject_name = b.subject_name
order by a.student_id, a.student_name;


Output

+------------+--------------+--------------+----------------+
| student_id | student_name | subject_name | attended_exams |
+------------+--------------+--------------+----------------+
|          1 | Alice        | Programming  |              1 |
|          1 | Alice        | Physics      |              2 |
|          1 | Alice        | Math         |              3 |
|          2 | Bob          | Programming  |              1 |
|          2 | Bob          | Physics      |              0 |
|          2 | Bob          | Math         |              1 |
|          6 | Alex         | Programming  |              0 |
|          6 | Alex         | Physics      |              0 |
|          6 | Alex         | Math         |              0 |
|         13 | John         | Programming  |              1 |
|         13 | John         | Physics      |              1 |
|         13 | John         | Math         |              1 |
+------------+--------------+--------------+----------------+
12 rows in set (0.07 sec)

