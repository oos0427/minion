DROP DATABASE IF univeDB;
CREATE DATABASE IF NOT EXISTS univDB;
USE univDB ;

CREATE TABLE 학생
	( 학번 CHAR(4) NOT NULL,
	  이름 VARCHAR(20) NOT NULL,
	  주소 VARCHAR(50) NULL DEFAULT '미정', 
	  학년 INT NOT NULL,과목PRIMARY
	  나이 INT NULL,
	  성별 CHAR(1) NOT NULL,
	  휴대폰번호 CHAR(14) NULL, 
          소속학과 VARCHAR(20) NULL,
	  PRIMARY KEY (학번) ) ; 
 CREATE TABLE 과목
	(  과목번호 CHAR(4) NOT NULL PRIMARY KEY,
       이름 VARCHAR(20) NOT NULL,
       강의실 CHAR(3) NOT NULL,
       개설학과 VARCHAR(20) NOT NULL,
       시수 INT NOT NULL );
      
CREATE TABLE 수강
(
 학번 CHAR(6) NOT NULL,
 과목번호 CHAR(4) NOT NULL,
 신청날짜 DATE NOT NULL,
 중간성적 INT NULL DEFAULT 0,
 기말성적 INT NULL DEFAULT 0,
 평가학점 CHAR(1) NULL,
 PRIMARY KEY(학번, 과목번호) );
 
INSERT INTO 학생
VALUES ('s001', '김연아', '서울 서초', 4, 23, '여', '010-1111-2222',  '컴퓨터') ;
INSERT INTO 학생
VALUES ('s002', '홍길동', DEFAULT, 1, 26, '남', NULL,  '통계') ;
INSERT INTO 학생
VALUES ('s003', '이승엽', NULL, 3, 30, '남', NULL,  '정보통신') ;
INSERT INTO 학생
VALUES ('s004', '이영애', '경기 분당', 2, NULL, '여', '010-4444-5555', '정보통신') ;
INSERT INTO 학생
VALUES ('s005', '송윤아', '경기 분당', 4, 23, '여', '010-6666-7777', '컴퓨터') ;
INSERT INTO 학생
VALUES ('s006', '홍길동', '서울 종로', 2, 26, '남', '010-8888-9999', '컴퓨터') ;
INSERT INTO 학생
VALUES ('s007', '이은진', '경기 과천', 1, 23, '여', '010-2222-3333', '경영') ;

INSERT INTO 과목
VALUES ('c001', '데이터베이스', 126, '컴퓨터', 3) ;
INSERT INTO 과목
VALUES ('c002', '정보보호', 137, '정보통신', 3) ;
INSERT INTO 과목
VALUES ('c003', '모바일웹', 128, '컴퓨터', 3) ;
INSERT INTO 과목
VALUES ('c004', '철학개론', 117, '철학', 2) ;
INSERT INTO 과목
VALUES ('c005', '전공글쓰기', 120, '교양학부', 1) ;

INSERT INTO 수강
VALUES ('s001', 'c002', '2019-09-03', 93, 98, 'A') ;
INSERT INTO 수강
VALUES ('s004', 'c005', '2019-03-03', 72, 78, 'C') ;
INSERT INTO 수강
VALUES ('s003', 'c002', '2017-09-06', 85, 82, 'B') ;
INSERT INTO 수강
VALUES ('s002', 'c001', '2018-03-10', 31, 50, 'F') ;
INSERT INTO 수강
VALUES ('s001', 'c004', '2019-03-05', 82, 89, 'B') ;
INSERT INTO 수강
VALUES ('s004', 'c003', '2020-09-03', 91, 94, 'A') ;
INSERT INTO 수강
VALUES ('s001', 'c005', '2020-09-03', 74, 79, 'C') ;
INSERT INTO 수강
VALUES ('s003', 'c001', '2019-03-03', 81, 82, 'B') ;
INSERT INTO 수강
VALUES ('s004', 'c002', '2018-03-05', 92, 95, 'A') ;

