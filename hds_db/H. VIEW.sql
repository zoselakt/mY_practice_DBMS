-- VIEW
--������ ���̺��� �״�� ����ä �ʿ��� �÷��� �� ���ο� �÷��� ���� ���� ���̺�.
--���� �����Ͱ� ����Ǵ� ���� �ƴ����� VIEW�� ���ؼ� �����͸� ������ �� �ִ�.

--������: �ٸ� ������ �������� ���ϵ��� ����
--����: �� ������(���ǽ�)�� �F�� ��밡��
--���ȼ�: �F�� ����� ������ ������ ������ ������ �ʴ´�.

CREATE VIEW PLAYER_AGE
AS(SELECT ROUND((SYSDATE - BIRTH_DATE) / 365) AGE, P.* FROM PLAYER P);

SELECT * FROM PLAYER_AGE;
DROP VIEW PLAYER_AGE;

--30���� �Ѵ� ���� �˻�
SELECT * FROM PLAYER_AGE WHERE AGE > 30;