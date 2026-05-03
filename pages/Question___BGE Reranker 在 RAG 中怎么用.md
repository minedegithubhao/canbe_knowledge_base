alias:: BGE Reranker 怎么用于 RAG, BGE Reranker 面试题
type:: question
domain:: [[MOC/RAG]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- BGE Reranker 在 RAG 中怎么用？

- **标准回答**
	- BGE Reranker 通常放在初召回之后、Prompt 构建之前。系统先用向量检索、BM25 或混合检索召回候选 chunk，再用 BGE Reranker 对 query 和候选 chunk 做成对相关性打分，按分数排序、过滤低分证据，最终把 Top K 证据送入 Prompt。
	- 它适合提升证据纯度，但会增加延迟，因此需要控制候选池大小、Top K 和阈值，并用评估集验证收益。

- **回答结构**
	- 先说位置：召回之后，生成之前。
	- 再说输入输出：query 和候选 chunk 输入，相关性分数输出。
	- 再说作用：精排、过滤、提升上下文纯度。
	- 最后说工程取舍：延迟、候选池、阈值、评估。

- **项目追问**
	- BGE Reranker 和 embedding 模型有什么不同？
		- embedding 模型负责把 query 和 chunk 分别编码成向量，适合快速召回；BGE Reranker 把 query 和 chunk 一起判断，适合精排。
	- 请求量上来后怎么办？
		- 控制候选数量、批量推理、模型量化、异步化，或按场景只对高风险问题启用。

- **关联知识**
	- [[Concept/BGE Reranker]]
	- [[Concept/重排序]]
	- [[Concept/混合检索]]
	- [[Concept/检索后过滤]]

- **我的易错点**
	- 不要把 BGE Reranker 放在入库阶段；它主要在线上查询时对候选证据精排。

- **来源**
	- [[Concept/BGE Reranker]]
	- [[BGE Reranker]]
	- [[bge-reranker-v2-m3模型]]
