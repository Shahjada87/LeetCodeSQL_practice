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


--------------------------------------------------------------------------

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

--------------------------------------------------------------------------

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

--------------------------------------------------------------------------

Q.1407 Top travellers

create table if not exists 25TopTravellers1407
(
    id int Primary key,
    name varchar(30)
);

insert into 25TopTravellers1407 VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Alex'),
(4, 'Donald'),
(7, 'Lee'),
(13, 'Jonathan'),
(19, 'Elvis');

create table if not exists 25_1Rides1407
(
    id int primary key,
    user_id int,
    distance int
);

insert into 25_1Rides1407 values
(1, 1, 120),
(2, 2, 317),
(3, 3, 222),
(4, 7, 100),
(5, 13, 312),
(6, 19, 50),
(7, 7, 120),
(8, 19, 400),
(9, 7, 230);


Select * from 25TopTravellers1407;

Select * from 25_1Rides1407;

-- Write a solution to report the distance traveled by each user.
-- Return the result table ordered by travelled_distance in descending order, 
-- if two or more users traveled the same distance, order them by their name in ascending order.

Select a.name, coalesce(sum(b.distance), 0) as travelled_distance
From 25TopTravellers1407 a
left join 25_1Rides1407 b 
on a.id = b.user_id
group by a.id
order by travelled_distance DESC, a.name ASC;

Output

+----------+--------------------+
| name     | travelled_distance |
+----------+--------------------+
| Elvis    |                450 |
| Lee      |                450 |
| Bob      |                317 |
| Jonathan |                312 |
| Alex     |                222 |
| Alice    |                120 |
| Donald   |                  0 |
+----------+--------------------+

--------------------------------------------------------------------------

Q.1484 Group sold products by the date

Create table if not exists 26GroupSoldProductsByDate1484
(
    sell_date date,
    product varchar(30)
);

insert into 26GroupSoldProductsByDate1484 values
('2020-05-30', 'Headphone'),
('2020-06-01', 'Pencil'),
('2020-06-02', 'Mask'),
('2020-05-30', 'Basketball'),
('2020-06-01', 'Bible'),
('2020-06-02', 'Mask'),
('2020-05-30', 'T-Shirt');

Select * from 26GroupSoldProductsByDate1484;

-- Write a solution to find for each date the number of different products sold and their names.

-- The sold products names for each date should be sorted lexicographically.

-- Return the result table ordered by sell_date.


Select sell_date, count(DISTINCT product) as num_sold, 
group_concat(DISTINCT product ORDER BY product ASC) as products
From 26GroupSoldProductsByDate1484
Group by sell_date
Order by sell_date;

Output

+------------+----------+------------------------------+
| sell_date  | num_sold | products                     |
+------------+----------+------------------------------+
| 2020-05-30 |        3 | Basketball,Headphone,T-Shirt |
| 2020-06-01 |        2 | Bible,Pencil                 |
| 2020-06-02 |        1 | Mask                         |
+------------+----------+------------------------------+

--------------------------------------------------------------------------

Q.1517 Find users with valid e-email

Create table if not exists 27FindUsersWithVlaidEMail1517
(
    user_id int primary key,
    name varchar(100),
    email varchar(100)
);

insert into 27FindUsersWithVlaidEMail1517 values
(1, 'Winston', 'winston@leetcode.com'),
(2, 'Jonathan', 'jonathanisgreat'),
(3, 'Annabelle', 'bella-@leetcode.com'),
(4, 'Sally', 'sally.come@leetcode.com'),
(5, 'Marwan', 'quarz#2020@leetcode.com'),
(6, 'David', 'david69@gmail.com'),
(7, 'Shapiro', '.shapo@leetcode.com');

Select * from 27FindUsersWithVlaidEMail1517;

--Write a solution to find the users who have valid emails.

-- A valid e-mail has a prefix name and a domain where:

-- The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'. The prefix name must start with a letter.
--The domain is '@leetcode.com'.
-- Return the result table in any order.


Select * 
from 27FindUsersWithVlaidEMail1517
where email REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com';


+---------+-----------+-------------------------+
| user_id | name      | email                   |
+---------+-----------+-------------------------+
|       1 | Winston   | winston@leetcode.com    |
|       3 | Annabelle | bella-@leetcode.com     |
|       4 | Sally     | sally.come@leetcode.com |
+---------+-----------+-------------------------+




















