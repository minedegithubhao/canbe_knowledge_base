alias:: ContextPrecision, Context Precision
type:: concept
domain:: [[MOC/RAG]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- 准确率衡量召回回来的 chunk 里，有多少是真正有助于回答问题的内容。

- **准确率低说明什么**
	- Top K 里混入了大量无关 chunk。
	- chunk size 过大，相关信息和噪声混在一起。
	- 关键词检索或向量检索召回了语义相似但业务不相关的内容。
	- 多路召回没有融合好。
	- Rerank 没有过滤掉低相关内容。

- **优化方向**
	- 调整文档切分和 metadata。
	- 使用 [[Concept/混合检索]] 和 [[Concept/RRF]] 做更稳定的召回融合。
	- 使用 [[Concept/重排序]] 过滤低相关内容。
	- 降低 Top K 或增加阈值，但要同时观察召回率是否下降。

- **面试表达**
	- 召回率高但准确率低说明什么？ #card
		- 说明答案所需证据可能被召回了，但同时混入了很多无关内容。应重点看 chunk 粒度、Top K、多路融合和 Rerank，而不是只改生成 Prompt。

- **相关概念**
	- [[Concept/召回率]]
	- [[Concept/真实性]]
	- [[Concept/RAGAS]]
	- [[Concept/重排序]]

- **来源**
	- [[准确率]]
	- [[Project/手册类RAG实战]]
