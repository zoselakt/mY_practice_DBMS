/*
1. �䱸�м�
- �����̺�� ȭ�� ���̺� 2���� �ʿ��ϰ� ���� �����Ҷ� ȭ�е� ���� �����Ѵ�.
- ���� �̸��� ����,������ �ְ�, ȭ���� ��ǰ��ȣ, ����, ���, ���̸��� �ִ�.

2.������ ����(���� �𵨸�)
	��		ȭ��
-----------------------------------------------
	�̸�		��ǰ��ȣ
-----------------------------------------------
	����		����
	����		���
			���̸�

3. ���� ����(���𵨸�)
	��		ȭ��
-----------------------------------------------
	�̸�(PK)		��ǰ��ȣ(PK)
-----------------------------------------------
	����		����
	����		���
			���̸�(FK)

4. ������ ����(���� �𵨸�)
	FLOWER	
------------------------------------------
	FLOWER_NAME : VARCHAR2(200),
	COLOR: VARCHAR2(100),
	PRICE: NUMBER
-----------------------------------------------------------
	CONSTRAINT PRIMARY KEY(FLOWER_NAME)
------------------------------------------------------------

	POT
------------------------------------------------------------
	POT_ID: VARCHAR2(200),
	POT_COLOR: VARCHAR2(100),
	POT_SHAPE: VARCHAR2(100),
	FLOWER_NAME : VARCHAR2(200)
-----------------------------------------------------------
	CONSTRAINT FOREIGN KEY(FLOWER_NAME) REFERENCES FLOWER(NAME)

5. ���� (DBEAVER)
*/
DROP TABLE FLOWER;

CREATE TABLE FLOWER(
	FLOWERNAME VARCHAR2(200),
	FLOWERCOLOR VARCHAR2(100),
	FLOWERPRICE NUMBER,
	CONSTRAINT FLOWER_PK PRIMARY KEY(FLOWERNAME)
);

SELECT * FROM FLOWER;

CREATE TABLE POT(
	POTID VARCHAR2(100),
	POTCOLOR VARCHAR2(100),
	POTSHAPE VARCHAR2(200),
	NAME VARCHAR2(200),
	CONSTRAINT POT_PK PRIMARY KEY(POTID),
	CONSTRAINT POT_FK FOREIGN KEY(NAME) REFERENCES FLOWER(FLOWERNAME)
);

SELECT * FROM POT;