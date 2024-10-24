-- Active: 1729755939461@@127.0.0.1@3306@bookstore

use bookstore;

-- 박지성 고객의 구매이력

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
where c.name = '박지성'; -- 일반 조건