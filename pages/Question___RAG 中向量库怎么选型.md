alias:: RAG 向量库选型, 向量数据库怎么选, Milvus HNSW IVF_FLAT 选型
type:: question
domain:: [[MOC/向量检索]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- RAG 中向量库怎么选型？

- **标准回答**
	- RAG 中选向量库要看数据规模、查询延迟、召回率要求、metadata 过滤能力、更新频率、运维成本和生态兼容性。小规模高精度可以用 FLAT 做基线；通用 RAG 常评估 HNSW；更大规模或内存敏感场景可以评估 IVF 类索引。
	- 选型不能只看向量库名字，还要看 embedding 模型、chunk 质量、距离度量、索引参数、混合检索、Rerank 和评估集反馈。

- **回答结构**
	- 先说选型维度。
	- 再说索引选择。
	- 再说过滤、更新和运维。
	- 最后强调用评估集验证，不靠主观感觉。

- **项目追问**
	- 为什么要先做 FLAT 基线？
		- FLAT 可以作为精确搜索基准，用来评估 ANN 索引的召回损失。
	- 只换向量库能解决 RAG 效果差吗？
		- 不一定。很多问题来自文档清洗、切分、embedding、query 改写、metadata、混合检索和重排。

- **关联知识**
	- [[Concept/向量库]]
	- [[Concept/Milvus]]
	- [[Concept/HNSW]]
	- [[Concept/IVF_FLAT]]
	- [[Concept/混合检索]]
	- [[Concept/重排序]]
	- [[Concept/RAG]]

- **我的易错点**
	- 不要把选型简化成“哪个最快”。
	- 不要脱离评估集讨论索引参数。

- **来源**
	- [[Concept/向量库]]
	- [[Concept/Milvus]]
	- [[Milvus]]
	- [[HNSW]]
	- [[IVF_FLAT]]
