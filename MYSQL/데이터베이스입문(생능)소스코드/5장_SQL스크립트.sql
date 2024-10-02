#p.139
SELECT version( ) ;  -- MySQL 버전 표시
SELECT current_date( ), current_time( ), now( ) ;  -- 현재 날짜와 시간 표시


#p.140
SELECT user( ) ;          -- 현재 MySQL 사용자 표시    
SHOW DATABASES ;       -- 현재 데이터베이스 목록 표시 

#p.141
-- 데이터베이스 생성
DROP DATABASE IF EXISTS univDB ;
CREATE DATABASE IF NOT EXISTS univDB ;

-- SQL 명령어를 실행할 대상인 기본 데이터베이스를 univDB로 지정
USE univDB ;

-- 학생 테이블 생성
CREATE TABLE 학생
	( 학번 CHAR(4) NOT NULL,
	  이름 VARCHAR(20) NOT NULL,
	  주소 VARCHAR(50) NULL DEFAULT '미정', 
	  학년 INT NOT NULL,
	  나이 INT NULL,
	  성별 CHAR(1) NOT NULL,
	  휴대폰번호 CHAR(14) NULL, 
          소속학과 VARCHAR(20) NULL,
	  PRIMARY KEY (학번) ) ; 

-- 과목 테이블 생성
CREATE TABLE 과목
	( 과목번호 char(4) NOT NULL PRIMARY KEY, 
	  이름 VARCHAR(20) NOT NULL, 
	  강의실 CHAR(3) NOT NULL,
	  개설학과 VARCHAR(20) NOT NULL,
	  시수 INT NOT NULL ) ; 

-- 수강 테이블 생성
CREATE TABLE 수강
	( 학번 char(6) NOT NULL,
	  과목번호 CHAR(4) NOT NULL,
	  신청날짜 DATE NOT NULL,
	  중간성적 INT NULL DEFAULT 0,
	  기말성적 INT NULL DEFAULT 0, 
	  평가학점 CHAR(1) NULL,        
	  PRIMARY KEY(학번, 과목번호) ) ; 

-- 학생 테이블 입력
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

-- 과목 테이블 입력
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

-- 수강 테이블 입력
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

#p.143
USE univDB ;          -- 작업 대상 데이터베이스 변경
SELECT database( ) ;  -- 현재 사용 데이터베이스 확인
SHOW TABLES ;       -- univDB 안의 생성 테이블 목록 확인
DESC 학생 ;           -- 학생 테이블 생성 정보 확인

#p.146
SELECT 이름, 주소
FROM 학생 ;

SELECT 학번, 이름, 주소, 학년, 나이, 성별, 휴대폰번호, 소속학과
FROM 학생 ;

SELECT *
FROM 학생 ;

#p.147
SELECT DISTINCT 소속학과
FROM 학생 ;

SELECT 소속학과
FROM 학생 ;

SELECT ALL 소속학과
FROM 학생 ;

#p.149
SELECT 이름, 학년, 소속학과, 휴대폰번호
FROM 학생
WHERE 학년>=2 AND 소속학과='컴퓨터' ;

SELECT 이름, 학년, 소속학과, 휴대폰번호
FROM 학생
WHERE (학년>=1 AND 학년<=3) OR NOT(소속학과='컴퓨터') ;

SELECT 이름, 학년, 소속학과, 휴대폰번호
FROM 학생
WHERE (학년 BETWEEN 1 AND 3) OR NOT(소속학과='컴퓨터') ;

#p.150
SELECT 이름, 학년, 소속학과
FROM 학생
WHERE 소속학과='컴퓨터' OR 소속학과='정보통신'
ORDER BY 학년 ASC ;

#p.151
SELECT *
FROM 학생
ORDER BY 학년 ASC, 이름 DESC ;

SELECT * 
FROM 수강
ORDER BY 중간성적 DESC 
LIMIT 3 ;          -- 처음 3개의 행만 반환

SELECT * 
FROM 수강
ORDER BY 중간성적 DESC 
LIMIT 5, 3 ;          -- 중간 3개의 행만 반환

#p.152
SELECT COUNT(*) 
FROM 학생 ;

SELECT COUNT(학번) 
FROM 학생 ;

#p.153
SELECT COUNT(*) AS 학생수1, COUNT(주소) AS 학생수2, COUNT(DISTINCT 주소) AS 학생수3
FROM 학생 ;

SELECT AVG(나이) '여학생 평균나이'
FROM 학생
WHERE 성별='여' ;

#p.155
SELECT 성별, MAX(나이) AS '최고 나이', MIN(나이) AS '최저 나이'
FROM 학생
GROUP BY 성별 ;

#p.156
SELECT 나이, COUNT(*) AS '나이별 학생수'
FROM 학생
WHERE 나이>=20 and 나이<30
GROUP BY 나이 ;

