/*CH03 예제*/

SELECT CHAR_LENGTH('HELLO'), LENGTH('HELLO'), CHAR_LENGTH('안녕'), LENGTH('안녕');

SELECT CONCAT('DREAMS', 'COME', 'TRUE'), CONCAT_WS('-', '2023', '01', '29');

/*예제3-3*/
SELECT LEFT('SQL 완전정복', 3), RIGHT('SQL 완전정복', 4), SUBSTR('SQL 완전정복', 2, 5), SUBSTR('SQL 완전정복', 2);

SELECT SUBSTRING_INDEX('서울시 동작구 흑석로', ' ', 2), SUBSTRING_INDEX('서울시 동작구 흑석로', ' ', -2);

SELECT LPAD('SQL', 10, '#'), RPAD('SQL', 5, '*'), LPAD('한글', 10, '#'), RPAD('한글', 5, '*');

### LENGTH(LTRIM(' SQL '))은 왼쪽 공백을 제거한 후, 문자열 'SQL '의 길이 4를 반환.
### LENGTH(RTRIM(' SSSQL '))은 오른쪽 공백을 제거한 후, 문자열 ' SSSQL'의 길이 6을 반환.
### LENGTH(TRIM(' SSSQL '))은 양쪽 공백을 모두 제거한 후, 문자열 'SSSQL'의 길이 5를 반환.

SELECT LENGTH(LTRIM(' SQL '))
	  ,LENGTH(RTRIM(' SSSQL '))
      ,LENGTH(TRIM(' SSSQL '));
      
 /*예제3-7*/     
SELECT TRIM(BOTH 'abc' FROM 'abcSQLabcabc')     -- 양쪽에서 'abc' 제거 -> 결과: 'SQL'
     ,TRIM(LEADING 'abc' FROM 'abcSQLabcabc')   -- 왼쪽에서만 'abc' 제거 -> 결과: 'SQLabcabc'
     ,TRIM(TRAILING 'abc' FROM 'abcSQLabcabc'); -- 오른쪽에서만 'abc' 제거 -> 결과: 'abcSQL'

/*예제3-8*/
SELECT FIELD('JAVA', 'SQL', 'JAVA', 'C') -- 'JAVA'의 위치 반환 (2)
      ,FIND_IN_SET('JAVA', 'SQL,JAVA,C') -- 'JAVA'의 위치 반환 (2)
      ,INSTR('네 인생을 살아라', '인생') -- '인생'의 시작 위치 반환 (3)
      ,LOCATE('인생', '네 인생을 살아라'); -- '인생'의 시작 위치 반환 (3)
      
      
