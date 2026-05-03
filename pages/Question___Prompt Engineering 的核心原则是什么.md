alias:: 提示词工程核心原则
type:: question
domain:: [[MOC/大模型应用]]
difficulty:: 简单
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Prompt Engineering 的核心原则是什么？

- **标准回答**
	- 核心原则是把任务、背景、约束和输出格式说清楚；用分隔符区分指令、上下文和用户输入；必要时给示例；复杂任务拆步骤；对 RAG 和高风险场景，要明确基于证据回答、证据不足时拒答。

- **回答结构**
	- 指令清晰。
	- 上下文分隔。
	- 输出格式明确。
	- 示例引导。
	- 复杂任务拆分。
	- 边界和拒答条件。

- **项目追问**
	- 为什么不能只靠 Prompt 解决 RAG 问题？
		- 如果正确证据没有召回，Prompt 再强也无法稳定生成正确答案。

- **关联知识**
	- [[Concept/Prompt Engineering]]
	- [[Concept/上下文工程]]
	- [[Concept/RAG]]

- **我的易错点**
	- 不要把 Prompt 说成万能优化手段。

- **来源**
	- [[Concept/Prompt Engineering]]
	- [[Prompt]]
