alias:: IVF_FLAT HNSW 区别, 向量索引选型
type:: question
domain:: [[MOC/向量检索]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- IVF_FLAT 和 HNSW 有什么区别？

- **标准回答**
	- IVF_FLAT 是聚类分桶思路，先把向量分到多个桶，查询时只搜索最近的若干桶，再在桶内做精确比较。它更省内存，适合较大规模数据，但召回率依赖查询桶数量。
	- HNSW 是多层近邻图思路，通过高层快速跳转和底层精细搜索找到候选。它查询快、召回高，但构建成本和内存占用更高。

- **回答结构**
	- 先说两者都是 ANN 索引。
	- 再说 IVF_FLAT 是聚类分桶。
	- 再说 HNSW 是多层图。
	- 最后对比速度、召回、内存、构建成本和场景。

- **项目追问**
	- RAG 项目优先选哪个？
		- 中小规模、低延迟、高召回场景常优先考虑 HNSW；超大规模或内存敏感场景可以评估 IVF_FLAT。
	- IVF_FLAT 参数怎么影响效果？
		- 查询桶越多召回越高但越慢，桶数和查询桶数需要结合数据规模和召回评估调优。

- **关联知识**
	- [[Concept/IVF_FLAT]]
	- [[Concept/HNSW]]
	- [[Concept/近似最近邻搜索]]
	- [[Concept/Milvus]]

- **我的易错点**
	- 不要把 IVF_FLAT 说成全量精确搜索。
	- 不要说 HNSW 永远适合所有场景。

- **来源**
	- [[Concept/IVF_FLAT]]
	- [[Concept/HNSW]]
	- [[IVF_FLAT]]
	- [[HNSW]]
	- [[Milvus]]
