--EMPLOYEE 테이블에서 HIREDATE가 2003~2005년 까지인 사원 검색
--HIREDATE, FIRST_NAME, DEPARTMENT_NAME
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT * FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID AND 
HIRE_DATE BETWEEN TO_DATE('2003-01', 'YYYY-MM') AND TO_DATE('2006-01', 'YYYY-MM');

--내츄럴 조인(NATURAL JOIN)
--동일한 타입과 이름을 가진 컬럼을 조인 조건으로 이용하는 조인을 간단히 표현하는 방법이다.
--중복되는 컬럼이 생길 시 맨 앞으로 출력하며 중복 컬럼을 한 개만 출력한다. 컬럼이름 뿐만 아니라 타입이 모두 같아야 한다.

--반드시 두 테이블 간의 동일한 이름, 타입을 가진 컬럼이 필요하다.
--조인에 이용되는 컬럼은 명시하지 않아도 자동으로 조인에 사용된다.
--동일한 이름을 갖는 컬럼이 있지만 데이터 타입이 다르면 에러가 발생한다.
--조인하는 테이블 간의 동일 컬럼이 SELECT 절에 기술되도 테이블 이름을 생략해야 한다.

SELECT * FROM EMP E NATURAL JOIN DEPT D;

--네츄럴 조인 - USING절
--자연 조인에서 사용하는 테이블간에 동일한 이름과 형식의 컬럼이 둘 이상인 경우 자연 조인을 사용할 수 없다.
--이럴 경우 USING 절을 이용한 조인문을 이용하면 조인문을 구사할 수 있다.

--방법1
SELECT * FROM EMP INNER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;
--방법2
SELECT * FROM EMP INNER JOIN DEPT
USING(DEPTNO);

--외부조인(OUTER JOIN)
-- 두개의 테이블 중 조건이 거짓이라도 지정한 테이블의 모든 정보가 검색되어야 할 때 사용한다.
--조건에 맞지 않아도 해당하는 행을 출력하고 싶을 때 사용할 수 있습니다.

-- LEFT OUTER JOIN : JOIN 수행 시 왼쪽에 표기된 데이터를 기준으로 OUTER JOIN을 수행한다.
-- RIGHT OUTER JOIN : JOIN 수행 시 오른쪽에 표기된 데이터를 기준으로 OUTER JOIN을 수행한다.
-- FULL OUTER JOIN : 조인 수행 시 왼쪽, 오른쪽 테이블의 모든 데이터를 읽어 JOIN을 수행한다.

SELECT * FROM STADIUM;
SELECT * FROM TEAM;

--LEFT OUTER JOIN
SELECT * FROM STADIUM LEFT OUTER JOIN TEAM
ON HOMETEAM_ID = TEAM_ID;

--RIGHT OUTER JOIN
SELECT * FROM STADIUM RIGHT OUTER JOIN TEAM
ON HOMETEAM_ID = TEAM_ID;
--FULL OUTER JOIN
SELECT * FROM STADIUM FULL OUTER JOIN TEAM
ON HOMETEAM_ID = TEAM_ID;

--셀프조인(SELF JOIN)
--셀프 조인이란, 동일 데이블 사이의 조인을 말한다. 

--EMPLOYEE이라는 테이블에는 사원과 매니저 가 모두 하나의 사원 개념으로 동일시하여 같이 입력되어 있다. 
--이것을 이용해서 "자신과 상위, 차상위 관리자를 같은 줄에 표시하라"는 문제를 셀프 조인을 이용해서 풀 수 있다. 

SELECT E1.ENAME 사원, E2.ENAME 매니저 FROM EMP E1 JOIN EMP E2
ON E1.MGR = E2.EMPNO;
