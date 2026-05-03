alias:: 查询重写有什么风险, Query Rewriting 什么时候会变差
type:: question
domain:: [[MOC/RAG]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Query Rewriting 有什么风险？

- **标准回答**
	- Query Rewriting 的主要风险是改写漂移。模型可能加入用户没有表达的事实、改变原始意图、过度扩展问题，导致检索偏向错误方向。更强的大模型不一定更适合改写，因为它可能生成更完整但不适合检索的表达。
	- 工程上要约束改写：保留原意、不新增事实、输出简洁可检索的 query，必要时原始 query 和改写 query 同时检索，并通过评估集验证是否真的提升召回。

- **回答结构**
	- 先说收益：解决口语、省略、指代、术语不一致。
	- 再说风险：改写漂移、添加事实、过度扩写。
	- 再说控制：规则约束、保留原 query、多路检索、评估验证。
	- 最后结合场景：小说和客服都容易出现改写偏移。

- **项目追问**
	- 为什么强模型改写反而可能变差？
		- 强模型可能加入推理、修饰和抽象表达，而检索模型需要稳定实体、关键词和原始意图。
	- 怎么判断改写是否有效？
		- 看评估集中正确证据的召回率和错误样本，不只看改写文本是否“更通顺”。

- **关联知识**
	- [[Concept/Query Rewriting]]
	- [[Concept/混合检索]]
	- [[Concept/自查询检索]]
	- [[Concept/RAG]]

- **我的易错点**
	- 不要把 Query Rewriting 当成生成答案；它只服务检索。

- **来源**
	- [[Concept/Query Rewriting]]
	- [[大模型/RAG/Query Rewriting]]
	- [[Project/小说RAG实战]]