USE univDB;
SELECT DATABASE();
SHOW TABLES ;
DESC 학생;

SELECT 이름, 주소 FROM 학생;

SELECT 이름, 주소, 학년, 나이, 성별, 휴대폰번호, 소속학과 FROM 학생;

SELECT * FROM 학생;

SELECT DISTINCT 소속학과 FROM 학생;

SELECT 소속학과 FROM 학생;

SELECT ALL 소속학과 FROM 학생;

SELECT 이름, 학년, 소속학과, 휴대폰번호 FROM 학생 WHERE 학년 >=2 AND 소속학과 = '컴퓨터' ; 

SELECT 이름, 학년, 소속학과, 휴대폰번호 FROM 학생 WHERE (학년 >= 1  AND 학년 <= 3) OR NOT (소속학과 = '컴퓨터');

SELECT 이름, 학년, 소속학과 FROM 학생 WHERE 소속학과 = '컴퓨터' OR 소속학과 = '정보통신' ORDER BY 학년 ASC;

SELECT * FROM 학생 ORDER BY 학년 ASC, 이름 DESC;

SELECT * FROM 수강 ORDER BY 중간성적 DESC;

SELECT * FROM 수강 ORDER BY 중간성적 DESC LIMIT 8;

SELECT * FROM 수강 ORDER BY 중간성적 DESC LIMIT 5, 3;

SELECT COUNT(*) FROM 학생;

SELECT COUNT(학번) FROM 학생;

SELECT COUNT(*) AS 학생수1, COUNT(주소) AS 학생수2, COUNT(DISTINCT 주소) AS 학생수3 FROM 학생;

SELECT 학번 FROM 학생;

SELECT 성별, MAX(나이) AS '최고 나이', MIN(나이) AS '최저 나이' FROM 학생 GROUP BY 성별 ORDER BY 성별 ASC;
SELECT 성별, MAX(나이) AS '최고 나이', MIN(나이) AS '최저 나이' FROM 학생 GROUP BY 성별 ORDER BY 성별 DESC;

SELECT 나이, COUNT(*) AS '나이별 학생수' FROM 학생 WHERE 나이>= 20 AND 나이 <=30 GROUP BY 나이;

SELECT 학년, COUNT(*) AS '학년별 학생수' FROM 학생 GROUP BY 학년 HAVING COUNT(*) >=2;

SELECT 학번, 이름 FROM 학생 WHERE 이름 LIKE '이__';

SELECT 이름, 주소, 학년 FROM 학생 WHERE 주소 LIKE '%서울%' ORDER BY 학년 DESC;

SELECT 이름, 휴대폰번호 FROM 학생 WHERE 휴대폰번호 IS NULL;

SELECT 학번 FROM 학생 WHERE 성별 = '여' UNION SELECT 학번 FROM 수강 WHERE 평가학점 = 'A';

-- 159P 까지함 위에꺼

SELECT 이름 FROM 학생 WHERE 학번 IN('s001', 's003', 's004');

SELECT 이름 FROM 학생 WHERE 학번 IN ( SELECT 학번 FROM 수강 WHERE 과목번호 = 'c002');

SELECT * FROM 학생, 수강;
SELECT * FROM 수강 ;

SELECT 이름  FROM 학생 WHERE 학번 IN (SELECT 학번 FROM 수강 WHERE 과목번호 = (SELECT 과목번호 FROM 과목 WHERE 이름 = '정보보호'));
SELECT * FROM 학생, 수강, 과목;

SELECT 이름 FROM 학생 WHERE EXISTS ( SELECT * FROM 수강 WHERE 수강.학번 = 학생.학번 AND 과목번호 = 'c002');

SELECT 이름
FROM 학생
WHERE EXISTS ( SELECT *
                  FROM 수강
                  WHERE 수강.학번=학생.학번 AND 과목번호='c002' );
                  
