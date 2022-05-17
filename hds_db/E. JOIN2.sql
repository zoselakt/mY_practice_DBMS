-- 조인의종류
-- 1. INNER JOIN(내부 조인) / 교집합
-- 두 테이블을 조인할 때, 두 테이블에 모두 지정한 열의 데이터가 있어야 한다.
      -- 동등 조인(EQUI JOIN) : 둘 이상의 테이블에 존재하는 공통 속성의 동등 비교만을 사용하며, 부등호 조인은 동등조인에 포함하지 않는다.
      -- 자연 조인(NATURAL JOIN) : 동등 조인과 거의 유사합니다. 단, 조인 대상 테이블의 모든 컬럼들을 비교하여, 같은 컬럼명을 가진 대상으로 조인을 수행 합니다. 그리고, 중복된 컬럼은 한번만 출력되게 합니다.
         --동일한 타입과 이름을 가진 컬럼을 조인 조건으로 이용하는 조인을 간단히 표현하는 방법이다.
         --중복되는 컬럼이 생길 시 맨 앞으로 출력하며 중복 컬럼을 한 개만 출력한다. 컬럼이름 뿐만 아니라 타입이 모두 같아야 한다.
           --반드시 두 테이블 간의 동일한 이름, 타입을 가진 컬럼이 필요하다.
           --조인에 이용되는 컬럼은 명시하지 않아도 자동으로 조인에 사용된다.
           --동일한 이름을 갖는 컬럼이 있지만 데이터 타입이 다르면 에러가 발생한다.
           --조인하는 테이블 간의 동일 컬럼이 SELECT 절에 기술되도 테이블 이름을 생략해야 한다.
      -- 셀프 조인(SELF JOIN) : 자가 조인이라고도 하며, 하나의 테이블의 데이터를 활용해 조인하는 기법입니다. 테이블 하나에 서로 다른 이름을 지정해 주어야 합니다. / 자신이 자신과 조인한다는 의미로, 1개의 테이블을 사용한다
         --동일 데이블 사이의 조인을 말한다. 이것을 이용해서 "자신과 상위, 차상위 관리자를 같은 줄에 표시하라"는 문제를 셀프 조인을 이용해서 풀 수 있다
      -- 교차 조인(CROSS JOIN) : 조인에 참여한 테이블들의 모든 데이터가 합쳐져서 출력됩니다. / 테이블의 모든 행과 다른 쪽 테이블의 모든 행을 조인하는 기능이다. 
         -- 모든 경우의 수를 전부 표현해주는 방식의 조인문이다. 기준테이블이 왼쪽일 경우 왼쪽의 데이터 한 Row를 오른쪽 테이블 전체와 JOIN하는 방식. 따라서 결과값의 개수도 N(왼쪽 테이블의 개수)*M(오른쪽 테이블의 개수)다.
      
-- 2. OUTER JOIN(외부 조인) / 합집합
-- 두 테이블을 조인할 때, 1개의 테이블에만 데이터가 있어도 결과가 나온다. /-- 두개의 테이블 중 조건이 거짓이라도 지정한 테이블의 모든 정보가 검색되어야 할 때 사용한다 
      -- 조건에 맞지 않아도 해당하는 행을 출력하고 싶을 때 사용할 수 있습니다.
      -- LEFT OUTER JOIN: 왼쪽 테이블의 모든 값이 출력되는 조인
      -- RIGHT OUTER JOIN: 오른쪽 테이블의 모든 값이 출력되는 조인
      -- FULL OUTER JOIN: 왼쪽 또는 오른쪽 테이블의 모든 값이 출력되는 조인


--내츄럴 조인(NATURAL JOIN)
SELECT * FROM EMP E NATURAL JOIN DEPT D;

--네츄럴 조인 - USING절
--자연 조인에서 사용하는 테이블간에 동일한 이름과 형식의 컬럼이 둘 이상인 경우 자연 조인을 사용할 수 없다.
--이럴 경우 USING 절을 이용한 조인문을 이용하면 조인문을 구사할 수 있다.

--셀프조인(SELF JOIN)

--EMPLOYEE이라는 테이블에는 사원과 매니저 가 모두 하나의 사원 개념으로 동일시하여 같이 입력되어 있다. 
--이것을 이용해서 "자신과 상위, 차상위 관리자를 같은 줄에 표시하라"는 문제를 셀프 조인을 이용해서 풀 수 있다. 

SELECT E1.ENAME 사원, E2.ENAME 매니저 FROM EMP E1 JOIN EMP E2
ON E1.MGR = E2.EMPNO;

-- 크로스 조인(CROSS JOIN)
-- 모든 경우의 수를 전부 표현해주는 방식의 조인문이다. 기준테이블이 왼쪽일 경우 왼쪽의 데이터 한 Row를 오른쪽 테이블 전체와 JOIN하는 방식. 따라서 결과값의 개수도 N(왼쪽 테이블의 개수)*M(오른쪽 테이블의 개수)다.

-- 기본 문법
--SELECT 테이블별칭.조회할컬럼, 테이블별칭.조회할컬럼
--FROM 기준테이블 별칭
--CROSS JOIN 조인테이블 별칭


--방법1
SELECT * FROM EMP INNER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;
--방법2
SELECT * FROM EMP INNER JOIN DEPT
USING(DEPTNO);

--외부조인(OUTER JOIN)
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
