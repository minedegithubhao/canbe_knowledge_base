alias:: Agent 与 LLM 调用区别
type:: question
domain:: [[MOC/大模型应用]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Agent 和普通 LLM 调用有什么区别？

- **标准回答**
	- 普通 LLM 调用通常是一次输入到一次输出，模型只负责生成。Agent 是围绕目标运行的系统，会读取上下文、规划步骤、调用工具、执行动作、观察结果、处理异常，并根据反馈继续行动。Agent 需要状态、权限、工具、日志和失败恢复。

- **回答结构**
	- 普通调用：输入输出。
	- Agent：目标、计划、工具、执行、反馈循环。
	- 工程要求：状态、权限、日志、人工介入。

- **项目追问**
	- Agent 为什么更难上线？
		- 因为它会执行动作，必须控制权限、成本、错误恢复和人工确认。

- **关联知识**
	- [[Concept/Agent]]
	- [[Concept/Prompt Chaining]]
	- [[Concept/Routing]]
	- [[Concept/Reflection]]

- **我的易错点**
	- 不要把多轮聊天等同于 Agent。

- **来源**
	- [[Concept/Agent]]
	- [[Agent]]