SELECT 이름
FROM 학생
WHERE NOT EXISTS ( SELECT *
                       FROM 수강
                       WHERE 수강.학번=학생.학번 ) ;
                       
SELECT * FROM 학생, 수강;
SELECT * FROM 학생 CROSS JOIN 수강;

SELECT * FROM 학생 JOIN 수강 ON 학생.학번 = 수강.학번;

SELECT *
FROM 학생, 수강
WHERE 학생.학번=수강.학번 ;

#p.167
SELECT 학생.학번, 이름, 과목번호, 중간성적+(중간성적*0.1) AS 변환중간성적
FROM 학생, 수강
WHERE 학생.학번=수강.학번 AND 과목번호='c002' ;

SELECT 학생.학번, 이름, 과목번호, 중간성적+(중간성적*0.1) AS 변환중간성적
FROM 학생 JOIN 수강 ON 학생.학번=수강.학번
WHERE 과목번호='c002' ;

SELECT 학생.학번, 학생.이름, 수강.과목번호
FROM 학생, 수강, 과목
WHERE 학생.학번=수강.학번 AND 수강.과목번호=과목.과목번호 AND 과목.이름='정보보호' ;

SELECT 학생.학번, 학생.이름, 수강.과목번호
FROM ( 학생 JOIN 수강 ON 학생.학번=수강.학번 ) JOIN 과목 ON 수강.과목번호=과목.과목번호
WHERE 과목.이름='정보보호' ;

#p.168
SELECT 이름, 과목번호
FROM 학생 AS S, 수강 E
WHERE S.학번=E.학번 AND 과목번호='c002' ;

SELECT 이름, 과목번호
FROM 학생, 수강
WHERE 학생.학번 = 수강.학번 AND 과목번호 = 'c002';

SELECT S1.이름, S2.이름
FROM 학생 S1 JOIN 학생 S2 ON S1.주소=S2.주소
WHERE  S1.학년 > S2.학년 ;

#p.169
SELECT 학생.학번, 이름, 평가학점
FROM 학생 LEFT OUTER JOIN 수강 ON 학생.학번=수강.학번;

SELECT 학생.학번, 이름, 평가학점
FROM 학생 RIGHT OUTER JOIN 수강 ON 학생.학번=수강.학번;

SELECT 학생.학번, 이름, 평가학점
FROM 학생 JOIN 수강 ON 학생.학번=수강.학번;

CREATE TABLE 학생1 AS ( SELECT * FROM 학생 ) ;
CREATE TABLE 과목1 AS ( SELECT * FROM 과목 ) ;
CREATE TABLE 수강1 AS ( SELECT * FROM 수강 ) ;

INSERT INTO 학생1
VALUES ('g001', '김연아2', '서울 서초', 4, 23, '여', '010-1111-2222', '컴퓨터') ;

INSERT INTO 학생1(이름, 주소, 학년, 나이, 성별, 휴대폰번호, 소속학과, 학번)
VALUES ('홍길동2', DEFAULT, 1, 26, '남', NULL , '통계', 'g002') ;

#p.172
INSERT INTO 학생1(이름, 학년, 나이, 성별, 소속학과, 학번)
VALUES ('홍길동2', 1, 26, '남', '통계', 'g002') ;

INSERT INTO 학생1(학년, 나이, 성별, 소속학과, 학번, 이름)
VALUES (3, 30, '남', '정보통신', 'g003', '이승엽2') ;

SELECT * FROM 학생1;

CREATE TABLE 4학년생 AS ( SELECT * FROM 학생 );
INSERT INTO 4학년생(학번, 이름, 학년, 성별)   
SELECT 학번, 이름, 학년, 성별
FROM 학생
WHERE 학년=4 ;

SET SQL_SAFE_UPDATES = 0;

UPDATE 학생1 SET 학년 = 3 WHERE 이름 = '이은진';
SELECT * FROM 학생1 WHERE 이름 = '이은진';

UPDATE 학생1 SET 학년 = 학년 + 1, 소속학과 = '자유전공학부' WHERE 학년 = 4;

