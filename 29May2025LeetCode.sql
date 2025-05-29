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


Output

| day        | active_users |
| ---------- | ------------ |
| 2019-07-20 | 2            |
| 2019-07-21 | 2            |


------------------

use leetcode;

show tables;


Q.1327 List the Products Ordered in a Period

create table if not exists 23ProductsOrderedInAPeriod1327(
    product_id int Primary Key,
    product_name varchar(20),
    product_category varchar(20)
);

alter table 23ProductsOrderedInAPeriod1327 modify column product_name varchar(200);

insert into 23ProductsOrderedInAPeriod1327 VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt');

Select * from 23ProductsOrderedInAPeriod1327;

Create table if not exists 23_1Orders1327(
    product_id int,
    order_date date,
    unit int,
    Foreign Key (product_id) REFERENCES 23ProductsOrderedInAPeriod1327(product_id)
);

Insert into 23_1Orders1327 values 
(1, '2020-02-05', 60),
(1, '2020-02-10', 70),
(2, '2020-01-18', 30),
(2, '2020-02-11', 80),
(3, '2020-02-17', 2),
(3, '2020-02-24', 3),
(4, '2020-03-01', 20),
(4, '2020-03-04', 30),
(4, '2020-03-04', 60),
(5, '2020-02-25', 50),
(5, '2020-02-27', 50),
(5, '2020-03-01', 50);

Select * from 23_1Orders1327;

-- Write a solution to get the names of products that have at 
-- least 100 units ordered in February 2020 and their amount.

With cte as 
(Select product_id, sum(unit) as units
From 23_1Orders1327 
where YEAR(order_date) = 2020
AND MONTH(order_date) = 2
GROUP BY product_id)
Select b.product_name, Sum(units) as unit
From cte a
inner join 23ProductsOrderedInAPeriod1327 b
on a.product_id = b.product_id
where a.units >= 100
group by b.product_name;


Output

| product_name       | unit |
| ------------------ | ---- |
| Leetcode Solutions | 130  |
| Leetcode Kit       | 100  |

Q. 1378 Replace Employee ID With The Unique Identifier

create table if  not exists 24ReplaceEmployeeID1378
(
    id int Primary key,
    name varchar(20)
);

insert into 24ReplaceEmployeeID1378 VALUES
(1, 'Alice'),
(7, 'Bob'),
(11, 'Meir'),
(90, 'Winston'),
(3, 'Jonathan');

create table if not exists 24_1EmployeeUNI1378
(
    id int,
    unique_id int,
    Primary key(id, unique_id)
);

insert into 24_1EmployeeUNI1378 values
(3, 1),
(11, 2),
(90, 3);

Select * from 24ReplaceEmployeeID1378;

Select * from 24_1EmployeeUNI1378;

-- Write a solution to show the unique ID of each user, 
-- If a user does not have a unique ID replace just show null.

Select b.unique_id, name
From 24ReplaceEmployeeID1378 a
left join 24_1EmployeeUNI1378 b
on a.id = b.id;

Output

+-----------+----------+
| unique_id | name     |
+-----------+----------+
|      NULL | Alice    |
|         1 | Jonathan |
|      NULL | Bob      |
|         2 | Meir     |
|         3 | Winston  |
+-----------+----------+
