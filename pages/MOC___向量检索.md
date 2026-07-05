alias:: 向量检索地图, 向量数据库地图, Vector Search Map
type:: moc
domain:: [[MOC/RAG]]
status:: growing
updated:: 2026-05-26

- **学习路径**
	- 先理解基础表示：[[Concept/向量]]、[[Concept/文本嵌入]]、[[Concept/池化]]
	- 再理解相似度：[[Concept/距离度量]]、[[Concept/内积]]、[[Concept/余弦相似度]]
	- 再理解检索机制：[[Concept/向量检索]]、[[Concept/近似最近邻搜索]]
	- 再理解存储和索引：[[Concept/向量库]]、[[Concept/Milvus]]、[[Concept/HNSW]]、[[Concept/IVF_FLAT]]
	- 最后和 RAG 链路合并：[[Concept/混合检索]]、[[Concept/RRF]]、[[Concept/重排序]]、[[Concept/BGE Reranker]]、[[Concept/检索后过滤]]、[[Concept/RAG]]

- **核心概念**
	- [[Concept/向量检索]]
	- [[Concept/向量库]]
	- [[Concept/Milvus]]
	- [[Concept/近似最近邻搜索]]
	- [[Concept/HNSW]]
	- [[Concept/IVF_FLAT]]
	- [[Concept/文本嵌入]]
	- [[Concept/池化]]
	- [[Concept/距离度量]]
	- [[Concept/内积]]
	- [[Concept/余弦相似度]]
	- [[Concept/混合检索]]
	- [[Concept/RRF]]
	- [[Concept/重排序]]
	- [[Concept/BGE Reranker]]
	- [[Concept/检索后过滤]]

- **面试重点**
	- [[Review/向量检索面试]]
	- [[Question/向量数据库解决什么问题]]
	- [[Question/HNSW 的核心思想是什么]]
	- [[Question/IVF_FLAT 和 HNSW 有什么区别]]
	- [[Question/向量检索为什么还需要召回和重排]]
	- [[Question/RAG 中向量库怎么选型]]

- **项目实战**
	- [[Project/简易RAG系统]]
	- [[Project/智能客服RAG实战]]
	- [[Project/手册类RAG实战]]
	- [[Project/图文知识库]]

- **旧页面迁移索引**
	- 已迁移：[[Milvus]]、[[HNSW]]、[[IVF_FLAT]]、[[大模型/RAG/向量库]]、[[内积]]
	- 已作为来源保留：[[Embedding使用]]、[[大模型/RAG/文本嵌入]]、[[大模型/Transformer/向量]]
	- 已迁移：[[大模型/RAG/双路检索]]、[[检索后过滤]]、[[Reranker]]、[[BGE Reranker]]、[[bge-reranker-v2-m3模型]]

- **最近更新**
	- 2026-05-03
		- 建立向量检索 MOC、Milvus/HNSW/IVF_FLAT 概念页和面试复习页。
	- 2026-05-03
		- 补齐内积和余弦相似度概念页。
	- 2026-05-03
		- 补齐池化概念页，接入文本嵌入和文档聚类主线。

- **后续深挖**
	- 过滤检索、BM25 与向量融合的工程细节、向量库压测和容量规划。
