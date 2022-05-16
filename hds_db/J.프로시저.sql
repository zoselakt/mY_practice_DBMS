/*
--저장 프로시저 (Stored Procedure)
--쿼리문을 마치 하나의 메서드 형식으로 만들고 어떠한 동작을 일괄적으로 처리하는 용도로 사용됩니다.
--여러 개의 칼럼을 조회하고 여러 개의 테이블을 조인하고 거기에 조건까지 넣어줌으로써 하나의 쿼리를 만드는데
--엄청나게 긴 쿼리문이 생기게 된다.
--이를 프로시저에 저장하고 저장된 프로시저를 호출하여 프로그래밍을 하는것이 훨씬 효율적이다.

--장점
--1. 하나의 요청으로 여러 SQL문을 실행 할 수 있습니다.
--2. 네트워크 소요 시간을 줄일 수 있습니다. (네트워크 성능개선)
--3. 개발 업무를 구분해 개발 할 수 있습니다.
--- DBMS 개발하는 조직에서는 데이터베이스 관련 처리하는 SP를 만들어 API처럼 제공하고 
--애플리케이션 개발자는 SP를 호출해서 사용하는 형식으로 역할을 구분하여 개발이 가능합니다.

--단점
--1. 처리 성능이 낮다.
--  - 문자나 숫자 연산에 저장 프로시저를 사용한다면 오히려 C나 JAVA보다 느리다.
--2. 디버깅이 어렵다.
--3. DB 확장이 매우 힘들다.
--- 서비스 확장을 위해 서버수를 늘릴경우 DB 수를 늘리는 것보다 WAS의 수를 늘리는 것이 더 효율적이기 때문에 대부분의 개발에서 DB에는 
--최소의 부담만 주고 대부분의 로직은 WAS에서 처리할 수 있게 합니다.

--선언
--CREATE PROCEDURE 프로시저_명 ( 파라미터_명 MODE 데이터_타입 ) 
--IS 변수 선언 
--CREATE OR REPLACE PROCEDURE 프로시저_명 ( 파라미터_명 MODE 데이터_타입 ) 
--AS 변수 선언

--MODE
--1. IN(프로시저로 값 전달)
--2. OUT(프로시저에서 처리된 결과)
--3. INOUT(IN과 OUT의 두 가지 기능을 모두 수행)

--IS/AS 
--- PL/SQL 의 블록을 시작 / IS 또는 AS 를 작성
--호출
--EXECUTE 프로시저_명(파라미터_명1, 파라미터_명2, ...);
*/

BEGIN
	DBMS_OUTPUT.PUT_LINE('HELLO');
END;

CREATE OR REPLACE PROCEDURE F //프로시저 생성
(
	X NUMBER  //파라미터
)
IS     //내부에서 사용할 변수
BEGIN  // 프로시저 시작
	DBMS_OUTPUT.ENABLE;	
	DBMS_OUTPUT.PUT_LINE(2*X+1);
END;  //프로시저 종료

CALL F(2); -- 출력: 5

-----------------------------------------------------
--JOBS 테이블에 INSERT해주는 함수 만들기
SELECT * FROM JOBS;

CREATE OR REPLACE PROCEDURE MY_NEW_JOB_PROC
(
	P_JOB_ID IN JOBS.JOB_ID%TYPE,
	P_JOB_TITLE IN JOBS.JOB_TITLE%TYPE,
	P_MIN_SALARY IN JOBS.MIN_SALARY%TYPE,
	P_MAN_SALARY IN JOBS.MAN_SALARY%TYPE
)
IS
BEGIN
	INSERT INTO JOBS(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
	VALUES(P_JOB_ID, P_JOB_TITLE, P_MIN_SALARY, P_MAN_SALARY);
	DBMS_OUTPUT.ENABLE;
	DBMS_OUTPUT.PUT_LINE('ALL DONE ABOUT' ||' '||P_JOB_ID);
END;

CALL MY_NEW_JOB_PROC('IT', 'Developer', 14000, 20000);

------------------------------------------
--PL/SQL문
--점수에 맞는 학점 출력하기  = 같다 :=대입한다.
DECLARE 
	SCORE NUMBER := 80;
	GRADE VARCHAR2(5);
BEGIN
	IF SCORE >= 90 THEN GRADE := 'A';
	ELSIF SCORE >= 80 THEN GRADE := 'B';
	ELSIF SCORE >= 70 THEN GRADE := 'C';
	ELSIF SCORE >= 60 THEN GRADE := 'D';
	ELSE GRADE := 'F';
	END IF;
	DBMS_OUTPUT.ENABLE;
	DBMS_OUTPUT.PUT_LINE('당신의 점수: '||SCORE||'점'||'학점:'||GRADE);
END;
