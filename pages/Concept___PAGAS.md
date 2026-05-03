alias:: PAGAS, RAG业务评估, RAG项目评估
type:: concept
domain:: [[MOC/RAG]]
status:: stable
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- PAGAS 是面向业务验收的 RAG 评估框架，用 Groundedness、Precision、Answer Relevance、Attribute Coverage、Succinctness 等维度拆解答案质量。

- **解决的问题**
	- RAGAS 偏技术指标，业务方更关心答案是否有依据、是否答到点上、是否覆盖关键属性、是否简洁可用。
	- 项目上线时需要把技术评估转化为业务可理解的质量标准。

- **核心维度**
	- Groundedness
		- 回答是否有检索证据支撑。
	- Precision
		- 检索内容是否和问题相关，噪声是否过多。
	- Answer Relevance
		- 回答是否正面回应用户问题。
	- Attribute Coverage
		- 是否覆盖业务必须回答的关键属性和条件。
	- Succinctness
		- 是否简洁，没有无关扩展。

- **优化顺序**
	- 先保证可用：优先看 Groundedness 和 Precision，确保有证据且证据相对干净。
	- 再保证有用：优化 Answer Relevance 和 Attribute Coverage，让答案对业务问题真正有帮助。
	- 最后优化体验：再看 Succinctness、格式、引用和表达。

- **面试表达**
	- PAGAS 和 RAGAS 的区别是什么？ #card
		- RAGAS 更偏技术评估，帮助定位检索和生成问题；PAGAS 更偏业务验收，关注答案是否有证据、是否相关、是否覆盖关键属性、是否简洁可用。
	- 如果 P 很低但 G、A、S 很高，可能说明什么？ #card
		- 可能说明检索内容不相关，但模型靠自身知识答对了，或者评估数据和知识库不匹配。应先检查问题是否在文档中有答案，再看召回日志。

- **常见误区**
	- 误区：业务评估只看答案像不像人话。
		- RAG 的业务质量首先要有证据和关键点覆盖，然后才是表达。
	- 误区：Precision 低可以靠模型总结补救。
		- 噪声上下文会增加幻觉风险，应该回到检索和 Rerank 阶段处理。

- **相关概念**
	- [[Concept/RAGAS]]
	- [[Concept/RAG]]

- **来源**
	- [[PAGAS]]
	- [[RAGAS]]
