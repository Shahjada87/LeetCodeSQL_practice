--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1890 The latest login in 2020


create table if not exists 40The2020LatestLogin1890(
    user_id int,
    timeStamp datetime,
    Primary key (user_id, timeStamp)
);


insert into 40The2020LatestLogin1890 values 
(6, '2020-06-30 15:06:07'),
(6, '2021-04-21 14:06:06'),
(6, '2019-03-07 00:18:15'),
(8, '2020-02-01 05:10:53'),
(8, '2020-12-30 00:46:50'),
(2, '2020-01-16 02:49:50'),
(2, '2019-08-25 07:59:08'),
(14, '2019-07-14 09:00:00'),
(14, '2021-01-06 11:59:59');


mysql> select * from 40The2020LatestLogin1890;
+---------+---------------------+
| user_id | timeStamp           |
+---------+---------------------+
|       2 | 2019-08-25 07:59:08 |
|       2 | 2020-01-16 02:49:50 |
|       6 | 2019-03-07 00:18:15 |
|       6 | 2020-06-30 15:06:07 |
|       6 | 2021-04-21 14:06:06 |
|       8 | 2020-02-01 05:10:53 |
|       8 | 2020-12-30 00:46:50 |
|      14 | 2019-07-14 09:00:00 |
|      14 | 2021-01-06 11:59:59 |
+---------+---------------------+
9 rows in set (0.00 sec)


--Write a solution to report the latest login for all users in the year 2020. 
--Do not include the users who did not login in 2020.
--Return the result table in any order.


select user_id, max(timeStamp) as latest_login_date
from 40The2020LatestLogin1890
where YEAR(timeStamp) = 2020
GROUP BY user_id;


Output 


+---------+---------------------+
| user_id | latest_login_date   |
+---------+---------------------+
|       2 | 2020-01-16 02:49:50 |
|       6 | 2020-06-30 15:06:07 |
|       8 | 2020-12-30 00:46:50 |
+---------+---------------------+
3 rows in set (0.01 sec)


--------------------------------------------------------------------------------------------------


use leetcode;

show tables;


Q. 597 Friend Requests I: Overall acceptance rate

create table 50FrndRqstOverallAcceptanceRate597(
    sender_id int,
    send_to_id int,
    request_date date
);

insert into 50FrndRqstOverallAcceptanceRate597 values
(1, 2, '2016-06-01'),
(1, 3, '2016-06-01'),
(1, 4, '2016-06-01'),
(2, 3, '2016-06-02'),
(3, 4, '2016-06-09');


mysql> select * from 50FrndRqstOverallAcceptanceRate597;
+-----------+------------+--------------+
| sender_id | send_to_id | request_date |
+-----------+------------+--------------+
|         1 |          2 | 2016-06-01   |
|         1 |          3 | 2016-06-01   |
|         1 |          4 | 2016-06-01   |
|         2 |          3 | 2016-06-02   |
|         3 |          4 | 2016-06-09   |
+-----------+------------+--------------+
5 rows in set (0.01 sec)



create table if not exists 50_1RequestAccepted597(
    requester_id int,
    accepter_id int,
    accept_date date
);


insert into 50_1RequestAccepted597 values 
(2, 3, '2016-06-08'),
(1, 2, '2016-06-03'),
(1, 3, '2016-06-08'),
(3, 4, '2016-06-09'),
(3, 4, '2016-06-10');

mysql> select * from 50_1RequestAccepted597;
+--------------+-------------+-------------+
| requester_id | accepter_id | accept_date |
+--------------+-------------+-------------+
|            2 |           3 | 2016-06-08  |
|            1 |           2 | 2016-06-03  |
|            1 |           3 | 2016-06-08  |
|            3 |           4 | 2016-06-09  |
|            3 |           4 | 2016-06-10  |
+--------------+-------------+-------------+
5 rows in set (0.01 sec)



--Write an SQL query to find the overall acceptance rate of requests, 
--which is the number of acceptance divided by the number of requests. 
--Return the answer rounded to 2 decimals places. Note that: 
--• The accepted requests are not necessarily from the table friend_request. 
--In this case, Count the total accepted requests (no matter whether they are in the original requests),
-- and divide it by the number of requests to get the acceptance rate. 
--• It is possible that a sender sends multiple requests to the same receiver, 
--and a request could be accepted more than once. 
--In this case, the 'duplicated' requests or acceptances are only counted once. 
--• If there are no requests at all, you should return 0.00 as the accept_rate. 
--The query result format is in the following example.



select ifnull(round(
(select count(*) from
(select distinct requester_id, accepter_id
from 50_1RequestAccepted597)
as total_count) /
(select count(*) from
(select distinct sender_id,send_to_id
from 50FrndRqstOverallAcceptanceRate597)
as total_count2),2),0) as accept_rate


Output


+-------------+
| accept_rate |
+-------------+
|        0.80 |
+-------------+
1 row in set (0.05 sec)




--------------------------------------------------------------------------------------------


Q. 603 Consecutive Available Seats 


create table if not exists 51ConsecutiveAvailableSeats603(
    seat_id int AUTO_INCREMENT Primary Key,
    free BOOLEAN
);


insert into 51ConsecutiveAvailableSeats603(free) values
(1),(0),(1),(1),(1);

mysql> select * from 51ConsecutiveAvailableSeats603;
+---------+------+
| seat_id | free |
+---------+------+
|       1 |    1 |
|       2 |    0 |
|       3 |    1 |
|       4 |    1 |
|       5 |    1 |
+---------+------+



--Write an SQL query to report all the consecutive available seats in the cinema. 
--Return the result table ordered by seat_id in ascending order. 
--The test cases are generated so that more than two seats are consecutively available.



select seat_id
from (select *, lead(free) over(order by seat_id) as next_seat, 
lag(free) over(order by seat_id) as prev_seat 
from 51ConsecutiveAvailableSeats603) as seats
where seats.free = 1 and seats.next_seat = 1
or seats.free = 1 and seats.prev_seat =1
order by seats.seat_id;


output


+---------+
| seat_id |
+---------+
|       3 |
|       4 |
|       5 |
+---------+
3 rows in set (0.01 sec)




------------------------------------------------------------------------------------------------



