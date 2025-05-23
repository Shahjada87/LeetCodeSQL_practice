Q.619 Biggest Single Number 

Create table if not exists 10BiggestSingleNumber (
    num int
);

INSERT INTO 10BiggestSingleNumber (num) VALUES
(8),
(8),
(3),
(3),
(1),
(4),
(5),
(6);

rename TABLE 10BiggestSingleNumber TO 10BiggestSingleNumber619;

select * from 10BiggestSingleNumber619;

WITH Cte as
(SELECT num
From 10BiggestSingleNumber619 
Group by num  
Having count(num) = 1)

Select case when count(*) > 0 then MAX(num)
else NULL
end as num
From Cte;
