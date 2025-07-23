show tables;



Q. 613 Shortest distance in a line 


Create table if not exists 52ShortestDistanceInALine613(
    x int primary key
);



insert into 52ShortestDistanceInALine613 values
(-1),
(0),
(2);


--Write an sql query to report the shortest distance between any two points on the X axis.

select min(abs(a.x-b.x)) as shortest
from 52ShortestDistanceInALine613 a
cross join 52ShortestDistanceInALine613 b
where a.x < b.x



Output


+----------+
| shortest |
+----------+
|        1 |
+----------+
1 row in set (0.00 sec)
