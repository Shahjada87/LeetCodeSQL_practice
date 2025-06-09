Leetcode Problems

Q196. Duplicate Emails 
 
Create Table if not exits Duplicate_emails196
    -> (
    -> id int Primary Key,
    -> email varchar(200)
    -> );
Insert into Duplicate_emails196 values (4, “shahjada8007@gmail.com”); 

Delete d1.*
From 
Duplicate_emails196 d1
Join Duplicate_emails196 d2
On d1.email = d2.email
Where d1.id > d2.id;

Q197. If temperature more than yesterday

Select w1.id
From
Weather197 w1
Join Weather197 w2
On w1.recordDate = Date_Add( w2.recordDate, interval 1 day)
And w1.temperature > w2.temperature;

Q511. Game play analysis 1

Insert into activity511_1 values ( 1, 2 , '2016-03-01' , 5 ), ( 1 , 2 , '2016-05-02' , 6 ),  ( 2 , 3 , '2017-06-25' , 1 ),  ( 3 , 1 , '2016-03-02' , 0 ),   ( 3 , 4 , '2018-07-03' , 5 );

Select Player_id, MIN(event_date) as first_login
From
activity511_1
Group by Player_id;

Q.577 Employee Bonus - 2tables 

insert into 4Emploee_Bonus577 values (3, "brad", null, 4000),(1, "John", 3,1000),(2, "Dan", 3, 2000),(4, "Thomas", 3, 4000);

insert into 4_1Bonus577 values (2,500), (4,200);

SELECT
e1.name, e2.bonus 
From 4Emploee_Bonus577 e1
Left Join 4_1Bonus577 e2
On e1.empId = e2.empId
Where e2.bonus < 1000 
OR e2.bonus IS NULL;

Q.584 Find customer not referred by RefereeID 2

 select name from 5Customer584 where refereeId != 2 OR refereeID Is Null;

Q.586 Customer who placed largest no of orders


With cte as 
(Select customer_no, count(order_no) as MaxOrder
From 6Customer_largest_order586
Group by customer_no)

Select customer_no 
From cte
Where MaxOrder =(Select Max(maxorder) From Cte);

Q596. Class More than 5 Students 

Select Class
From 7Class_More_Than_5Students596
Group by class
Having count(*) >= 5;

Q607. Sales Person

Create table 8SalesPerson607
    -> (
    -> sales_id int,
    -> name varchar(20),
    -> salary int,
    -> commission_rate int,
    -> hire_date date 
    -> );

Insert into 8SalesPerson607 values 
(1, 'John', 100000, 6, '2006-04-01'),
(2, 'Amy', 12000, 5, '2010-05-01'),
(3, 'Mark', 65000, 12, '2008-12-25'),
(4, 'Pam', 25000, 25, '2005-01-01'),
(5, 'Alex', 5000, 10, '2007-02-03');
CREATE TABLE 8_1Company607 (
    com_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

INSERT INTO 8_1Company607 (com_id, name, city) VALUES
(1, 'RED', 'Boston'),
(2, 'ORANGE', 'New York'),
(3, 'YELLOW', 'Boston'),
(4, 'GREEN', 'Austin');

CREATE TABLE 8_2Orders607 (
    order_id INT PRIMARY KEY,
    order_date DATE,
    com_id INT,
    sales_id INT,
    amount INT,
    FOREIGN KEY (com_id) REFERENCES 8_1Company607(com_id),
    FOREIGN KEY (sales_id) REFERENCES 8SalesPerson607(sales_id)
);

INSERT INTO 8_2Orders607 (order_id, order_date, com_id, sales_id, amount) VALUES
(1, '2014-01-01', 3, 4, 10000),
(2, '2014-02-01', 4, 5, 5000),
(3, '2014-03-01', 1, 1, 50000),
(4, '2014-04-01', 1, 4, 25000);

With cte as 
(Select 
Sales_id 
From 8_2Orders607 c
Left join 8_1Company607 b
On c.com_id = b.com_id
Where name LIKE RED)

Select name 
From 8SalesPerson607
Where Sales_id not in ( Select sales_id from cte)

Q610. Triangle Judgement

Create table if not exists 9TriangleJudgment610
(
X int primary key,
Y int,
Z int
);

Insert into 9TriangleJudgment610 values (13,15,30),(10,20,15);

Select *, case when x+y>z AND y+z>x AND x+z > y then ‘Yes’ else ‘No’ end as Triangle
From 9TriangleJudgment610;



