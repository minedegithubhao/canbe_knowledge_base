alias:: 手册类RAG项目怎么讲, RAG项目复盘
type:: question
domain:: [[MOC/RAG]]
difficulty:: 困难
status:: practicing
created:: 2026-05-02
updated:: 2026-05-02

- **题目**
	- 面试中如何讲手册类 RAG 项目？

- **标准回答**
	- 这个项目的重点不是搭一个简单问答，而是评估驱动优化。我用 Python 手册作为知识库，先构造评估集和指标，再通过检索日志定位问题。初始版本发现部分 case 召回率高但准确率低，说明 Top K 里有垃圾信息，于是加入 Rerank 熔断提高上下文纯度。之后发现部分有用 chunk 因切分后特征不足被过滤，于是调整 chunk size 和 overlap。再往后针对章节和编号类问题，引入 metadata/self-query 缩小检索范围。最后根据评估结果权衡 Top K、召回率、准确率和真实性。

- **回答结构**
	- 背景：手册类文档结构化强，用户问题需要精确定位章节和概念。
	- 问题：召回率、准确率、真实性之间存在取舍。
	- 定位：用 RAGAS/PAGAS 和检索日志看问题在哪一段。
	- 方案：Rerank、调整 chunk、metadata/self-query、Top K 调参。
	- 结果：上下文纯度提升，但每次优化都要看是否牺牲召回。
	- 经验：RAG 优化不能只改 Prompt，要沿着检索链路排查。

- **项目追问**
	- 为什么先加 Rerank？
		- 因为初始问题是召回内容不够纯，Rerank 能先过滤低相关 chunk。
	- 为什么调整 chunk size？
		- 因为部分答案被切断后语义特征不足，Reranker 会给低分。
	- 为什么 metadata/self-query 有用？
		- 因为手册有章节、模块和编号，可以先缩小检索范围，再做语义召回。
	- Top K 怎么选？
		- 用评估集调，Top K 变大可能提高召回率，也可能降低真实性。

- **关联知识**
	- [[Project/手册类RAG实战]]
	- [[Concept/RAGAS]]
	- [[Concept/PAGAS]]
	- [[Concept/文档切分]]
	- [[Concept/重排序]]
	- [[Concept/自查询检索]]

- **我的易错点**
	- 不要把项目讲成技术名词堆叠。
	- 必须讲清楚问题、定位、方案、指标和取舍。
	- 不要只说“用了 Rerank”，要说为什么用、解决了什么、带来了什么副作用。

- **来源**
	- [[Project/手册类RAG实战]]
	- [[手册类RAG实战]]
