use univdb;

#p.191
CREATE TABLE 과목2
	( 과목번호 CHAR(4) NOT NULL PRIMARY KEY,
	  이름 VARCHAR(20) NOT NULL,
	  강의실 CHAR(5) NOT NULL,
	  개설학과 VARCHAR(20) NOT NULL,
	  시수 INT NOT NULL ) ;

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
 
#p.193
SHOW CREATE TABLE 학생2 ;

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

#p.194
INSERT INTO 과목2(과목번호, 이름, 강의실, 개설학과)
VALUES ('c111', 'database', A-123, '산업공학') ; 
-- ❶ CHAR(5) 유형 오류(‘강의실’열의 문자형 유형에 불일치함)
INSERT INTO 과목2(과목번호, 이름, 강의실, 개설학과, 시수)
VALUES ('c111', 'database', 'A-123', '산업공학') ;
-- ❷ NULL 제약 조건 오류(‘시수’열이 NULL을 허용하지 않음)
INSERT INTO 과목2(과목번호, 이름, 강의실, 개설학과, 시수)
VALUES ('c111', 'database', 'A-123', '산업공학', 3) ;
-- ❸ 정상 수행

#p.195
INSERT INTO 학생2(학번, 이름, 학년, 나이, 성별, 휴대폰번호, 소속학과)
VALUES ('s111', '박태환', 4, NULL, '남', '010-1111-1111', '산업공학') ;
-- ❹ 정상 수행
INSERT INTO 학생2(학번, 이름, 학년, 나이, 성별, 휴대폰번호, 소속학과)
VALUES ('s222', '박태환', 2, NULL, '남', '010-111-1111', '산업공학') ; 
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

#p.196
INSERT INTO 과목2 SELECT * FROM 과목 ;
INSERT INTO 학생2 SELECT * FROM 학생 ;
INSERT INTO 수강2 SELECT * FROM 수강 ;

ALTER TABLE 학생2
	ADD 등록날짜 DATETIME NOT NULL DEFAULT '2019-12-30' ;

SELECT * FROM 학생2 ;

#p.197
ALTER TABLE 학생2
	DROP COLUMN 등록날짜 ;

SELECT * FROM 학생2 ;

#p.198
ALTER TABLE 학생2 CHANGE 이름 학생이름 VARCHAR(20)  ;

ALTER TABLE 학생2 RENAME TO 재학생2 ;

#p.199
DROP TABLE 과목2 ;     -- 삭제 불가

DROP TABLE 수강2 ;     -- 참조(자식) 테이블 삭제
DROP TABLE 과목2 ;     -- 삭제 가능

SELECT * FROM 과목2 ;
DESC 과목2 ;

#p.200
CREATE USER 'user1'@'127.1.1.1' IDENTIFIED BY '1111' ;
CREATE USER 'user2'@'localhost' IDENTIFIED BY '2222' ;
CREATE USER 'user3'@'192.182.10.2' IDENTIFIED BY '3333' ;
CREATE USER 'user4'@'%' IDENTIFIED BY '4444' ;

#p.201
SELECT host, user FROM mysql.user ;

#p.202
GRANT INSERT, UPDATE, DELETE ON univDB.* TO 'user1'@'127.1.1.1' ;
GRANT ALL ON *.* TO 'user4'@'%' WITH GRANT OPTION ; 
GRANT SELECT ON univDB.학생 TO 'user2'@'localhost' ; 

#p.203
SHOW GRANTS FOR 'user1'@'127.1.1.1' ;  -- user1 사용자의 권한 표시

SHOW GRANTS ;                          -- 현재 접속 사용자의 권한 표시

REVOKE DELETE ON univDB.* FROM 'user1'@'127.1.1.1' ; 

#p.204
DROP USER 'user1'@'127.1.1.1' ;

SHOW PROCESSLIST ;

#p.205
CREATE USER 'manager'@'%' IDENTIFIED BY '1234' ;
GRANT ALL ON *.* TO 'manager'@'%' WITH GRANT OPTION ; 

#p.206
SELECT user() ;

#p.210
CREATE VIEW V1_고학년학생(학생이름, 나이, 성, 학년)
AS SELECT 이름, 나이, 성별, 학년
    FROM 학생
    WHERE 학년 >= 3 AND 학년 <= 4

SELECT *
FROM V1_고학년학생 ;      -- V1_고학년학생 뷰의 데이터 확인

SHOW TABLES ;  
 
#p.211
DESC V1_고학년학생 ;   

CREATE VIEW V2_과목수강현황(과목번호, 강의실, 수강인원수)
AS SELECT 과목.과목번호, 강의실, COUNT(과목.과목번호) 
    FROM 과목 JOIN 수강 ON 과목.과목번호 = 수강.과목번호
    GROUP BY 과목.과목번호 ;

SELECT * FROM V2_과목수강현황 ;

#p.212
CREATE VIEW V3_고학년여학생
AS SELECT *
    FROM V1_고학년학생
    WHERE 성 = '여' 

SELECT * FROM V3_고학년여학생 ;

SELECT *
FROM V1_고학년학생
WHERE 성 = '여' ;

SELECT *
FROM V3_고학년여학생

SELECT 이름 AS '학생이름', 나이, 성별 AS '성', 학년
FROM 학생
WHERE 학년 >= 3 AND 학년 <= 4 AND 성별 = '여' ;

#p.213
SELECT *  
FROM V2_과목수강현황
WHERE 수강인원수 = ( SELECT MAX(수강인원수) FROM V2_과목수강현황 ) OR 
        수강인원수 = ( SELECT MIN(수강인원수) FROM V2_과목수강현황 ) ;

#p.214
DROP VIEW V1_고학년학생 ;

SHOW TABLES ;  

#p.217
CREATE INDEX idx_수강
  ON 수강 (학번,과목번호) ;

SHOW INDEX FROM 수강 ;

#p.218
CREATE UNIQUE INDEX idx_과목
  ON 과목 (이름 ASC) ;

#p.219
DROP INDEX idx_수강 ON 수강 ; 
ALTER TABLE 과목 DROP INDEX idx_과목 ;
