
Q. 1148 Article Views I

Create table if not exists 18ArticleViews1148(
    aricle_id int,
    author_id int,
    viewer_id int,
    view_date date
);

insert into `18ArticleViews1148` values 
(1, 3, 5, '2019-08-01'),
(1, 3, 6, '2019-08-02'),
(2, 7, 7, '2019-08-01'),
(2, 7, 6, '2019-08-02'),
(4, 7, 1, '2019-07-22'),
(3, 4, 4, '2019-07-21'),
(3, 4, 4, '2019-07-21');

Select * from `18ArticleViews1148`;

select distinct author_id as id
from 18ArticleViews1148 
where author_id = viewer_id
order by author_id;



Q. 1179 Reformat Department Table

Create table if not exists 19ReformatDepartment1179(
    id int,
    revenue int,
    month varchar(20)
);

Alter table 19ReformatDepartment1179 add primary key (id, month);

insert into `19ReformatDepartment1179` values
(1, 8000, 'Jan'),
(2, 9000, 'Jan'),
(3, 10000, 'Feb'),
(1, 7000, 'Feb'),
(1, 6000, 'Mar');


SELECT id,
       SUM(CASE WHEN month = 'Jan' THEN revenue ELSE NULL END) AS Jan_Revenue,
       SUM(CASE WHEN month = 'Feb' THEN revenue ELSE NULL END) AS Feb_Revenue,
       SUM(CASE WHEN month = 'Mar' THEN revenue ELSE NULL END) AS Mar_Revenue,
       SUM(CASE WHEN month = 'Apr' THEN revenue ELSE NULL END) AS Apr_Revenue,
       SUM(CASE WHEN month = 'May' THEN revenue ELSE NULL END) AS May_Revenue,
       SUM(CASE WHEN month = 'Jun' THEN revenue ELSE NULL END) AS Jun_Revenue,
       SUM(CASE WHEN month = 'Jul' THEN revenue ELSE NULL END) AS Jul_Revenue,
       SUM(CASE WHEN month = 'Aug' THEN revenue ELSE NULL END) AS Aug_Revenue,
       SUM(CASE WHEN month = 'Sep' THEN revenue ELSE NULL END) AS Sep_Revenue,
       SUM(CASE WHEN month = 'Oct' THEN revenue ELSE NULL END) AS Oct_Revenue,
       SUM(CASE WHEN month = 'Nov' THEN revenue ELSE NULL END) AS Nov_Revenue,
       SUM(CASE WHEN month = 'Dec' THEN revenue ELSE NULL END) AS Dec_Revenue
FROM 19ReformatDepartment1179
GROUP BY id;
