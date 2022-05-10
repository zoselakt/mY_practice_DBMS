/*
오라클 옵티마이저(Optimizer)에게 SQL문 실행을 위한 데이터를 스캐닝하는 경로, 조인하는 방법 등을 알려주기 위해 작성하는 것을 뜻한다.
오라클 서버가 업그레이드 되면서 Optimizer의 성능도 함께 향상되어 쿼리 실행시 최적의 방법으로 실행해준다. 
하지만 Optimizer가 항상 최적의 실행 경로를 만들어내는 것은 불가능하기 때문에 직접 실행경로를 작성해 주어야 하는 경우가 생긴다.
따라서 DBA는 느린 쿼리나 성능 튜닝을 위해 Optimizer가 적절한 인덱스를 타고 있는지 확인하는 절차가 필요하다
사용자가 특정 SQL 문장에서 어떤 인덱스가 선택도가 높은지 알고 있는 경우 Optimizer에 의존한 실행 계획보다 훨씬 효율적인 실행 계획을 구사할 수 있다.
Hint를 사용하면 액세스 경로, 조인 순서, 병렬 및 직렬 처리, Optimizer의 목표(Goal) 변경이 가능하다.
모든 Hint의 기본 사용법은 쿼리 서두에 힌트를 명시하는 것이다.
힌트, 인덱스, 조인 등의 개념을 명확히 알지 않은 상태에서 무분별한 힌트의 사용은 데이터베이스 전체 성능의 저하를 일으킬 수 있다. 
(힌트에 오타가 있는 경우에는 오라클 서버가 잘못 사용된 힌트로 판단하여 힌트절을 무시하고 힌트 없이 쿼리를 수행한다)
*/

SELECT * FROM PLAYER ORDER BY PLAYER_ID DESC;

SELECT I.INDEX_NAME FROM USER_IND_COLUMNS I
WHERE TABLE_NAME = 'PLAYER';

SELECT /*+ INDEX_DESC(PLAYER PLAYER_PK) */ * FROM PLAYER;
SELECT /*+ INDEX(PLAYER PLAYER_PK) */ * FROM PLAYER;
--/*D와 +를 붙여서 작성해야한다. /*+
