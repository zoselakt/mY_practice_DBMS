SELECT * FROM TBL_CAR;

ALTER TABLE TBL_CAR MODIFY BRAND NOT NULL;

INSERT INTO TBL_CAR VALUES(001, '벤츠', '회색', 35000);
INSERT INTO TBL_CAR VALUES(002, '아우디', NULL, 35000);
--INSERT INTO TBL_CAR VALUES(002, NULL, '회색', 35000); / 오류발생

--PLAYER 테이블에서 POSITION이 NULL인 선수검색
SELECT * FROM PLAYER WHERE "POSITION" IS NULL;

--PLAYER 테이블에서 POSITION이 NULL이면 '미정'으로 결과 출력하기
SELECT NVL ("POSITION", '미정') FROM PLAYER WHERE "POSITION" IS NULL;
SELECT PLAYER_NAME "선수이름", NVL("POSITION", '미정') 포지션 FROM PLAYER;

SELECT PLAYER_NAME "선수이름", NVL2("POSITION", '확정', '미정') AS 포지션 FROM PLAYER;

--PLAYER 테이블에서 NATION이 NULL이 아니면 등록, NULL이면 미등록으로 변경
SELECT PLAYER_NAME "선수이름", NVL2(NATION, '등록', '미등록') "국가등록여부" FROM PLAYER;

--숫자형 함수(DUAL)
--절대값
SELECT ABS(-10)FROM DUAL;

--양의 정수(1), 숫자 0, 음의정수(-1)판단
SELECT SIGN(-234), SIGN(0) SIGN(123) FROM DUAL;

--나머지(% 모듈러스)
SELECT MOD(10, 3) FROM DUAL;

--값보다 큰 최근접 정수
SELECT CEIL(3.14), CEIL(-3.14) FROM DUAL;

--값보다 작은 최근접 정수
SELECT FLOOR(3.14), FLOOR(-3.14) FROM DUAL;

--반올림 (정수타입으로 반환)
SELECT ROUND(3.55875987) FROM DUAL; -- 정수타입으로 출력
SELECT ROUND(3.55875987 1) FROM DUAL; -- 소수점 1자리까지 출력

--버림
SELECT TRUNC(3.9) FROM DUAL;

-- PLAYER TABLE에서 키는 소수점 둘째자리까지 반올림, 몸무게는 소수점 버림
SELECT ROUND(HEIGHT,2) || 'cm' AS 키, TRUNC(WEIGHT) || 몸무게 FROM PLAYER;