SELECT * FROM STADIUM;
SELECT * FROM TEAM;

SELECT S.ADDRESS AS "주소", T.TEAM_ID AS "팀 아이디" FROM STADIUM S, TEAM T;

--CONCATENATION(연결): ( ||로 사용 ) 
--누구의 별명은 ~~이다. 
SELECT PLAYER_NAME ||'의 별명은' || NICKNAME || '이다.' FROM PLAYER;

SELECT E_PLAYER_NAME ||'의 포지션은' || "POSITION" || '이다.' AS 자기소개 FROM PLAYER;

--LIKE: 포함된 문자열의 값을 찾음, 문자의 갯수도 제한을 줄수 있음.
-- %: 모든 것.
-- 'A%' : A로 시작하는 모든 값 (시작자리가 A)
-- '%A' : A로 끝나는 모든 값 (끝자리가 A)
-- '%A%' : A를 포함하는 문자 모든 값
-- 'A_' : A로 시작하면서 두자리인 값
-- 'A__' : A로 시작하면서 세자리인 값
-- '_A': A로 끝나면서 두자리인값
-- '__A': A로 끝나면서 세자리인값

SELECT * FROM TEAM WHERE TEAM_NAME LIKE '%천마';
SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '김%';
SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '쿠_';
SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '김__';
SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '_키';

-- 김씨 이씨 찾기
SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '김%' OR PLAYER_NAME LIKE '이%';

--이씨가 아닌 사람 찾기
SELECT * FROM PLAYER WHERE NOT PLAYER_NAME LIKE  '이%'; -- 표준 사용
SELECT * FROM PLAYER WHERE PLAYER_NAME NOT LIKE  '이%';

--PLAYER테이블에서 세자리 김씨가 아닌 사람 찾기
SELECT * FROM PLAYER WHERE NOT PLAYER_NAME LIKE '김__';
