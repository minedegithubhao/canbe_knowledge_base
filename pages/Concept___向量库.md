alias:: Vector Database, Vector Store, 向量数据库, 向量存储
type:: concept
domain:: [[MOC/向量检索]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-03

- **一句话定义**
	- 向量库用于存储 chunk 的 embedding、原文片段和 metadata，并支持按向量相似度快速召回候选内容。

- **在 RAG 中的位置**
	- 离线入库时写入 chunk、embedding、文档来源和 metadata。
	- 在线检索时用 query embedding 查找相似 chunk。
	- 返回的候选结果通常还要经过融合、Rerank 和 Prompt 构建。

- **关键字段**
	- chunk_id。
	- text。
	- embedding。
	- source。
	- title、section、page、version、created_at 等 metadata。

- **核心能力**
	- 向量存储
		- 保存文本、图片或商品等对象的 embedding。
	- 相似度检索
		- 基于 [[Concept/距离度量]] 返回相似候选。
	- 向量索引
		- 使用 [[Concept/近似最近邻搜索]]、[[Concept/HNSW]]、[[Concept/IVF_FLAT]] 等方式降低查询成本。
	- 标量过滤
		- 通过 metadata 缩小搜索范围，支撑版本、权限、类别和时间过滤。

- **常见误区**
	- 误区：向量库就是 RAG 的全部。
		- 向量库只是召回基础设施，RAG 还需要清洗、切分、索引、混合检索、Rerank、Prompt 和评估。
	- 误区：向量检索能替代关键词检索。
		- 精确词、编号、实体名和专业术语仍然需要关键词检索或 metadata 过滤。

- **面试表达**
	- 向量库在 RAG 里解决什么问题？ #card
		- 向量库用于存储 chunk embedding、原文和 metadata，并支持按 query embedding 做相似度召回。它是 RAG 的召回基础设施之一，但不是 RAG 的全部。

- **相关概念**
	- [[Concept/向量检索]]
	- [[Concept/文本嵌入]]
	- [[Concept/Milvus]]
	- [[Concept/近似最近邻搜索]]
	- [[Concept/HNSW]]
	- [[Concept/IVF_FLAT]]
	- [[Concept/距离度量]]
	- [[Concept/混合检索]]
	- [[Concept/自查询检索]]
	- [[Concept/重排序]]

- **来源**
	- [[大模型/RAG/向量库]]
	- [[Project/简易RAG系统]]
	- [[Milvus]]
