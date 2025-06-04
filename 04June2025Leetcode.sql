Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q.1141 User activity from past 30days I

create table if not exists 7UserActivityPast30DaysI1141(
    user_id int,
    session_id int,
    activity_date date,
    activity_type enum('open_session', 'end_session', 'scroll_down', 'send_message')
);


insert into 7UserActivityPast30DaysI1141 values 
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


mysql> select * from 7UserActivityPast30DaysI1141;
+---------+------------+---------------+---------------+
| user_id | session_id | activity_date | activity_type |
+---------+------------+---------------+---------------+
|       1 |          1 | 2019-07-20    | open_session  |
|       1 |          1 | 2019-07-20    | scroll_down   |
|       1 |          1 | 2019-07-20    | end_session   |
|       2 |          4 | 2019-07-20    | open_session  |
|       2 |          4 | 2019-07-21    | send_message  |
|       2 |          4 | 2019-07-21    | end_session   |
|       3 |          2 | 2019-07-21    | open_session  |
|       3 |          2 | 2019-07-21    | send_message  |
|       3 |          2 | 2019-07-21    | end_session   |
|       4 |          3 | 2019-06-25    | open_session  |
|       4 |          3 | 2019-06-25    | end_session   |
+---------+------------+---------------+---------------+


--Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. 
--A user was active on someday if they made at least one activity on that day.
--Return the result table in any order.

Select activity_date, count(DISTINCT user_id)  as active_users 
from 7UserActivityPast30DaysI1141
where activity_date BETWEEN DATE_ADD('2019-07-27', interval -29 day) AND '2019-07-27'
group by activity_date;

Output

+---------------+--------------+
| activity_date | active_users |
+---------------+--------------+
| 2019-07-20    |            2 |
| 2019-07-21    |            2 |
+---------------+--------------+
2 rows in set (0.10 sec)


--------------------------------------------------------------------------

show tables;

Q. 1741 Find total time spent by each employee


create table if not exists 36TimeSpentByEmployee1741(
    emp_id int,
    event_day date,
    in_time int,
    out_time int,
    Primary key (emp_id, event_day, in_time)
);

insert into 36TimeSpentByEmployee1741 values
(1, '2020-11-28', 4, 32),
(1, '2020-11-28', 55, 200),
(1, '2020-12-03', 1, 42),
(2, '2020-11-28', 3, 33),
(2, '2020-12-09', 47, 74);


mysql> select * from 36TimeSpentByEmployee1741;
+--------+------------+---------+----------+
| emp_id | event_day  | in_time | out_time |
+--------+------------+---------+----------+
|      1 | 2020-11-28 |       4 |       32 |
|      1 | 2020-11-28 |      55 |      200 |
|      1 | 2020-12-03 |       1 |       42 |
|      2 | 2020-11-28 |       3 |       33 |
|      2 | 2020-12-09 |      47 |       74 |
+--------+------------+---------+----------+


--Write a solution to calculate the total time in minutes spent by each employee on each day at the office. 
--Note that within one day, an employee can enter and leave more than once.
--The time spent in the office for a single entry is out_time - in_time.
--Return the result table in any order.


select event_day as day, emp_id, sum(out_time - in_time) as total_time
From 36TimeSpentByEmployee1741
group by event_day, emp_id;

Output

+------------+--------+------------+
| day        | emp_id | total_time |
+------------+--------+------------+
| 2020-11-28 |      1 |        173 |
| 2020-12-03 |      1 |         41 |
| 2020-11-28 |      2 |         30 |
| 2020-12-09 |      2 |         27 |
+------------+--------+------------+

--------------------------------------------------------------------------


Q. 1757 Recyclable and low fat products

Create table if not exists 37RecyclableLowFatProduct1757(
    product_id int primary key,
    low_fats enum('Y', 'N'),
    recyclable enum('Y', 'N')
);

insert into 37RecyclableLowFatProduct1757 values 
(0, 'Y', 'N'),
(1, 'Y', 'Y'),
(2, 'N', 'Y'),
(3, 'Y', 'Y'),
(4, 'N', 'N');


mysql> select * from 37RecyclableLowFatProduct1757;
+------------+----------+------------+
| product_id | low_fats | recyclable |
+------------+----------+------------+
|          0 | Y        | N          |
|          1 | Y        | Y          |
|          2 | N        | Y          |
|          3 | Y        | Y          |
|          4 | N        | N          |
+------------+----------+------------+


--Write a solution to find the ids of products that are both low fat and recyclable.
--Return the result table in any order.


select product_id
from 37RecyclableLowFatProduct1757
where low_fats = 'Y' AND 
recyclable = 'Y'


+------------+
| product_id |
+------------+
|          1 |
|          3 |
+------------+


--------------------------------------------------------------------------



