USE univeDB;

#p.232
SELECT SUBSTRING(주소,1,2), REPLACE(SUBSTRING(휴대폰번호,5,9),'-',',')
FROM 학생 ;

SELECT 신청날짜, LAST_DAY(신청날짜)
FROM 수강 
WHERE YEAR(신청날짜) = '2019' ;

#p.233
SELECT SYSDATE( ), DATEDIFF(신청날짜,'2019-01-01') FROM 수강 ;

SELECT 신청날짜, DATE_FORMAT(신청날짜,'%b/%d/%y'), DATE_FORMAT(신청날짜,'%Y년%c월%e일') FROM 수강 ;

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
 
  CALL InsertOrUpdateCourse('c006', '연극학개론', '310', '교양학부', 2) ; 
 SELECT * FROM 과목 ;

  CALL InsertOrUpdateCourse('c006', '연극학개론', '410', '교양학부', 2) ;
  
  SELECT * FROM 과목 ;
  
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

CALL SelectAverageOfBestScore(95, @Count) ;
SELECT @Count ;

SHOW CREATE PROCEDURE InsertOrUpdateCourse ;

DROP PROCEDURE InsertOrUpdateCourse ;

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
 
 DROP TABLE 남녀학생총수;
DELETE FROM 학생 WHERE 학번 = 's008' AND 이름 = '최동석';

 INSERT INTO 학생 
 VALUES ('s008', '최동석', '경기 수원', 2, 26, '남', '010-8888-6666',  '컴퓨터') ;


 SELECT * FROM 학생 ;
 SELECT * FROM 남녀학생총수 ;
 
 SHOW TRIGGERS ;

DROP TRIGGER AfterInsertStu ;

   DELIMITER //
   CREATE FUNCTION Fn_Grade( grade CHAR(1) )
   RETURNS VARCHAR(10)
   DETERMINISTIC
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
   
   SELECT 학번, 과목번호, 평가학점, Fn_Grade(평가학점) AS '평가 등급' FROM 수강 ;

SHOW CREATE FUNCTION Fn_Grade ;
DROP FUNCTION Fn_Grade ;

 START TRANSACTION ;
   DELETE FROM 학생 WHERE 성별 = '남' ;
   SELECT * FROM 학생 ;
 ROLLBACK ;
 SELECT * FROM 학생 ;
 
 SELECT @@AUTOCOMMIT ; 
 
 
 SET AUTOCOMMIT = 1;
 
 INSERT INTO 과목 VALUES ('c007', '영어회화', '333', '교양학부', 3) ;
 SELECT * FROM 과목;
 
 