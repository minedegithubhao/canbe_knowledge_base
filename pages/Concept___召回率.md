alias:: ContextRecall, Context Recall
type:: concept
domain:: [[MOC/RAG]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- 召回率衡量答案所需的关键信息点是否出现在检索回来的上下文里。

- **在 RAG 中怎么看**
	- 给定问题和标准答案。
	- 从标准答案中拆出关键信息点。
	- 检查召回上下文是否覆盖这些信息点。
	- 覆盖越完整，召回率越高。

- **召回率低说明什么**
	- 正确文档没有入库。
	- 文档清洗删掉了关键信息。
	- chunk 切分导致证据被拆散。
	- query 没改写好，检索偏了。
	- 向量检索、关键词检索或 metadata 过滤漏掉了候选。
	- Top K 太小或 Rerank 过滤过严。

- **面试表达**
	- RAG 召回率低怎么排查？ #card
		- 先确认知识库里有没有正确答案，再看清洗和切分是否保留证据，然后检查 query、检索策略、metadata 过滤、Top K 和 Rerank 阈值，定位正确证据在哪一步丢失。

- **相关概念**
	- [[Concept/准确率]]
	- [[Concept/RAGAS]]
	- [[Concept/文档切分]]
	- [[Concept/重排序]]

- **来源**
	- [[召回率]]
