#p.231
SELECT ABS(+17), ABS(-17), CEIL(3.28), FLOOR(4.259) ;

SELECT 학번, SUM(기말성적)/COUNT(*), ROUND(SUM(기말성적)/COUNT(*), 2)
FROM 수강
GROUP BY 학번

SELECT LENGTH(소속학과), RIGHT(학번,2), REPEAT('*',나이), CONCAT(소속학과,'학과')
FROM 학생 ;

#p.232
SELECT SUBSTRING(주소,1,2), REPLACE(SUBSTRING(휴대폰번호,5,9),'-',',')
FROM 학생 ;

SELECT 신청날짜, LAST_DAY(신청날짜)
FROM 수강 
WHERE YEAR(신청날짜) = '2019' ;

#p.233
SELECT SYSDATE( ), DATEDIFF(신청날짜,'2019-01-01')
FROM 수강 ;

SELECT 신청날짜, DATE_FORMAT(신청날짜,'%b/%d/%y'), DATE_FORMAT(신청날짜,'%Y년%c월%e일')
FROM 수강 ;

#p.236
  DELIMITER //
  CREATE PROCEDURE InsertOrUpdateCourse (
    IN CourseNo    VARCHAR(4),
    IN CourseName  VARCHAR(20),
    IN CourseRoom  CHAR(3),
    IN CourseDept  VARCHAR(20),
    IN CourseCredit  INT)  
  BEGIN
    DECLARE Count INT;
    SELECT COUNT(*) INTO Count FROM 과목 WHERE 과목번호 = CourseNo  ;
    IF (Count = 0) THEN
       INSERT INTO 과목(과목번호, 이름, 강의실, 개설학과, 시수)
       VALUES(CourseNo, CourseName, CourseRoom, CourseDept, CourseCredit) ;
     ELSE
       UPDATE 과목 
       SET 이름 = CourseName, 강의실 = CourseRoom, 개설학과 = CourseDept, 시수 = CourseCredit
       WHERE 과목번호 = CourseNo ;
     END IF ;
   END  //
 DELIMITER ;


#p.237
 -- 행 삽입 예
 CALL InsertOrUpdateCourse('c006', '연극학개론', '310', '교양학부', 2) ; 
 SELECT * FROM 과목 ;

#p.238
-- 행 수정 예
 CALL InsertOrUpdateCourse('c006', '연극학개론', '410', '교양학부', 2) ;
 SELECT * FROM 과목 ;

#p.239
DELIMITER //
CREATE PROCEDURE SelectAverageOfBestScore (
   IN Score INT,
   OUT Count INT)
BEGIN
   DECLARE NoMoreData INT DEFAULT FALSE;
   DECLARE Midterm INT ;
   DECLARE Final INT ;
   DECLARE Best INT ;
   DECLARE ScoreListCursor CURSOR FOR 
         SELECT 중간성적, 기말성적 FROM 수강 ;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET NoMoreData = TRUE ;
	 SET Count = 0;
   OPEN ScoreListCursor ;
   REPEAT
       FETCH ScoreListCursor INTO Midterm, Final ;
         IF Midterm > Final THEN
            SET Best = Midterm ;
         ELSE
            SET BEST = Final ;
         END IF ;
         IF (Best >= Score) THEN
            SET Count = Count + 1 ;
         END IF ;
       UNTIL NoMoreData END REPEAT ;
       CLOSE ScoreListCursor ;
END ;
//
DELIMITER ;


#p.240
-- 행 검색 예
CALL SelectAverageOfBestScore(95, @Count) ;
SELECT @Count  ;


#p.241
SHOW CREATE PROCEDURE InsertOrUpdateCourse ;

DROP PROCEDURE InsertOrUpdateCourse ;

#p.243
 CREATE TABLE 남녀학생총수 
  ( 성별 CHAR(1) NOT NULL DEFAULT 0,
    인원수 INT NOT NULL DEFAULT 0,
    PRIMARY KEY (성별) ) ;
 INSERT INTO 남녀학생총수  SELECT '남', COUNT(*) FROM 학생 WHERE 성별 = '남' ;
 INSERT INTO 남녀학생총수  SELECT '여', COUNT(*) FROM 학생 WHERE 성별 = '여' ;
 SELECT * FROM 남녀학생총수 ;

 DELIMITER //
 CREATE TRIGGER AfterInsertStu
 AFTER INSERT ON 학생 FOR EACH ROW
   BEGIN
     IF ( NEW.성별 = '남' ) THEN
        UPDATE 남녀학생총수 SET 인원수 = 인원수 + 1 WHERE 성별 = '남' ;
     ELSEIF ( NEW.성별 = '여' ) THEN
        UPDATE 남녀학생총수 SET 인원수 = 인원수 + 1 WHERE 성별 = '여' ;
     END IF ;
   END ;
   //
 DELIMITER  ;

