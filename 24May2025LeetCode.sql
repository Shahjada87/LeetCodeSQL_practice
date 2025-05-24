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