SELECT 학년, COUNT(*) AS '학년별 학생수'
FROM 학생
GROUP BY 학년
HAVING COUNT(*)>=2;

#p.157
SELECT 학번, 이름
FROM 학생
WHERE 이름 LIKE '이__' ;

#p.158
SELECT 이름, 주소, 학년
FROM 학생
WHERE 주소 LIKE '%서울%'
ORDER BY 학년 DESC ;

SELECT 이름, 휴대폰번호
FROM 학생
WHERE 휴대폰번호 IS NULL ;

#p.159
SELECT 학번
FROM 학생
WHERE 성별 = '여'
UNION
SELECT 학번
FROM 수강
WHERE 평가학점='A' ;

#p.160
SELECT 이름
FROM 학생
WHERE 학번 IN ('s001','s003','s004') ;

SELECT 이름
FROM 학생
WHERE 학번 IN ( SELECT 학번
                  FROM 수강
                  WHERE 과목번호='c002' ) ;

#p.161
SELECT 이름
FROM 학생
WHERE 학번 IN ( SELECT 학번
                  FROM 수강
                  WHERE 과목번호 = ( SELECT 과목번호
                                        FROM 과목
                                        WHERE 이름='정보보호' ) ) ;

#p.162
SELECT 이름
FROM 학생
WHERE EXISTS ( SELECT *
                  FROM 수강
                  WHERE 수강.학번=학생.학번 AND 과목번호='c002' ) ;

#p.163
SELECT 이름
FROM 학생
WHERE NOT EXISTS ( SELECT *
                       FROM 수강
                       WHERE 수강.학번=학생.학번 ) ;

#p.165
SELECT *
FROM 학생, 수강 ;

SELECT *
FROM 학생 CROSS JOIN 수강 ;

#p.166
SELECT *
FROM 학생, 수강
WHERE 학생.학번=수강.학번 ;

SELECT *
FROM 학생 JOIN 수강 ON 학생.학번=수강.학번 ;

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

SELECT S1.이름, S2.이름
FROM 학생 S1 JOIN 학생 S2 ON S1.주소=S2.주소
WHERE  S1.학년 > S2.학년 ;

#p.169
SELECT 학생.학번, 이름, 평가학점
FROM 학생 LEFT OUTER JOIN 수강 ON 학생.학번=수강.학번

#p.170
CREATE TABLE 학생1 AS ( SELECT * FROM 학생 ) ;
CREATE TABLE 과목1 AS ( SELECT * FROM 과목 ) ;
CREATE TABLE 수강1 AS ( SELECT * FROM 수강 ) ;

#p.171
INSERT INTO 학생1
VALUES ('g001', '김연아2', '서울 서초', 4, 23, '여', '010-1111-2222', '컴퓨터') ;

INSERT INTO 학생1(이름, 주소, 학년, 나이, 성별, 휴대폰번호, 소속학과, 학번)
VALUES ('홍길동2', DEFAULT, 1, 26, '남', NULL , '통계', 'g002') ;

#p.172
INSERT INTO 학생1(이름, 학년, 나이, 성별, 소속학과, 학번)
VALUES ('홍길동2', 1, 26, '남', '통계', 'g002') ;

INSERT INTO 학생1(학년, 나이, 성별, 소속학과, 학번, 이름)
VALUES (3, 30, '남', '정보통신', 'g003', '이승엽2') ;

INSERT INTO 4학년생(학생번호, 학생이름, 학년)   
SELECT 학번, 이름, 학년
FROM 학생
WHERE 학년=4 ;

#p.173
SET SQL_SAFE_UPDATES = 0 ;

#p.174
UPDATE 학생1
SET 학년=3
WHERE 이름='이은진' ;

SELECT * FROM 학생1 WHERE 이름='이은진' ;

UPDATE 학생1
SET 학년=학년+1, 소속학과='자유전공학부'
WHERE 학년=4 ;

SELECT * FROM 학생1 ;

#p.175
UPDATE 학생1
SET 소속학과 = NULL
WHERE 학번 NOT IN ( SELECT 학번
		    FROM 수강1 ) ;

SELECT * FROM 학생1 ;

UPDATE 수강1
SET 학번 = ( SELECT 학번
              FROM 학생1
              WHERE 이름='이은진' )

WHERE 학번='s003' ;

SELECT * FROM 수강1 WHERE 학번='s003' OR 학번='s007';

#p.176
DELETE FROM 학생1
WHERE 이름='송윤아' ;

SELECT * FROM 학생1 ;

#p.177
DELETE FROM 학생1
WHERE 학년=3 ;

SELECT * FROM 학생1 ;

#p.178
DELETE FROM 과목1
WHERE 과목번호 IN
       ( SELECT 과목번호
        FROM 수강1
        GROUP BY 과목번호
        HAVING COUNT(*)<2 ) ;

SELECT * FROM 과목1 ;

DELETE FROM 학생1 ;

SELECT * FROM 학생1 ;

