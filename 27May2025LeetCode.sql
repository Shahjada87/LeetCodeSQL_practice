Q.1211 Questies Quality and Percentage

Create table 20QuestiesQuality1211 (
    query_name varchar(20),
    result varchar(20),
    position int,
    rating int  
);

insert into `20QuestiesQuality1211` VALUES
('Dog', 'Golden Retriever', 1, 5),
('Dog', 'German Shepherd', 2, 5),
('Dog', 'Mule', 200, 1),
('Cat', 'Shirazi', 5, 2),
('Cat', 'Siamese', 3, 3),
('Cat', 'Sphynx', 7, 4);


Select query_name,
        round (avg(rating / position),2) as quality,
        ROUND(sum(case when rating < 3 then 1 else 0 end) * 100 / count(*),2) as poor_query_percentage
From `20QuestiesQuality1211`
group by query_name;


Q.1251 Average Selling Price

Create table if not exists 21AverageSellingPrice1251 (
    product_id int,
    start_date date,
    end_date date,
    prcie int,
    Primary Key (product_id, start_date, end_date)
);

Create Table if not exists 21_1UnitsSold1251 (
    product_id int,
    purchase_date date,
    units int
);

insert into  21AverageSellingPrice1251 values
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30)
;

Insert into 21_1UnitsSold1251 values
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);

Select * from 21AverageSellingPrice1251;

Select * from 21_1UnitsSold1251;



SELECT a.product_id, IFNULL(round(SUM(a.prcie*b.units)/sum(b.units),2),0) as average_price
From `21AverageSellingPrice1251` a
Left Join 21_1UnitsSold1251 b
on a.product_id = b.product_id
AND b.purchase_date BETWEEN a.start_date AND a.end_date
group by a.product_id;