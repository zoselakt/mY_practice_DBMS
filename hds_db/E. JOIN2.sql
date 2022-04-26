--EMPLOYEE ���̺��� HIREDATE�� 2003~2005�� ������ ��� �˻�
--HIREDATE, FIRST_NAME, DEPARTMENT_NAME
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT * FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID AND 
HIRE_DATE BETWEEN TO_DATE('2003-01', 'YYYY-MM') AND TO_DATE('2006-01', 'YYYY-MM');

--���� ����(NATURAL JOIN)
--������ Ÿ�԰� �̸��� ���� �÷��� ���� �������� �̿��ϴ� ������ ������ ǥ���ϴ� ����̴�.
--�ߺ��Ǵ� �÷��� ���� �� �� ������ ����ϸ� �ߺ� �÷��� �� ���� ����Ѵ�. �÷��̸� �Ӹ� �ƴ϶� Ÿ���� ��� ���ƾ� �Ѵ�.

--�ݵ�� �� ���̺� ���� ������ �̸�, Ÿ���� ���� �÷��� �ʿ��ϴ�.
--���ο� �̿�Ǵ� �÷��� ������� �ʾƵ� �ڵ����� ���ο� ���ȴ�.
--������ �̸��� ���� �÷��� ������ ������ Ÿ���� �ٸ��� ������ �߻��Ѵ�.
--�����ϴ� ���̺� ���� ���� �÷��� SELECT ���� ����ǵ� ���̺� �̸��� �����ؾ� �Ѵ�.

SELECT * FROM EMP E NATURAL JOIN DEPT D;

--���� ���� - USING��
--�ڿ� ���ο��� ����ϴ� ���̺��� ������ �̸��� ������ �÷��� �� �̻��� ��� �ڿ� ������ ����� �� ����.
--�̷� ��� USING ���� �̿��� ���ι��� �̿��ϸ� ���ι��� ������ �� �ִ�.

--���1
SELECT * FROM EMP INNER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;
--���2
SELECT * FROM EMP INNER JOIN DEPT
USING(DEPTNO);

--�ܺ�����(OUTER JOIN)
-- �ΰ��� ���̺� �� ������ �����̶� ������ ���̺��� ��� ������ �˻��Ǿ�� �� �� ����Ѵ�.
--���ǿ� ���� �ʾƵ� �ش��ϴ� ���� ����ϰ� ���� �� ����� �� �ֽ��ϴ�.

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

--��������(SELF JOIN)
--���� �����̶�, ���� ���̺� ������ ������ ���Ѵ�. 

--EMPLOYEE�̶�� ���̺��� ����� �Ŵ��� �� ��� �ϳ��� ��� �������� ���Ͻ��Ͽ� ���� �ԷµǾ� �ִ�. 
--�̰��� �̿��ؼ� "�ڽŰ� ����, ������ �����ڸ� ���� �ٿ� ǥ���϶�"�� ������ ���� ������ �̿��ؼ� Ǯ �� �ִ�. 

SELECT E1.ENAME ���, E2.ENAME �Ŵ��� FROM EMP E1 JOIN EMP E2
ON E1.MGR = E2.EMPNO;