-- Active: 1729755939461@@127.0.0.1@3306@bookstore

-- 작업데이터베이스변경

use bookstore;

select * from customer;

select '박지성' 고객, sum(saleprice) 구매액 from orders where custid = (select custid from customer where name = '박지성');

-- 구매한 이력이 있는 고객 정보 조회

select * from customer;

select * from orders;

select * 
from customer 
-- where custid in (1, 2, 3, 4);
where custid in (select distinct custid from orders);

select * from book
union ALL
select * from imported_book;


-- book과 imported_book 테이블에 있는 도서 갯수 조회

select count(*)
from(
    select * from book
    union ALL
    select * from imported_book
) a;


select(
(select count(*) from book)
+
(select count(*) from imported_book)
) 도서갯수;

