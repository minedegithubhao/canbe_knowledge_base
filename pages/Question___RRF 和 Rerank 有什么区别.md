alias:: RRF 和重排序有什么区别
type:: question
domain:: [[MOC/RAG]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- RRF 和 Rerank 有什么区别？

- **标准回答**
	- RRF 是多路召回结果融合算法，主要根据文档在不同召回列表中的排名来合并结果，不理解 query 和 chunk 的语义内容。Rerank 是重排序模型，会把 query 和候选 chunk 放在一起判断相关性，通常用于最终证据精排。
	- 在 RAG 中，RRF 常放在向量检索和 BM25 等多路召回之后，用来合并候选；Rerank 放在候选池之后，用来筛掉弱相关内容，选出最终进入 Prompt 的证据。

- **回答结构**
	- 先说位置：RRF 在融合阶段，Rerank 在精排阶段。
	- 再说依据：RRF 看排名，Rerank 看 query 和 chunk 的内容相关性。
	- 再说成本：RRF 快，Rerank 准但慢。
	- 最后说组合：多路召回后先 RRF，再 Rerank。

- **项目追问**
	- 如果混合检索结果很少，还需要 RRF 吗？
		- 不一定。候选很少时可以直接合并去重后 Rerank；RRF 更适合多路召回结果较多、分数不可比的场景。
	- 为什么不能只用 Rerank？
		- Rerank 不负责扩大召回范围，如果初召回没有正确候选，Rerank 也排不出来。

- **关联知识**
	- [[Concept/RRF]]
	- [[Concept/重排序]]
	- [[Concept/BGE Reranker]]
	- [[Concept/混合检索]]

- **我的易错点**
	- 不要把 RRF 说成模型；它是融合算法。
	- 不要把 Rerank 说成召回；它是在候选池上精排。

- **来源**
	- [[Concept/RRF]]
	- [[Concept/重排序]]
	- [[RRF]]
	- [[重排序]]
