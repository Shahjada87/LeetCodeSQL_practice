Q.1068 Product Sales Analysis I

Create table if not exists 14_1Product_1068 
    -> (
    -> product_id int Primary key,
    -> product_name varchar(200)
    -> );

create table if not exists 14ProductSalesAnalysis1_1068
    (
        sales_id int,
        product_id int,
        year int,
        quantity int,
        price int,
        Primary Key (sales_id, year),
        Foreign Key (product_id) REFERENCES 14_1Product_1068 (product_id)
    );

INSERT INTO 14_1Product_1068 (product_id, product_name) VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');

INSERT INTO 14ProductSalesAnalysis1_1068 (sales_id, product_id, year, quantity, price) VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);

Select p.product_name, s.year, s.price
From 14ProductSalesAnalysis1_1068 s
Left Join 14_1Product_1068 p
on s.product_id = p.product_id;

+--------------+------+-------+
| product_name | year | price |
+--------------+------+-------+
| Nokia        | 2008 |  5000 |
| Nokia        | 2009 |  5000 |
| Apple        | 2011 |  9000 |
+--------------+------+-------+


Q.1075 Project Employees I

Create table if not exists 15_1Project_1075 (
    project_id int,
    employee_id int,
    PRIMARY KEY (project_id, employee_id)
);

Create table if not exists 15ProjectEmployeesI_1075 (
    employee_id int PRIMARY KEY,
    name varchar(100),
    experience_years int
);

insert into 15_1Project_1075 VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4);

Insert into 15ProjectEmployeesI_1075 VALUES
(1, 'Khalid', 3),
(2, 'Ali', 2),
(3, 'John', 1),
(4, 'Doe', 2);

Select * from 15_1Project_1075;

Select * from 15ProjectEmployeesI_1075;

Select p1.project_id, ROUND(avg(p2.experience_years),2) as avgerage_years
From 15_1Project_1075 p1
Left Join 15ProjectEmployeesI_1075 p2
on p1.employee_id = p2.employee_id
group by p1.project_id;

+------------+----------------+
| project_id | avgerage_years |
+------------+----------------+
|          1 |           2.00 |
|          2 |           2.50 |
+------------+----------------+

Q.1084 Sales Analysis I

CREATE TABLE 16Product1084 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    unit_price INT
);

CREATE TABLE 16_1Sales1084 (
    seller_id INT,
    product_id INT,
    buyer_id INT,
    sale_date DATE,
    quantity INT,
    price INT,
    FOREIGN KEY (product_id) REFERENCES 16Product1084 (product_id)
);

INSERT INTO 16Product1084 (product_id, product_name, unit_price) VALUES
(1, 'iPhone', 999),
(2, 'Galaxy', 799),
(3, 'Pixel', 699);

INSERT INTO 16_1Sales1084 (seller_id, product_id, buyer_id, sale_date, quantity, price) VALUES
(101, 1, 201, '2019-01-21', 1, 999),
(102, 2, 202, '2019-02-17', 2, 1598),
(103, 3, 203, '2019-06-02', 1, 699),
(101, 1, 204, '2019-05-13', 1, 999);


Select * from 16_1Sales1084;

Select * from 16Product1084;

Select p.product_id, p.product_name
From 16Product1084 P
left Join 16_1Sales1084 s
on p.product_id = s.product_id 
group by p.product_id
Having Min(s.sale_date) >= '2019-01-01' AND Max(s.sale_date) <= '2019-03-31';

+------------+--------------+
| product_id | product_name |
+------------+--------------+
|          2 | Galaxy       |
+------------+--------------+


Q. 1141 User Activity for the Past 30 Days

CREATE TABLE 17UserActivity30Days1141 (
    user_id INT,
    session_id int,
    activity_date date,
    activity_type enum ('open_session', 'end_session', 'scroll_down', 'send_message')
);

INSERT INTO 17UserActivity30Days1141 values
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


SELECT 
    activity_date AS day, 
    COUNT(DISTINCT user_id) AS active_users
FROM 17UserActivity30Days1141
WHERE 
    DATEDIFF('2019-07-27', activity_date) < 30 
    AND DATEDIFF('2019-07-27', activity_date)>=0
GROUP BY 1

