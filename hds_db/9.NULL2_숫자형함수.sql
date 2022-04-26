SELECT * FROM TBL_CAR;

ALTER TABLE TBL_CAR MODIFY BRAND NOT NULL;

INSERT INTO TBL_CAR VALUES(001, '����', 'ȸ��', 35000);
INSERT INTO TBL_CAR VALUES(002, '�ƿ��', NULL, 35000);
--INSERT INTO TBL_CAR VALUES(002, NULL, 'ȸ��', 35000); / �����߻�

--PLAYER ���̺��� POSITION�� NULL�� �����˻�
SELECT * FROM PLAYER WHERE "POSITION" IS NULL;

--PLAYER ���̺��� POSITION�� NULL�̸� '����'���� ��� ����ϱ�
SELECT NVL ("POSITION", '����') FROM PLAYER WHERE "POSITION" IS NULL;
SELECT PLAYER_NAME "�����̸�", NVL("POSITION", '����') ������ FROM PLAYER;

SELECT PLAYER_NAME "�����̸�", NVL2("POSITION", 'Ȯ��', '����') AS ������ FROM PLAYER;

--PLAYER ���̺��� NATION�� NULL�� �ƴϸ� ���, NULL�̸� �̵������ ����
SELECT PLAYER_NAME "�����̸�", NVL2(NATION, '���', '�̵��') "������Ͽ���" FROM PLAYER;

--������ �Լ�(DUAL)
--���밪
SELECT ABS(-10)FROM DUAL;

--���� ����(1), ���� 0, ��������(-1)�Ǵ�
SELECT SIGN(-234), SIGN(0) SIGN(123) FROM DUAL;

--������(% ��ⷯ��)
SELECT MOD(10, 3) FROM DUAL;

--������ ū �ֱ��� ����
SELECT CEIL(3.14), CEIL(-3.14) FROM DUAL;

--������ ���� �ֱ��� ����
SELECT FLOOR(3.14), FLOOR(-3.14) FROM DUAL;

--�ݿø� (����Ÿ������ ��ȯ)
SELECT ROUND(3.55875987) FROM DUAL; -- ����Ÿ������ ���
SELECT ROUND(3.55875987 1) FROM DUAL; -- �Ҽ��� 1�ڸ����� ���

--����
SELECT TRUNC(3.9) FROM DUAL;

-- PLAYER TABLE���� Ű�� �Ҽ��� ��°�ڸ����� �ݿø�, �����Դ� �Ҽ��� ����
SELECT ROUND(HEIGHT,2) || 'cm' AS Ű, TRUNC(WEIGHT) || ������ FROM PLAYER;