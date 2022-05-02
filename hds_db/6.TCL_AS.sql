--DML 연습
--PLAYER 테이블 에서 TEAM_ID 가 'K01' 인 선수 이름을 내 이름으로 바꾸기
UPDATE PLAYER SET PLAYER_NAME = '한동석' WHERE TEAM_ID = 'K01';

SELECT * FROM PLAYER
WHERE TEAM_ID = 'K01';

--PLAYER 테이블에서 POSITION이 MF인 선수 삭제하기
DELETE FROM PLAYER WHERE "POSITION" = 'MF'; 

SELECT * FROM PLAYER WHERE "POSITION" = 'MF';

--PLAYER 테이블에서 HEIGHT가 180이상인 선수 삭제하기
DELETE FROM PLAYER WHERE HEIGHT >= 180;

SELECT * FROM PLAYER WHERE HEIGHT >= 180;
---------------------------------------------------------------------------------------------------------------
-- TCL
-- DCL(Data Control Language)에서 트랜잭션을 제어하는 명령인 COMMIT과 ROLLBACK만을 따로 분리해서 TCL이라고 표현하고 있습니다.

--AS(ALIAS) : 별칭
-- -SELECT절: AS 뒤에 별칭 작성, 한 칸 띄우고 작성 A B
-- -FROM절: 한칸 띄우고 작성
SELECT PLAYER_ID AS "선수 번호" FROM PLAYER; --공백이 있을시 쌍따옴표
SELECT PLAYER_ID "선수 번호" FROM PLAYER;
SELECT PLAYER_ID "선수 번호", PLAYER_NAME AS "선수 이름" FROM PLAYER;

--PLAYER테이블에서 BACK_NUM을 "등 번호"로, NICKNAME을 "선수 별명"으로 바꿔서 검색
SELECT BACK_NO AS "등 번호", NICKNAME "선수 별명" FROM PLAYER;

--FROM절
--SELECT TEAM_ID, TEAM_ID FROM PLAYER, TEAM; -- 오류
SELECT PLAYER.TEAM_ID, TEAM.TEAM_ID FROM PLAYER, TEAM; --잘쓰지않음.
SELECT P.TEAM_ID "선수 테이블", T.TEAM_ID FROM PLAYER P, TEAM T; --AS사용
