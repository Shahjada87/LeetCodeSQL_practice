Q.1280 Students and Examinations

Create table if not exists 22StudentsandExaminations1280(
    student_id int primary key,
    student_name varchar(20)
);

create table if not exists 22_1Subjects1280(
    subject_name varchar(20) primary key
);

create table if not exists 22_2Examinations1280(
    student_id int,
    subject_name varchar(20)
);

insert into `22StudentsandExaminations1280` VALUES(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');

insert into `22_1Subjects1280` values 
('Math'),
('Physics'),
('Programming');

insert into `22_2Examinations1280` values
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

Select * from `22StudentsandExaminations1280`;
select * from `22_1Subjects1280`;

select * from `22_2Examinations1280`;


--Write a solution to find the number of times each student attended each exam.

--Return the result table ordered by student_id and subject_name.

--The result format is in the following example.

With cte1 as
(Select * 
FROM `22StudentsandExaminations1280`
Cross join `22_1Subjects1280`),
cte2 as 
(
    Select student_id, subject_name, count(subject_name) as COUNT
    from `22_2Examinations1280`
    group by student_id, subject_name
)
Select cte1.*, 
case when count is not null then count else 0
end as attended_exams
From cte1 
left join cte2
on cte1.student_id = cte2.student_id 
AND cte1.subject_name = cte2.subject_name
order by cte1.student_id, cte1.subject_name;