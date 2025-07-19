--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 603 Consecutive Available Seats 


create table if not exists 42ConsecutiveAvailableSeats603(
    seat_id int AUTO_INCREMENT Primary Key,
    free BOOLEAN
);


insert into 42ConsecutiveAvailableSeats603(free) values
(1),(0),(1),(1),(1);

mysql> select * from 42ConsecutiveAvailableSeats603;
+---------+------+
| seat_id | free |
+---------+------+
|       1 |    1 |
|       2 |    0 |
|       3 |    1 |
|       4 |    1 |
|       5 |    1 |
+---------+------+
5 rows in set (0.01 sec)


--Write an SQL query to report all the consecutive available seats in the cinema. 
--Return the result table ordered by seat_id in ascending order. 
--The test cases are generated so that more than two seats are consecutively available.


select seat_id
from (select *, lead(free) over(order by seat_id) as next_seat, 
lag(free) over(order by seat_id) as prev_seat 
from 42ConsecutiveAvailableSeats603) as seats
where seats.free = 1 and seats.next_seat = 1
or seats.free = 1 and seats.prev_seat =1
order by seats.seat_id;


Output

+---------+
| seat_id |
+---------+
|       3 |
|       4 |
|       5 |
+---------+
3 rows in set (0.01 sec)