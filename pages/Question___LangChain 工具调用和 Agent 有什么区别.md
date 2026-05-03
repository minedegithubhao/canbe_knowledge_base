alias:: LangChain Tool Calling 和 Agent 区别, 工具调用和 Agent 区别
type:: question
domain:: [[MOC/大模型应用工程]]
difficulty:: 中
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- LangChain 工具调用和 Agent 有什么区别？

- **标准回答**
	- 工具调用是把外部函数、API 或查询能力暴露给模型，让模型在需要时生成工具调用参数。Agent 是更完整的任务执行模式，它围绕目标进行多步决策，选择工具、执行工具、观察结果，并继续推进直到完成任务。
	- 简单任务可以只用工具调用；需要多步规划、动态决策和循环执行时，才更适合 Agent。

- **回答结构**
	- 先定义工具调用：单次外部能力调用。
	- 再定义 Agent：目标驱动的多步执行循环。
	- 再讲选择标准：确定链路 vs 动态链路。
	- 最后讲风险：权限、成本、循环失控、错误工具调用。

- **项目追问**
	- 为什么不是所有工具调用都做成 Agent？
		- Agent 灵活但更难控，成本、延迟和调试难度更高。固定流程用链式编排或普通服务更稳定。

- **关联知识**
	- [[Concept/LangChain]]
	- [[Concept/Agent]]
	- [[Concept/LCEL]]
	- [[Concept/Routing]]
	- [[Concept/Reflection]]

- **我的易错点**
	- 不要把工具调用和 Agent 画等号。
	- 要强调权限边界、失败兜底和可观测性。

- **来源**
	- [[Concept/LangChain]]
	- [[Concept/Agent]]
	- [[langchain的使用]]
	- [[Source/LangChain Docs - Overview]]
