alias:: Self-Querying Retriever, Metadata Filtering
type:: concept
domain:: [[MOC/RAG]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- 自查询检索是从用户问题中提取结构化条件，并用 metadata 过滤缩小检索范围的 RAG 检索策略。

- **解决的问题**
	- 用户问题里包含章节、时间、版本、类别、部门、产品线等过滤条件。
	- 单纯向量检索会在全库中找语义相似内容，容易召回范围过大。
	- 手册类和 FAQ 类知识库经常需要先缩小范围，再做语义召回。

- **典型流程**
	- LLM 或规则从 query 中提取 metadata 条件。
	- 生成 refined_query 和 metadata_filter。
	- 如果提取到过滤条件，则先按 metadata 缩小候选范围。
	- 在过滤后的范围内做向量检索、关键词检索或混合检索。
	- 最后 Rerank 并生成答案。

- **项目中怎么用**
	- [[Project/手册类RAG实战]] 中，metadata/self-query 用来缩小章节或主题范围，避免无关章节干扰检索。

- **面试表达**
	- 自查询检索适合什么场景？ #card
		- 适合文档有明确 metadata 的场景，例如章节、版本、类别、时间、产品线。它能先缩小检索范围，再做语义检索，减少无关召回。
	- 自查询检索和 Query Rewriting 的区别是什么？ #card
		- Query Rewriting 主要改写自然语言 query；自查询检索会进一步提取结构化过滤条件，用 metadata_filter 约束检索范围。

- **相关概念**
	- [[Concept/Query Rewriting]]
	- [[Concept/向量库]]
	- [[Concept/混合检索]]
	- [[Concept/重排序]]

- **来源**
	- [[自查询检索]]
	- [[Project/手册类RAG实战]]
