use bookstore;
show databases;
show tables;

-- 모든 도서 조회
select * from book;

select bookname, publisher, price from book;

-- distinct 중복제거
select distinct publisher from book;

select * from book where publisher = '대한미디어';

-- 대한미디어에서 출간한 도서 중 가격이 3만원 상인 도서 조회
select * from book where publisher = '대한미디어' and price >= 30000;


-- 가격이 2 - 3만인 도서
select * from book where price >= 20000 and price <= 30000;
select * from book where price between 20000 and 30000;

-- 가격이 2이하 - 3만이상인 도서
select * from book where price >= 30000 or price <= 20000;
select * from book where price not between 20000 and 30000;

-- 도서 가격 순서 조회
select * from book order by price asc; -- asc는 생략가능
select * from book order by price desc;

-- 출판사 및 가격 순
select * from book order by publisher, price desc;
select * from book order by publisher asc, price desc;

-- 주문 데이터 조회
select * from orders;

-- 매출액 조회
select sum(saleprice) as 주문총액  from orders;
select sum(saleprice) as "주문총액"  from orders;

-- 평균매출액
SELECT sum(saleprice) as "구매 총액",
	   avg(saleprice) as "구매 평균",
       max(saleprice) as "최고 구매액",
       min(saleprice) as "최소 구매액",
       count(saleprice) as "구매건수"
from orders;

select custid, sum(saleprice) "총구매액", avg(saleprice) "평균구매액" from orders GROUP BY custid;

-- 축구 관련 도서 조회
select * from book where bookname like '%축구%';

-- 전화번호를 등록하지 않은 고객 조회
select * from customer WHERE phone is NULL;

use bookstore;