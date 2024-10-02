SELECT * FROM 고객;

SELECT 고객번호, 담당자명, 고객회사명, 마일리지 AS 포인트 ,마일리지 * 1.1 AS "10%인상된 마일리지" FROM 고객;

SELECT 고객번호, 담당자명, 마일리지 FROM 고객 WHERE 마일리지 >= 100000;

SELECT 고객번호, 담당자명, 도시, 마일리지 AS 포인트 FROM 고객 WHERE 도시 = '서울특별시' ORDER BY 마일리지 DESC;

SELECT * FROM 고객 ORDER BY 마일리지 DESC LIMIT 3;

SELECT DISTINCT 도시 FROM 고객;

SELECT 23 + 5 AS 더하기
      ,23 - 5 AS 뺴기
      ,23 * 5 AS 곱하기;

SELECT 23 >= 5
      ,23 <= 5;
      
SELECT * FROM 고객 WHERE 담당자직위 <> '대표 이사';


### UNION 각 SELECT 문에서 컬럼의 갯수는 동일해야한다. SELECT문에서 같은 위치에 존재하는 데이터 타입이 동일하거나 상호 호환 가능해야한다. ###

SELECT * FROM 고객 WHERE 지역 IS NULL OR 지역 = '';

SELECT 고객번호, 담당자명, 담당자직위 FROM 고객 WHERE  담당자직위 IN ('영업 과장', '마케팅 과장');

SELECT * FROM 고객 WHERE 도시 LIKE '%광역시' AND (고객번호 LIKE '_C%' OR 고객번호 LIKE '__C%');

########   함수: 단일 행 함수   ########



