--Praactice one random question from already solved -- LeetCode problems

create database PracticeRandomSolvedLeetCodeProbs;

Use PracticeRandomSolvedLeetCodeProbs;

Q.1141 User Activity for the Past 30 Days I

create table if not exists 1Activity1141(
    user_id int,
    session_id int,
    activity_date date,
    activity_type enum('open_session', 'end_session', 'scroll_down', 'send_message')
);

insert into 1Activity1141 VALUES
(1, 1, '2019-07-20', 'open_session'),
(1, 1, '2019-07-20', 'scroll_down'),
(1, 1, '2019-07-20', 'end_session'),
(2, 4, '2019-07-20', 'open_session'),
(2, 4, '2019-07-21', 'send_message'),
(2, 4, '2019-07-21', 'end_session'),
(3, 2, '2019-07-21', 'open_session'),
(3, 2, '2019-07-21', 'send_message'),
(3, 2, '2019-07-21', 'end_session'),
(4, 3, '2019-06-25', 'open_session'),
(4, 3, '2019-06-25', 'end_session');

select * from 1activity1141;

-- Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. 
-- A user was active on someday if they made at least one activity on that day.

Select activity_date as day, count(DISTINCT user_id)
From 1activity1141
where activity_date BETWEEN DATE_ADD('2019-07-27', Interval -29 DAY) AND '2019-07-27'
group by activity_date;

------------------