#p.245
 INSERT INTO 학생 
 VALUES ('s008', '최동석', '경기 수원', 2, 26, '남', '010-8888-6666',  '컴퓨터') ;

 SELECT * FROM 학생 ;
 SELECT * FROM 남녀학생총수 ;

#p.246
SHOW TRIGGERS ;

DROP TRIGGER AfterInsertStu ;

#p.247
   DELIMITER //
   CREATE FUNCTION Fn_Grade( grade CHAR(1) )
   RETURNS VARCHAR(10)
   BEGIN
     DECLARE ret_grade VARCHAR(10) ;
     IF ( grade = 'A' ) THEN
       SET ret_grade = '최우수' ;
     ELSEIF ( grade = 'B' ) THEN
       SET ret_grade = '우수' ;
     ELSEIF ( grade = 'C' ) THEN
       SET ret_grade = '보통' ;
     ELSEIF ( grade = 'D' OR grade = 'F' ) THEN
       SET ret_grade = '미흡' ;   
     END IF ;
     RETURN ret_grade ;
   END 
   //
   DELIMITER ;

#p.248
SELECT 학번, 과목번호, 평가학점, Fn_Grade(평가학점) AS '평가 등급' FROM 수강 ;

#p.249
SHOW CREATE FUNCTION Fn_Grade ;

DROP FUNCTION Fn_Grade ;

#p.255
 START TRANSACTION ;
   DELETE FROM 학생 WHERE 성별 = '남' ;
   SELECT * FROM 학생 ;
 ROLLBACK ;
 SELECT * FROM 학생 ;

#p.257
 SELECT @@AUTOCOMMIT ; 
 SET AUTOCOMMIT=1 ;  

 INSERT INTO 과목 VALUES ('c007', '영어회화', '333', '교양학부', 3) ;
 SELECT * FROM 과목 ;
 ROLLBACK ;
 SELECT * FROM 과목 ;

#p.258
 SELECT @@AUTOCOMMIT ;   -- 자동커밋 현재 설정 상태 확인
 SET AUTOCOMMIT=0 ;      -- 수동완료 모드 설정(자동완료 모드 해제)

#p.259
 DELETE FROM 과목 WHERE 이름 = '연극학개론' ;
 SELECT * FROM 과목 ;
 INSERT INTO 과목 VALUES ('c008', '독서와토론', '111', '교양학부', 2) ;
 SELECT * FROM 과목 ;
 ROLLBACK ;
 SELECT * FROM 과목 ;
 SET AUTOCOMMIT=1 ;        -- 자동완료 모드 설정

#p.272
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;   -- 고립수준 0
SET TRANSACTION ISOLATION LEVEL READ COMMITTED ;     -- 고립수준 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ ;    -- 고립수준 2
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE ;       -- 고립수준 3

-- 트랜잭션 고립 수준 적용 준비 
USE univDB ;
CREATE TABLE 고객 SELECT 이름, 나이, 성별 FROM 학생 ;
SELECT * FROM 고객 ;

#p.273

-- < 사용자_1 >

SET SQL_SAFE_UPDATES = 0 ; -- 
USE univDB ;  -- ❶
SET TRANSACTION ISOLATION LEVEL READ COMMITTED ;  -- 고립수준 1 ❷

START TRANSACTION ;  -- ❸
SELECT * FROM 고객 ;  -- ❹
SELECT * FROM 고객 ;  -- 대기상태(이전 버전을 읽음) ⓫
UPDATE 고객 SET 나이 = 나이 + 100 ;  -- 대기상태 ⓬
SELECT * FROM 고객 ;  -- ⓮
ROLLBACK ;  -- ⓯

SELECT * FROM 고객 ;  -- ⓰

-- < 사용자_2 >

SET SQL_SAFE_UPDATES = 0 ; -- 
USE univDB ;  -- ❺
SET TRANSACTION ISOLATION LEVEL READ COMMITTED ;  -- 고립수준 1 ❻

START TRANSACTION ;  -- ❼
SELECT * FROM 고객 ;  -- ❽
UPDATE 고객 SET 나이 = 10 WHERE 성별 = '여' ;  -- ❾
SELECT * FROM 고객 ;  -- ❿
COMMIT ;  -- ⓭


