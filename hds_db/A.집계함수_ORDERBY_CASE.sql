-- �����Լ�: �������� ���� �ϳ��� ������ �����Ͽ� ��Ÿ����.
-- WHERE�������� ����� �� ����. / NULL�� �������� �ʴ´�.
-- AVG(): ��� / MAX(): �ִ밪 / MIN(): �ּҰ� / SUM(): �� �� /COUNT(): ����

SELECT AVG(HEIGHT), MAX(HEIGHT), MIN(HEIGHT), SUM(HEIGHT), COINT(HEIGHT) FROM PLAYER;

--PLAYER ���̺��� HEIGHT�����˻�(NULL �����ؼ� COUNT�˻�)
SELECT COUNT (HEIGHT) FROM PLAYER; --NULL�������� �ʰ� �˻�
SELECT * FROM PLAYER;

SELECT COUNT (NVL(HEIGHT, 0)) FROM PLAYER; -- NULL�� �����ϰ� �˻�
-------------------------------------------------------------------------------
--ORDER BY (����)
-- ASC: ��������
-- DESC: ��������

SELECT * FROM PLAYER ORDER BY HEIGHT; --�⺻������ ��������
SELECT * FROM PLAYER ORDER BY HEIGHT DESC; --��������
SELECT * FROM PLAYER ORDER BY 12 DESC; --12��° �÷��� ������������ ����

-- PLAYER ���̺��� Ű ��, ������ ��(��������)���� �˻� / NULL�� �ƴѰ��� �˻� / ù��° �÷� ���� ������ �ι�° ������ �Ѵ�.
SELECT PLAYER_NAME, HEIGHT, WEIGHT FROM PLAYER WHERE HEIGHT IS NOT NULL AND WEIGHT IS NOT NULL ORDER BY 2, 3;
-------------------------------------------------------------------------------
-- CASE��
-- CASE WHEN:
-- CASE THEN:
-- CASE ELSE:
-- CASE END:
-- CASE WHEN ���ǽ� THEN '�� ��' ELSE '���� ��' END

-- EMP ���̺��� SAL 3000�̻��̸� HIGH 1000�̻��̸� MID, �� �ƴϸ� LOW
SELECT * FROM EMP;
SELECT ENAME �����, SAL �޿�,
	CASE 
		WHEN SAL >= 3000 THEN 'HIGH'
		WHEN SAL >= 1000 THEN 'MID'
		ELSE 'LOW'
	END
FROM EMP;

--STADIUM ���̺��� SEAT_COUNT�� 0 �̻� 30000���ϸ� 'S' 30001�̻� 50000���ϸ� 'M' �� �ƴϸ� 'L'
--��ø���̽���
SELECT STADIUM_NAME �����, SEAT_COUNT �¼���, 
	CASE
		WHEN SEAT_COUNT BETWEEN 0 AND 30000 THEN 'S'
		ELSE
			(
			CASE 
				WHEN SEAT_COUNT BETWEEN 30001 AND 50000 THEN 'M'
				ELSE 'L'
				END
			)
		END
FROM STADIUM;		
		
--PLAYER ���̺��� WEIGHT�� 50�̻� 70���ϸ� 'L'
--71�̻� 80���ϸ� 'M' NULL�̸� '�̵��' �� �ƴϸ� 'H'
SELECT PLAYER_NAME �����̸�, WEIGHT || 'kg' ������,
	CASE
		WHEN WEIGHT BETWEEN 50 AND 70 THEN 'L'
		WHEN WEIGHT BETWEEN 71 AND 80 THEN 'M'
		ELSE
		(
		CASE WHEN WEIGHT IS NULL THEN '�̵��'
		ELSE 'H'
		END
		)
	END ü��
FROM PLAYER;