SELECT * FROM 학생1 WHERE 소속학과 = '자유전공학부';

UPDATE 학생1 SET 소속학과 = NULL WHERE 학번 NOT IN (SELECT 학번 FROM 수강1);

SELECT * FROM 학생1 WHERE 학번 NOT IN (SELECT 학번 FROM 수강1);
SELECT * FROM 수강1;

UPDATE 수강1 SET 학번 = (SELECT 학번 FROM 학생1 WHERE 이름 = '이은진' ) WHERE 학번 = 's003' ;
SELECT * FROM 수강1 WHERE 학번 = 's003' OR 학번 = 's007';

UPDATE 학생1 SET 학년 = 3 WHERE 이름 = '이은진';
UPDATE 학생1 SET 소속학과 = '경영' WHERE 이름 = '이은진' AND 주소 = '경기 과천';
SELECT * FROM 학생1 WHERE 이름 = '이은진';

UPDATE 학생1 SET 소속학과 = '자유전공학부' WHERE 학년 = 5; 
UPDATE 학생1 SET 학년 = 학년 + 1, 소속학과 = '자유전공학부' WHERE 학년 = 4;
SELECT * FROM 학생1;

UPDATE 학생1 SET 소속학과 = NULL WHERE 학번 NOT IN (SELECT 학번 FROM 수강1);

SELECT * FROM 학생1;

UPDATE 수강1
SET 학번 = ( SELECT 학번
              FROM 학생1
              WHERE 이름='이은진' )

WHERE 학번='s003' ;

SELECT * FROM 수강1 WHERE 학번='s003' OR 학번='s007';

DELETE FROM 학생1;
SELECT * FROM 학생1;

USE univDB ;

CREATE TABLE 과목2
	( 과목번호 CHAR(4) NOT NULL PRIMARY KEY,
	  이름 VARCHAR(20) NOT NULL,
	  강의실 CHAR(5) NOT NULL,
	  개설학과 VARCHAR(20) NOT NULL,
	  시수 INT NOT NULL );
      
      #p.192
CREATE TABLE 학생2
	( 학번 CHAR(4) NOT NULL,
	  이름 VARCHAR(20) NOT NULL,
	  주소 VARCHAR(50) DEFAULT '미정', 
	  학년 INT NOT NULL,
	  나이 INT NULL,
	  성별 CHAR(1) NOT NULL,
	  휴대폰번호 CHAR(13) NULL, 
          소속학과 VARCHAR(20) NULL,
	  PRIMARY KEY (학번), 
	  UNIQUE (휴대폰번호) ) ; 
DESC 학생2 ;

SHOW CREATE TABLE 학생2;

CREATE TABLE 수강2
	( 학번 CHAR(6) NOT NULL,
	  과목번호 CHAR(4) NOT NULL,
	  신청날짜 DATE NOT NULL,
	  중간성적 INT NULL DEFAULT 0,
	  기말성적 INT NULL DEFAULT 0, 
	  평가학점 CHAR(1) NULL,        
	  PRIMARY KEY(학번, 과목번호),
	  FOREIGN KEY(학번) REFERENCES 학생2(학번),
	  FOREIGN KEY(과목번호) REFERENCES 과목2(과목번호) ) ;
      
INSERT INTO 과목2(과목번호, 이름, 강의실, 개설학과)
VALUES ('c111', 'database', A-123, '산업공학') ; 
-- ❶ CHAR(5) 유형 오류(‘강의실’열의 문자형 유형에 불일치함)
INSERT INTO 과목2(과목번호, 이름, 강의실, 개설학과, 시수)
VALUES ('c111', 'database', 'A-123', '산업공학') ;
-- ❷ NULL 제약 조건 오류(‘시수’열이 NULL을 허용하지 않음)
INSERT INTO 과목2(과목번호, 이름, 강의실, 개설학과, 시수)
VALUES ('c111', 'database', 'A-123', '산업공학', 3) ;

