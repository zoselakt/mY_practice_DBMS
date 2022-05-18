CREATE OR REPLACE PROCEDURE GET_GRADE
(
	SCORE NUMBER 
)
IS
	GRADE VARCHAR2(5); 
BEGIN
	IF SCORE >= 90 THEN GRADE := 'A';
	ELSIF SCORE >= 80 THEN GRADE := 'B';
	ELSIF SCORE >= 70 THEN GRADE := 'C';
	ELSIF SCORE >= 60 THEN GRADE := 'D';
	ELSE GRADE := 'F';
	END IF;
	DBMS_OUTPUT.ENABLE;
	DBMS_OUTPUT.PUT_LINE('´ç½ÅÀÇ Á¡¼ö: '||SCORE||'Á¡'||CHR(10)||'ÇÐÁ¡: '||GRADE)
END;

CALL GET_GRADE(80);
CALL GET_GRADE(100);
-----------------------------------------------------------------------------
SELECT * FROM JOBS;
CALL MY_NEW_JOB_PROC('IT', 'Developer', 5000, 20000);

CREATE OR REPLACE PROCEDURE HR.DEL_JOB_PROC
(
	P_JOB_ID IN JOBS.JOB_ID%TYPE
)
IS
	CNT NUMBER := 0;
BEGIN
	SELECT COUNT(JOB_ID) INTO CNT
	FROM JOBS WHERE JOB_ID = P_JOB_ID;
	IF CNT != 0 THEN
		DELETE FROM JOBS
		WHERE JOB_ID = P_JOB_ID;
		DBMS_OUTPUT.ENABLE;
		DBMS_OUTPUT.PUT_LINE('DELETE ALL DONE ABOUT '||' '||P_JOB_ID);
	ELSE
		DBMS_OUTPUT.ENABLE;
		DBMS_OUTPUT.PUT_LINE('NOT EXIST '||' '||P_JOB_ID);
	END IF;
END;
	CALL DEL_JOB_PROC('IT');
----------------------------------------------------------------------------------------------
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
