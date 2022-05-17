-- EMP테이블 사원번호로 DEPT 테이블의 지역 검색하기
SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT EMP.DEPTNO, EMP.ENAME, EMP.JOB, DEPT.LOC FROM EMP JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;

--PLAYER 테이블에서 송종국 선수가 속한 팀의 전화번호 검색하기
SELECT * FROM PLAYER;
SELECT * FROM TEAM;

SELECT P.TEAM_ID, P.PLAYER_NAME, T.TEL FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID AND P.PLAYER_NAME = '송종국';

--JOBS 테이블에서 JOB_ID로 EMPLOYEES의 JOB_TITLE, EMAIL, 성, 이름 검색
SELECT * FROM JOBS;
SELECT * FROM EMPLOYEES;

--등가조인(equi join)
-- - 일반적으로 가장많이 사용되는 방식으로 테이블을 연결한 후 출력 행을 각 테이블의 특정 열에 일치한 데이터를 기준으로 조인하는 방식.
--   테이블간의 공통 컬럼을 활용하여 각 테이블의 특정 컬럼에 일치한 데이터를 기준으로 연결하는 방법
--비등가조인(non-equi join) 
-- - 테이블간의 컬럼 값들이 정확하게 일치하지 않을 경우 사용하는 방법 / 조건이 여러개인 경우 AND사용가능

SELECT J.JOB_ID, J.JOB_TITLE, E.EMAIL, E.LAST_NAME ||' ' || E.FIRST_NAME
FROM JOBS J JOIN EMPLOYEES E
ON J.JOB_ID = E.JOB_ID; -- =있으면: 등가조인

--급여로 등급나누기
SELECT * FROM SALGRADE;
SELECT * FROM EMP;

SELECT * FROM 
SALGRADE S JOIN EMP E
ON E.SAL BETWEEN S.LOSAL AND S.HISAL; -- =없으면: 비등가조인

--방법1
--ON : JOIN 을 하기 전 필터링을 한다 
--     null 포함 된 대상에 대해 null이 아닌 대상으로 필터링 / ON 조건에 아닌 데이터도 조회한다
SELECT E.EMPNO, D.DNAME, E.ENAME, S.GRADE, E.SAL FROM
SALGRADE S JOIN EMP EMP
ON E.SAL BETWEEN S.LOSAL AND S.HISAL
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

--방법2
--WHERE : JOIN 을 한 후 필터링을 한다 (=JOIN을 한 결과에서 WHERE 조건절로 필터링이 이뤄진다)
--        필터링 후 outer join결과 null 출력 가능 / WHERE 조건에 해당하는 데이터를 추출
--        WHERE 절은 가져온 테이블에서 조건에 맞는 값을 가져오는 검색 조건으로 사용
SELECT E.EMPNO, D.DNAME, E.ENAME, S.GRADE, E.SAL FROM
SALGRADE S, EMP E, DEPT D
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.DEPTNO = D.DEPTNO;


--EMPLOYEE 테이블에서 HIREDATE가 2003~2005년 까지인 사원 검색
--HIREDATE, FIRST_NAME, DEPARTMENT_NAME
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT * FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID AND 
HIRE_DATE BETWEEN TO_DATE('2003-01', 'YYYY-MM') AND TO_DATE('2006-01', 'YYYY-MM');
