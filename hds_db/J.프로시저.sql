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
--CREATE PROCEDURE 프로시저_명 ( 파라미터1, 파라미터2 MODE 데이터_타입 ) 
--IS  (또는 AS)
--BEGIN
--END

--MODE
--1. IN(프로시저로 값 전달)
--2. OUT(프로시저에서 처리된 결과)
--3. INOUT(IN과 OUT의 두 가지 기능을 모두 수행)

--IS (AS) 
--- PL/SQL 의 블록을 시작 / IS 또는 AS 를 작성

--BEGIN
-- 쿼리문 또는 실행할 문장작성

--프로시저 호출
--EXECUTE 프로시저_명(파라미터_명1, 파라미터_명2, ...);
--CALL 프로시저명(파라미터) :
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

CALL F(2); -- 출력: 5ㄴ

-----------------------------------------------------
--JOBS 테이블에 INSERT해주는 함수 만들기
SELECT * FROM JOBS;

CREATE OR REPLACE PROCEDURE MY_NEW_JOB_PROC
(
	P_JOB_ID IN JOBS.JOB_ID%TYPE,
	P_JOB_TITLE IN JOBS.JOB_TITLE%TYPE,
	P_MIN_SALARY IN JOBS.MIN_SALARY%TYPE,
	P_MAN_SALARY IN JOBS.MAX_SALARY%TYPE
)
IS
BEGIN
	INSERT INTO JOBS(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
	VALUES(P_JOB_ID, P_JOB_TITLE, P_MIN_SALARY, P_MAX_SALARY);
	DBMS_OUTPUT.ENABLE;
	DBMS_OUTPUT.PUT_LINE('ALL DONE ABOUT' ||' '||P_JOB_ID);
END;

CALL MY_NEW_JOB_PROC('IT', 'Developer', 14000, 20000);

------------------------------------------
--PL/SQL문
--점수에 맞는 학점 출력하기  = 같다 :=대입한다.


PL/SQL이란?
- SQL문장에서 변수정의, 조건처리(IF), 반복처리(LOOP, WHILE, FOR)등을 지원하며,
  오라클 자체에 내장되어 있는 Procedure Language 이다.

PL/SQL로 작성할 수 있는 것은?
   ▪ SQL*Plus 스크립트(scripts)
   ▪ 프로시저(Procedure), 함수(Function) 서브프로그램
   ▪ 패키지(Package)
   ▪ 데이터베이스 트리거 (Database Trigger)
   ▪ 애플리케이션 로직 (Application Logic)

PL/SQL의 장점
- PL/SQL 문은 BLOCK 구조로 다수의 SQL 문을 한번에 ORACLE DB로 보내서 처리하므로 수행속도를 향상 시킬수 있다.
- PL/SQL 의 모든 요소는 하나 또는 두개이상의 블록으로 구성하여 모듈화가 가능하다.
- 보다 강력한 프로그램을 작성하기 위해서 큰 블록안에 소블럭을 위치시킬 수 있다.
- VARIABLE, CONSTANT, CURSOR, EXCEPTION을 정의하고, SQL문장과 Procedural 문장에서 사용 한다.
- 단순, 복잡한 데이터 형태의 변수를 선언 한다.
- 테이블의 데이터 구조와 컬럼명에 준하여 동적으로 변수를 선언 할 수 있다.
- EXCEPTION 처리 루틴을 이용하여 Oracle Server Error를 처리 한다.
- 사용자 정의 에러를 선언하고 EXCEPTION 처리 루틴으로 처리 가능 하다.

단점
1. 유지보수가 힘들다.
2. 대용량 처리가 많을 경우, DB에 부하를 줄 수 있다.
3. Git 같은 형상관리를 사용할 수 없다.

구조
선언부(Declarative Section) :PL/SQL에서 사용하는 모든 변수나 상수를 선언하는 부분으로서 DECLARE로 시작한다.
실행부(Executable Section)
- 절차적 형식으로 SQL문을 실행할 수 있도록 절차적 언어의 요소인 제어문, 반복문, 함수 정의 등 로직을 기술 할 수 있으는 부분으로 BEGIN으로 시작한다.
예외 처리부(Exception Handling Section)
- PL/SQL문이 실행되는 중에 에러가 발생할 수 있는데 이를 예외 사항이라고 한다. 이러한 예외사항이 발생했을 때 이를 해결하기 위한 문장으로 구성된다.
  
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
