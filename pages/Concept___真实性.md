alias:: Faithfulness, 忠实度
type:: concept
domain:: [[MOC/RAG]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- 真实性衡量模型回答是否忠实于检索上下文，而不是凭模型自身知识或猜测编造。

- **真实性低的常见原因**
	- 检索上下文没有正确证据。
	- 上下文里有互相冲突或无关的内容。
	- Prompt 没有要求严格基于证据回答。
	- 模型倾向于补全常识或自行推断。
	- Top K 过大导致上下文噪声和 Lost in the Middle。

- **优化顺序**
	- 先优化 Prompt，要求基于证据回答、无法回答时拒答、必要时给引用。
	- 再优化检索，提升召回率和准确率。
	- 最后考虑模型能力、微调、Query Rewriting 或更严格的生成约束。

- **面试表达**
	- RAG 真实性低怎么处理？ #card
		- 先看上下文是否有正确且干净的证据。如果没有，优化检索；如果有，再加强 Prompt 约束、引用格式和拒答策略。不能只把真实性问题归因于模型。

- **相关概念**
	- [[Concept/召回率]]
	- [[Concept/准确率]]
	- [[Concept/RAGAS]]
	- [[Concept/PAGAS]]

- **来源**
	- [[真实性]]
	- [[Project/手册类RAG实战]]
