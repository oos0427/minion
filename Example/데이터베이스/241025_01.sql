-- Active: 1729755939461@@127.0.0.1@3306@bookstore

use bookstore;

SHOW GRANTS FOR 'humanda'@'localhost';

SELECT USER(), CURRENT_USER();

select * from book;
select * from customer;
select * from orders;
select * from imported_book;

create table inc_test
(
	idx integer primary key auto_increment,
    c1 varchar(100)
);

insert into inc_test (c1) values('test 1');
insert into inc_test (c1) values('test 2');
insert into inc_test (c1) values('test 3');
insert into inc_test (c1) values('test 4');
insert into inc_test (c1) values('test 5');
insert into inc_test (c1) values('test 6');
insert into inc_test (c1) values('test 7');
insert into inc_test (c1) values('test 8');

select * from inc_test;

drop table inc_test;


-- 박지성 고객의 구매이력 이름과 주문정보를 모두 가져오기
select * from customer;
select * from orders;
-- 약식 조인 방식
select c.name, o.* from orders o, customer c
where o.custid = c.custid -- join 조건
 and c.name = '박지성'; -- 일반 조건

-- 정식 조인 방식
select c.name, o.* 
from orders o
inner join customer c
on o.custid = c.custid
where c.name = '박지성';

-- 고객과 고객의 주문에 정보 조회
select c.custid, c.name, o.bookid, o.saleprice, o.orderdate
from customer c 
inner join orders o 
on c.custid = o.orderid
ORDER BY c.custid;

select c.name, o.*
from customer c 
inner join orders o 
on c.custid = o.orderid
ORDER BY c.custid;

-- 사용할일 잘 없음
select * from customer c cross join orders o order by c.custid;


-- 고객과 고객의 주문에 정보 조회
select c.custid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate
from customer c 
inner join orders o 
on c.custid = o.custid
inner join book b
on o.bookid = b.bookid
ORDER BY c.custid;

select * from customer;

-- 고객별 주문 총액
select c.custid, c.name, sum(o.saleprice)
from customer c
inner join orders o
on c.custid = o.custid
GROUP BY c.custid, c.name
order by c.custid;


-- subquery 또는 join을 사용해서 아래에 해당하는 sql을 작성하세요

-- 가장 비싼 도서의 이름을 보이시오
-- 서브쿼리
select max(price) from book;
select *
from book
where price = (select max(price) from book);

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
select * from orders;
select * from book;
select * from customer;

select c.name
from customer c
inner join orders o
on c.custid = o.custid
group by o.custid;

-- 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오
select * from orders;
select * from book;
select * from customer;

select c.name, b.publisher
from customer c  
inner join orders o
on c.custid = o.custid
inner join book b
on o.bookid = b.bookid
-- group by o.custid
where b.publisher = '대한미디어';



-- 주문이 있는 고객의 이름과 주소를 보이시오

select * from book;
select * from customer;
select * from orders;
select * from orders order by saleprice desc;

select b.bookname, max(o.saleprice)
from book b
inner join orders o
on b.bookid = o.bookid
group by b.bookid;

select max(price)
from book;



