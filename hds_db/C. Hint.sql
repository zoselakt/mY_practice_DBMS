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

1. OPTIMIZER_MODE 지정가능 값
/*+ ALL_ROWS */ : 전체 RESOURCE 소비를 최소화시키기 위한 힌트
/*+ FIRST_ROWS */ : 조건에 맞는 첫 번째 row를 리턴하기 위한 Resource 소비를 최소화시키기 위한 힌트
/*+ CHOOSE */ : 
/*+ RULE */ : Rule Based 접근 방식을 사용하도록 지정한다.

2. Access Methods - 접근 방법
/*+ FULL(table_name) */ : Table을 Full Scan 하길 원할 때 사용
/*+ HASH(table) */ : Hash scan을 선택하도록 지정
/*+ CLUSTER(table_name) */ : Cluster Scan을 선택하도록 지정. 따라서 Clustered Object만 적용
/*+ HASH_AJ */ : NOT IN SubQuery를 HASH Anti-join으로 변형
/*+ HASH_SJ */ : Correlated Exists Subquery를 Hash Semi-join으로 변형
/*+ INDEX(table_name index_name) */ : 지정된 index를 강제적으로 쓰게끔 지정
/*+ INDEX_COMBINE(table_name index_name) */ : Index 명이 주어지면 주어진 특정 Bitmap Index의 Boolean Combination의 사용
/*+ INDEX_ASC(table_name index_name) */ : 지정된 index를 오름차순으로 쓰게끔 지정(기본은 오름차순)
/*+ INDEX_DESC(table_name index_name) */ : 지정된 index를 내림차순으로 쓰게끔 지정
/*+ INDEX_FFS(table index) */ : Full table scan보다 빠른 Full index scan을 유도
/*+ ROWID(table) */ : Rowid로 Table Scan을 하도록 지정
/*+MERGE_AJ*/ : NOT IN Subquery를 Merge Anti-join으로 변형
/*+MERGE_SJ*/ : Correalted EXISTS Subquery를 Merge Semi-join으로 변형
/*+AND_EQUAL(Table Index1, Index 2...) */ : Single-Column Index의 Merge를 이용한 Access Path 선택. 적어도 두 개 이상의 Index가 지정되어야 한다. Max로 5개까지 지정 가능
/*+USE_CONCAT*/ : 조건절의 OR를 UNION ALL 형식으로 변형한다. 일반적으로 변형은 비용 측면에서 효율적일 때만 일어난다.

3. Join Orders
/*+ ORDERED */ : From절에 기술된 테이블 순서대로 join이 일어나도록 유도
/*+ STAR*/ : Star Query Plan이 사용 가능하다면 이를 이용하기 위한 Hint

4. Join Operations
/*+ USE_NL(table1 table 2...) */ : 테이블의 Join 시 테이블의 각 Row가 Inner 테이블을 Nested Loop 형식으로 Join 한다
/*+ USE_HASH (table_name) */ : 각 테이블 간 HASH JOIN이 일어나도록 유도한다
/*+ USE_MERGE (table_name) */ : 지정된 테이블들의 조인이 SORT-MERGE형식으로 일어나도록 유도한다.
/*+ DRIVING_SITE(table_name) */ : QUERY의 실행이 ORACLE에 의해 선택된 SITE가 아닌 다른 SITE에서 일어나도록 유도.

5. Parallel Execution
/*+ NOPARALLEL(table_name) */ : Parallel Query Option을 사용하지 않도록 할 수 있음.
/*+ PARALLEL(table_name, degree) */ : PARALLEL hint를 사용하면 query에 포함된 table의 degree를 설정할 수 있다.

6. Additional Hints
/*+ CACHE(table) */ : full table scan시 retrieve 된 block을 LRU list에서 most recently used end에 놓는다./ 즉, memory에 오래 존재하게 한다.
/*+ NOCACHE(table) */ : full table scan시 retrieve된 block을 LRU list에서 least recently used end에 놓는다. / 즉, memory에서 금방 내려가게 한다.
/*+ MERGE(view) */ : COMPLEX_VIEW_MERGING = FALSE로 되어 있을 때 view 또는 subquery의 내용을 merge가능.
/*+ NOMERGE(view) */ : COMPLEX_VIEW_MERGING = TRUE로 되어 있을 때 사용 / view 또는 subquery의 내용을 merge불가능. / view 또는 subquery자체의 query문에 의한 영향을 많이 받게 됨.
/*+ PUSH_SUBQ */ : nomerged subqueries가 execution plan에서 가능한 가장 빠른 위치에서 evaluation 되도록 한다.


접근 순서를 결정하는 힌트절
1. ORDERED ? FROM 절에 나열된 테이블 순서대로 접근한다(SQL문에 종속적).
2. LEADING ? 테이블 접근 순서를 명시적으로 표시한다(SQL문에 독립적).

접근 방법을 결정하는 힌트절
3. USE_NL ? NESTED LOOP JOIN 방식으로 조인하도록 유도한다(순차적인 접근 방법).
4. USE_HASH ? HASH JOIN 방식으로 조인하도록 유도한다(해시 함수를 이용한 접근 방법).

자원 사용을 결정하는 힌트절
5. INDEX ? 인덱스를 통한 ACCESS PATH 유도한다.
6. FULL ? 테이블을 FULL SCAN한다.
7. PARALLEL ? 병렬 처리를 통하여 성능을 높인다.

SELECT /*+HINT절_DESC(테이블명 PK명)*/ 컬럼명1, 컬럼명2 ... FROM 테이블명
SELECT /*+ORDERED(PLAYER PLAYER_PK)*/ PLAYER_NAME, TEAM_ID FROM PLAYER;

정렬을 해주는 ORDER BY라는 함수가 있지만 ORDER BY는 정렬을 시키고자하는 데이터가 많아진다면,
SELECT를 하고나서 정렬을 시키느라 속도가 많이 느려집니다.
반면 hint는 SELECT전에 인덱스 번호로 접근하여 정렬을 시키기 때문에 데이터가 많아도 빠릅니다.

*/

SELECT /*+ INDEX_DESC(PLAYER PLAYER_PK) */ * FROM PLAYER;
SELECT /*+ INDEX(PLAYER PLAYER_PK) */ * FROM PLAYER;
--/*D와 +를 붙여서 작성해야한다. /*+
