use bookstore;

-- 테이블 만들기 : member
-- 컬럼 : memberId(문자열, 20, pk), 
--	passwd(문자열, 100, not null)
--	email(문자열, 100, not null), 
--	usertype(문자열, 기본값:user), 
--	deleted(boolean, 기본값:false), 
--  regdate(날짜, 기본값:now())
drop table member;
drop table board;

create table member(
    memberId varchar(20) primary key,
    passwd varchar(100) not null,
    email varchar(100) not null,
    usertype varchar(100) default ('user'),
    deleted boolean default (false),
    regdate date default (now())
);

"""
create table member
(
	memberid varchar(20) primary key,
	passwd varchar(100) not null,
	email varchar(100) not null,
	usertype varchar(20) default('user'),
	deleted boolean default(false),
	regdate date default(now())
);
"""

-- 테이블 만들기 : board
-- 컬럼 : boardno(숫자, pk, 자동증가), 
--	title(문자열, 100, not null)
--	content(문자열, 100, not null), 
--	writer(문자열, 20, 외래키-member의 memberid 참조), 
--	deleted(boolean, 기본값:false), 
--	regdate(날짜, 기본값:now())
"""
create table board(
    boardno integer primary key AUTO_INCREMENT,
    title varchar(100) not null,
    content varchar(2000) not null,
    writer varchar(20) default (false),
    deleted boolean default (false),
    regdate datetime default (now()),
    CONSTRAINT fk_board_member FOREIGN KEY (writer) REFERENCES member(memberId)
);
"""

create table board
(
	boardno integer primary key auto_increment,
	title varchar(100) not null,
	content varchar (2000) not null,
	writer varchar(20) not null,
	deleted boolean default (false),
	regdate date default (now()),
	constraint fk_board_member foreign key (writer) references member(memberid)
);

insert into member (memberid, passwd, email) values('johndoe', 'iamuserone', '');
insert into board (title, content, writer) values ('첫 번째 게시글', '처음 쓰는 게시글 연습', 'iamuserone');
INSERT INTO board (title, content, writer) VALUES ('첫 번째 게시글', '처음 쓰는 게시글 연습', 'johndoe');

select * from board;
select * from member;
