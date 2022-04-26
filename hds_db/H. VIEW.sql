-- VIEW
--기존의 테이블은 그대로 놔둔채 필요한 컬럼들 및 새로운 컬럼을 만든 가상 테이블.
--실제 데이터가 저장되는 것은 아니지만 VIEW를 통해서 데이터를 관리할 수 있다.

--독립성: 다른 곳에서 변경하지 못하도록 설정
--편리성: 긴 쿼리문(조건식)을 짦게 사용가능
--보안성: 짦게 만들기 때문에 기준의 쿼리는 보이지 않는다.

CREATE VIEW PLAYER_AGE
AS(SELECT ROUND((SYSDATE - BIRTH_DATE) / 365) AGE, P.* FROM PLAYER P);

SELECT * FROM PLAYER_AGE;
DROP VIEW PLAYER_AGE;

--30살이 넘는 선수 검색
SELECT * FROM PLAYER_AGE WHERE AGE > 30;