INSERT INTO 학생2(학번, 이름, 학년, 나이, 성별, 휴대폰번호, 소속학과)
VALUES ('s111', '박태환', 4, NULL, '남', '010-1111-1111', '산업공학') ;
-- ❹ 정상 수행
INSERT INTO 학생2(학번, 이름, 학년, 나이, 성별, 휴대폰번호, 소속학과)
VALUES ('s222', '박태환', 2, NULL, '남', '010-1111-1111', '산업공학') ; 
-- ❺ UNIQUE 제약 조건 오류(‘휴대폰번호’열 값이 중복됨)
INSERT INTO 학생2(학번, 이름, 학년, 나이, 성별, 휴대폰번호, 소속학과)
VALUES ('s222', '박태환', 2, NULL, '남', '010-2222-2222', '산업공학') ;
-- ❻ 정상 수행

INSERT INTO 수강2(학번, 과목번호, 신청날짜)
VALUES ('s111', 'c111', '2019-12-31') ;
-- ❼ 정상 수행
INSERT INTO 수강2(학번, 과목번호, 신청날짜, 중간성적, 기말성적, 평가학점)
VALUES ('s111', 'c222', '2019-12-31', 93, 98, 'A') ; 
-- ❽ 외래키 제약 조건 오류(입력 과목번호 값이 ‘과목2’ 테이블에 존재하지 않음)
INSERT INTO 수강2(학번, 과목번호, 신청날짜, 중간성적, 기말성적, 평가학점)
VALUES ('s111', 'c111', '2019-12-31', 93, 98, 'A') ; 
-- ❾ 기본키 제약 조건 오류(기본키 ‘학번’과 ‘과목번호’열의 조합이 중복 값이 존재함)
INSERT INTO 수강2(학번, 과목번호, 신청날짜, 중간성적, 기말성적, 평가학점)
VALUES ('s222', 'c111', '2019-12-31', 93, 98, 'A') ;
-- ❿ 정상 수행

INSERT INTO 과목2 SELECT * FROM 과목 ;
INSERT INTO 학생2 SELECT * FROM 학생 ;
INSERT INTO 수강2 SELECT * FROM 수강 ;

ALTER TABLE 학생2 ADD 등록날짜 DATETIME NOT NULL DEFAULT '2019-12-30' ;

SELECT * FROM 학생2;

ALTER TABLE 학생2 DROP COLUMN 등록날짜 ; 
SELECT * FROM 학생2;

ALTER TABLE 학생2 CHANGE 이름 학생이름 VARCHAR(20)  ;

ALTER TABLE 학생2 RENAME TO 재학생2 ;

DROP TABLE 과목2 ;

DROP TABLE 수강2 ;
DROP TABLE 과목2 ; 

SELECT * FROM 과목2 ;
DESC 과목2 ;

CREATE USER 'user1'@'127.1.1.1' IDENTIFIED BY '1111' ;
CREATE USER 'user2'@'localhost' IDENTIFIED BY '2222' ;
CREATE USER 'user3'@'192.182.10.2' IDENTIFIED BY '3333' ;
CREATE USER 'user4'@'%' IDENTIFIED BY '4444' ;

SELECT host, user FROM mysql.user ;

GRANT INSERT, UPDATE, DELETE ON univDB.* TO 'user1'@'127.1.1.1' ;
GRANT ALL ON *.* TO 'user4'@'%' WITH GRANT OPTION ; 
GRANT SELECT ON univDB.학생 TO 'user2'@'localhost' ;

SHOW GRANTS FOR 'user1'@'127.1.1.1' ;

SHOW GRANTS ; 

REVOKE DELETE ON univDB.* FROM 'user1'@'127.1.1.1' ; 

DROP USER 'user1'@'127.1.1.1' ;

SHOW PROCESSLIST ;

CREATE USER 'MANAGER'@'%' IDENTIFIED BY '1234';
GRANT ALL ON *.* TO 'MANAGER'@'%' WITH GRANT OPTION ; 
