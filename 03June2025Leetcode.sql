--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1280 Students and Examinations

create table if not exists 6StudentsandExaminations1280(
    students_id int primary key,
    student_name varchar(50)
);

insert into 6StudentsandExaminations1280 values
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');

mysql> select * from 6StudentsandExaminations1280;
+-------------+--------------+
| students_id | student_name |
+-------------+--------------+
|           1 | Alice        |
|           2 | Bob          |
|           6 | Alex         |
|          13 | John         |
+-------------+--------------+

create table if not exists 6_1Subjects1280(
    subject_name varchar(50) primary key
);

insert into 6_1Subjects1280 values 
('Math'),
('Physics'),
('Programming');

mysql> select * from 6_1Subjects1280;
+--------------+
| subject_name |
+--------------+
| Math         |
| Physics      |
| Programming  |
+--------------+

create table if not exists 6_2Examinations1280(
    student_id int,
    subject_name varchar(50)
);

insert into 6_2Examinations1280 values 
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

mysql> select * from 6_2Examinations1280;
+------------+--------------+
| student_id | subject_name |
+------------+--------------+
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



--Write a solution to find the number of times each student attended each exam.
--Return the result table ordered by student_id and subject_name.
--The result format is in the following example.

With cte as
(Select *
From 6StudentsandExaminations1280
cross join 6_1Subjects1280),
cte2 as 
(
Select student_id, subject_name, count(subject_name) as count
From 6_2Examinations1280
group by student_id, subject_name
)
Select a.*,
case when count is not null then count else 0 end as attended_exams
from 
cte a
left join cte2 b
on a.students_id = b.student_id
And a.subject_name = b.subject_name
order by a.students_id, a.subject_name;


Output

+-------------+--------------+--------------+----------------+
| students_id | student_name | subject_name | attended_exams |
+-------------+--------------+--------------+----------------+
|           1 | Alice        | Math         |              2 |
|           1 | Alice        | Physics      |              2 |
|           1 | Alice        | Programming  |              1 |
|           2 | Bob          | Math         |              1 |
|           2 | Bob          | Physics      |              0 |
|           2 | Bob          | Programming  |              1 |
|           6 | Alex         | Math         |              0 |
|           6 | Alex         | Physics      |              0 |
|           6 | Alex         | Programming  |              0 |
|          13 | John         | Math         |              1 |
|          13 | John         | Physics      |              1 |
|          13 | John         | Programming  |              1 |
+-------------+--------------+--------------+----------------+

--------------------------------------------------------------------------

use leetcode;

show tables;

Q. 1729 Find Followers Count

create table if not exists 34FindFollowersCount1729(
    user_id int,
    follower_id int,
    primary key (user_id, follower_id)
);

insert into 34FindFollowersCount1729 values
(0,1),
(1,0),
(2,0),
(2,1);

mysql> select * from 34FindFollowersCount1729;
+---------+-------------+
| user_id | follower_id |
+---------+-------------+
|       0 |           1 |
|       1 |           0 |
|       2 |           0 |
|       2 |           1 |
+---------+-------------+


--Write a solution that will, for each user, return the number of followers.
--Return the result table ordered by user_id in ascending order.

Select Distinct user_id, count(follower_id) as followers
From 34FindFollowersCount1729
group by user_id
order by user_id; 

Output

+---------+-----------+
| user_id | followers |
+---------+-----------+
|       0 |         1 |
|       1 |         1 |
|       2 |         2 |
+---------+-----------+


--------------------------------------------------------------------------



