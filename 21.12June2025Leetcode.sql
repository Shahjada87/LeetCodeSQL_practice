show tables;

Q. 3570 Find books with no available copies

create table if not exists 46FindBooksWithNoAvailableCopies3570(
    book_id int primary key,
    tital varchar(50),
    author varchar(50),
    genre varchar(50),
    publication_year int,
    total_copies int 
);

insert into 46FindBooksWithNoAvailableCopies3570 values 
(1, 'The Great Gatsby', 'F. Scott', 'Fiction', 1925, 3),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 3),
(3, '1984', 'George Orwell', 'Dystopian', 1949, 1),
(4, 'Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 2),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951, 1),
(6, 'Brave New World', 'Aldous Huxley', 'Dystopian', 1932, 4);


mysql> select * from 46FindBooksWithNoAvailableCopies3570;
+---------+------------------------+---------------+-----------+------------------+--------------+
| book_id | tital                  | author        | genre     | publication_year | total_copies |
+---------+------------------------+---------------+-----------+------------------+--------------+
|       1 | The Great Gatsby       | F. Scott      | Fiction   |             1925 |            3 |
|       2 | To Kill a Mockingbird  | Harper Lee    | Fiction   |             1960 |            3 |
|       3 | 1984                   | George Orwell | Dystopian |             1949 |            1 |
|       4 | Pride and Prejudice    | Jane Austen   | Romance   |             1813 |            2 |
|       5 | The Catcher in the Rye | J.D. Salinger | Fiction   |             1951 |            1 |
|       6 | Brave New World        | Aldous Huxley | Dystopian |             1932 |            4 |
+---------+------------------------+---------------+-----------+------------------+--------------+


create table if not exists 46_1Borrowing_records3570(
    record_id int primary key,
    book_id int,
    borrower_name varchar(50),
    borrow_date varchar(50),
    return_date varchar(50)
);

insert into 46_1Borrowing_records3570 values
(1, 1, 'Alice Smith', '2024-01-15', NULL),
(2, 1, 'Bob Johnson', '2024-01-20', NULL),
(3, 2, 'Carol White', '2024-01-10', '2024-01-25'),
(4, 3, 'David Brown', '2024-02-01', NULL),
(5, 4, 'Emma Wilson', '2024-01-05', NULL),
(6, 5, 'Frank Davis', '2024-01-18', '2024-02-10'),
(7, 1, 'Grace Miller', '2024-02-05', NULL),
(8, 6, 'Henry Taylor', '2024-01-12', NULL),
(9, 2, 'Ivan Clark', '2024-02-12', NULL),
(10, 2, 'Jane Adams', '2024-02-15', NULL);


mysql> select * from 46_1Borrowing_records3570;
+-----------+---------+---------------+-------------+-------------+
| record_id | book_id | borrower_name | borrow_date | return_date |
+-----------+---------+---------------+-------------+-------------+
|         1 |       1 | Alice Smith   | 2024-01-15  | NULL        |
|         2 |       1 | Bob Johnson   | 2024-01-20  | NULL        |
|         3 |       2 | Carol White   | 2024-01-10  | 2024-01-25  |
|         4 |       3 | David Brown   | 2024-02-01  | NULL        |
|         5 |       4 | Emma Wilson   | 2024-01-05  | NULL        |
|         6 |       5 | Frank Davis   | 2024-01-18  | 2024-02-10  |
|         7 |       1 | Grace Miller  | 2024-02-05  | NULL        |
|         8 |       6 | Henry Taylor  | 2024-01-12  | NULL        |
|         9 |       2 | Ivan Clark    | 2024-02-12  | NULL        |
|        10 |       2 | Jane Adams    | 2024-02-15  | NULL        |
+-----------+---------+---------------+-------------+-------------+


--Write a solution to find all books that are currently borrowed (not returned) 
--and have zero copies available in the library.
--A book is considered currently borrowed if there exists a borrowing record with a NULL return_date
--Return the result table ordered by current borrowers in descending order, 
--then by book title in ascending order.


select 
a.book_id, a.tital,a.author, a.genre, a.publication_year,
count(b.borrower_name) as current_borrower
from 46FindBooksWithNoAvailableCopies3570 a
left join 46_1Borrowing_records3570 b
on a.book_id = b.book_id
where b.return_date IS NULL
group by a.book_id, a.total_copies
having a.total_copies - count(b.borrower_name) = 0
order by current_borrower desc, a.tital asc;


Output

+---------+------------------+---------------+-----------+------------------+------------------+
| book_id | tital            | author        | genre     | publication_year | current_borrower |
+---------+------------------+---------------+-----------+------------------+------------------+
|       1 | The Great Gatsby | F. Scott      | Fiction   |             1925 |                3 |
|       3 | 1984             | George Orwell | Dystopian |             1949 |                1 |
+---------+------------------+---------------+-----------+------------------+------------------+
2 rows in set (0.01 sec)





