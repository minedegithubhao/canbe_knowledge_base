alias:: Milvus向量数据库, Milvus Vector Database
type:: concept
domain:: [[MOC/向量检索]]
status:: growing
level:: 项目可用
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- Milvus 是面向大规模向量存储、索引和相似度检索的向量数据库，常用于 RAG、推荐和语义搜索。

- **解决的问题**
	- 存储向量、原文标识和 metadata。
	- 为向量字段建立索引，提高相似度搜索速度。
	- 支持按标量字段过滤，缩小检索范围。
	- 管理集合、分区、字段和索引参数。

- **核心机制**
	- Collection 类似表，用来组织同类业务数据。
	- Entity 类似行，是插入和查询的基本对象。
	- Field 类似列，包括主键字段、向量字段和标量字段。
	- 向量字段负责相似度检索，标量字段负责过滤和业务条件。
	- 常见索引包括 FLAT、[[Concept/IVF_FLAT]]、[[Concept/HNSW]] 和稀疏向量倒排索引。

- **典型流程**
	- 连接 Milvus。
	- 创建 Collection 和 schema。
	- 添加主键、文本、metadata 和向量字段。
	- 选择索引类型和距离度量。
	- 插入向量数据。
	- load collection 后执行 search。
	- 根据业务需要加入过滤条件和返回字段。

- **项目中怎么用**
	- RAG 中，Milvus 常保存 chunk 的 embedding、chunk_id、source、title、section 等 metadata。
	- 智能客服或手册问答中，可以用 metadata 过滤产品线、文档版本或章节。
	- 图文检索中，可以为文本向量和图片向量设计不同字段或不同集合。

- **面试表达**
	- Milvus 在 RAG 中负责什么？ #card
		- Milvus 负责存储 chunk embedding、metadata 和索引，并按 query embedding 做相似度召回。它主要解决向量存储和高效检索问题，召回结果通常还需要过滤、融合和重排。

- **常见误区**
	- 误区：Milvus 只存向量。
		- 实际项目还要存主键、文本引用和 metadata，否则无法过滤、溯源和构造上下文。
	- 误区：索引类型选了就不用调参。
		- HNSW、IVF_FLAT 等索引参数会影响召回、延迟、内存和构建成本。

- **相关概念**
	- [[Concept/向量库]]
	- [[Concept/向量检索]]
	- [[Concept/近似最近邻搜索]]
	- [[Concept/HNSW]]
	- [[Concept/IVF_FLAT]]
	- [[Concept/距离度量]]
	- [[Concept/混合检索]]

- **来源**
	- [[Milvus]]
	- [[大模型/RAG/向量库]]
