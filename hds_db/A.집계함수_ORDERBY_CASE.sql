-- 집계함수: 여러개의 값을 하나의 값으로 집계하여 나타낸다.
-- WHERE절에서는 사용할 수 없다. / NULL은 포함하지 않는다.
-- AVG(): 평균 / MAX(): 최대값 / MIN(): 최소값 / SUM(): 총 합 /COUNT(): 갯수

SELECT AVG(HEIGHT), MAX(HEIGHT), MIN(HEIGHT), SUM(HEIGHT), CONT(HEIGHT) FROM PLAYER;

--PLAYER 테이블에서 HEIGHT갯수검색(NULL 포함해서 COUNT검색)
SELECT COUNT (HEIGHT) FROM PLAYER; --NULL포함하지 않고 검색
SELECT * FROM PLAYER;

SELECT COUNT (NVL(HEIGHT, 0)) FROM PLAYER; -- NULL을 포함하고 검색
-------------------------------------------------------------------------------
--ORDER BY (정렬)
-- ASC: 오름차순
-- DESC: 내림차순

SELECT * FROM PLAYER ORDER BY HEIGHT; --기본적으로 오름차순
SELECT * FROM PLAYER ORDER BY HEIGHT DESC; --내림차순
SELECT * FROM PLAYER ORDER BY 12 DESC; --12번째 컬럼을 내림차순으로 정렬

-- PLAYER 테이블에서 키 순, 몸무게 순(오름차순)으로 검색 / NULL이 아닌값만 검색 / select한 컬럼2을 먼저 정렬후 컬럼3에 내용을 정렬
SELECT PLAYER_NAME, HEIGHT, WEIGHT FROM PLAYER WHERE HEIGHT IS NOT NULL AND WEIGHT IS NOT NULL ORDER BY 2, 3; --2번 주 정렬
-------------------------------------------------------------------------------
-- CASE문
-- CASE WHEN:
-- CASE THEN:
-- CASE ELSE:
-- CASE END:
-- CASE WHEN 조건식 THEN '참 값' ELSE '거짓 값' END
/*
WHEN - THEN은 항상 같이 사용 되어야 한다.
WHEN - THEN은 여러개 사용이 가능하다.
ELSE가 존재하면 모든 WHEN - THEN 조건이 TRUE(참)이 아닌 경우 ELSE의 결과값을 반환한다. 
ELSE가 없고, 조건이 TRUE(참)이 아니면 NULL을 반환한다.
*/
-- EMP 테이블에서 SAL 3000이상이면 HIGH 1000이상이면 MID, 다 아니면 LOW
SELECT * FROM EMP;
SELECT ENAME 사원명, SAL 급여,
	CASE 
		WHEN SAL >= 3000 THEN 'HIGH'
		WHEN SAL >= 1000 THEN 'MID'
		ELSE 'LOW'
	END
FROM EMP;

--STADIUM 테이블에서 SEAT_COUNT가 0 이상 30000이하면 'S' 30001이상 50000이하면 'M' 다 아니면 'L'
--중첩케이스문
SELECT STADIUM_NAME 경기장, SEAT_COUNT 좌석수, 
	CASE
		WHEN SEAT_COUNT BETWEEN 0 AND 30000 THEN 'S'
		ELSE
			(
			CASE 
				WHEN SEAT_COUNT BETWEEN 30001 AND 50000 THEN 'M'
				ELSE 'L'
				END
			)
		END
FROM STADIUM;		
		
--PLAYER 테이블에서 WEIGHT가 50이상 70이하면 'L'
--71이상 80이하면 'M' NULL이면 '미등록' 다 아니면 'H'
SELECT PLAYER_NAME 선수이름, WEIGHT || 'kg' 몸무게,
	CASE
		WHEN WEIGHT BETWEEN 50 AND 70 THEN 'L'
		WHEN WEIGHT BETWEEN 71 AND 80 THEN 'M'
		ELSE
		(
		CASE WHEN WEIGHT IS NULL THEN '미등록'
		ELSE 'H'
		END
		)
	END 체급
FROM PLAYER;

