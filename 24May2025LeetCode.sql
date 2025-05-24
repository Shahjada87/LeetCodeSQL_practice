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