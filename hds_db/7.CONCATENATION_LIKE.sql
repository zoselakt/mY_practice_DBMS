SELECT * FROM STADIUM;
SELECT * FROM TEAM;

SELECT S.ADDRESS AS "�ּ�", T.TEAM_ID AS "�� ���̵�" FROM STADIUM S, TEAM T;

--CONCATENATION(����): ( ||�� ��� ) 
--������ ������ ~~�̴�. 
SELECT PLAYER_NAME ||'�� ������' || NICKNAME || '�̴�.' FROM PLAYER;

SELECT E_PLAYER_NAME ||'�� ��������' || "POSITION" || '�̴�.' AS �ڱ�Ұ� FROM PLAYER;

--LIKE: ���Ե� ���ڿ��� ���� ã��, ������ ������ ������ �ټ� ����.
-- %: ��� ��.
-- 'A%' : A�� ������ ��� ��(FDSNJKA, EIWNF12A)
-- 'A_' : A�� �����鼭 ���ڸ��� ��(AA, 2A, PA)

SELECT * FROM TEAM WHERE TEAM_NAME LIKE '%õ��';
SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '��%';
SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '��_'; 
SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '��%'; 
SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '��_'; 

-- �达 �̾� ã��
SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '��%' OR PLAYER_NAME LIKE '��%';

--�̾��� �ƴ� ��� ã��
SELECT * FROM PLAYER WHERE NOT PLAYER_NAME LIKE  '��%'; -- ǥ�� ���
SELECT * FROM PLAYER WHERE PLAYER_NAME NOT LIKE  '��%';

--PLAYER���̺��� ���ڸ� �达�� �ƴ� ��� ã��
SELECT * FROM PLAYER WHERE NOT PLAYER_NAME LIKE '��__';
