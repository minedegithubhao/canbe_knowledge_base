alias:: RRF Rerank 易错点, RRF 和重排序混淆
type:: mistake
domain:: [[MOC/RAG]]
status:: weak
created:: 2026-05-03
updated:: 2026-05-03

- **错误题目**
	- RRF 和 Rerank 有什么区别？

- **我的错误答案**
	- 容易把 RRF 和 Rerank 都说成“排序”，没有讲清它们在 RAG 检索链路中的不同位置。

- **正确答案**
	- RRF 是多路召回结果融合算法，主要看不同召回列表里的排名，不理解 query 和 chunk 的语义。
	- Rerank 是重排序模型，会把 query 和候选 chunk 放在一起判断相关性，用于最终证据精排。
	- 常见链路是先多路召回，再用 RRF 融合候选，最后用 Rerank 精排进入 Prompt 的证据。

- **错因分析**
	- 把“融合候选”和“语义精排”混成了一个步骤。
	- 没有先按链路位置区分：召回、融合、重排、生成。

- **关联概念**
	- [[Concept/RRF]]
	- [[Concept/重排序]]
	- [[Concept/BGE Reranker]]
	- [[Concept/混合检索]]

- **复习计划**
	- 复述 [[Question/RRF 和 Rerank 有什么区别]]。
	- 练习用一句话回答：RRF 看排名做融合，Rerank 看内容做精排。

- **来源**
	- [[Question/RRF 和 Rerank 有什么区别]]
	- [[Review/RAG面试]]
