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