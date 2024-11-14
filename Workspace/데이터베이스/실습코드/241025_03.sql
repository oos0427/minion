use bookstore;

desc book;

insert into book (bookid, bookname, publisher, price)
values (101, '혼자 공부하는 데이터 분석', '한빛미디어', 26000);

select * from book;

insert into book (bookid, bookname)
values (103, '수학으로 만드는 기초 AI');

insert into book (bookid, bookname)
values (104, '신규도서 4'),
       (105, '신규도서 5'),
       (106, '신규도서 6'),
       (107, '신규도서 7'),
       (108, '신규도서 8');

-- 데이터 수정
update book
set price = 50000;

update book set price = 70000 where bookid >=100;

update book set price = 80000, bookname = '수정된 도서' where bookid =101;

select * from book order by bookid desc;


-- 데이터 삭제

delete from book where bookid > 100;

select * from book order by bookid desc;

-- 테이블 만들기 : book2 이름으로 book과 유사하게
create table book2(
    bookid integer primary key AUTO_INCREMENT,
    bookname varchar(100) not null,
    publisher varchar(100) not null,
    price integer not null,
    pubdate date not null,
    regdate datetime default (now())
);

create table customer2(
    custid integer auto_increment,
    name varchar(50) not null,
    address varchar(100) null,
    phone varchar(20) null,
    -- primary key (custid)
    constraint pk_customer2 primary key(custid)
);

CREATE TABLE order2 (
    orderid INTEGER AUTO_INCREMENT,
    custid INTEGER NOT NULL,
    bookid INTEGER NOT NULL,
    saleprice INTEGER NOT NULL,
    orderdate DATE NOT NULL,
    CONSTRAINT pk_orders2 PRIMARY KEY (orderid),
    CONSTRAINT fk_orders2_customer2 FOREIGN KEY (custid) REFERENCES customer2(custid),
    CONSTRAINT fk_orders2_book2 FOREIGN KEY (bookid) REFERENCES book2(bookid));

desc book2;
alter table book2
add isbn char(13) null;
desc book2;

alter table book2
modify isbn varchar(50) null;
desc book2;

alter table book2
drop column isbn;

drop table book2;
drop table order2;
drop table customer2;