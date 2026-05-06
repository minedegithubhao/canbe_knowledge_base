alias:: 大模型应用面试, Prompt面试, Agent面试
type:: review
domain:: [[MOC/大模型应用]]
status:: active
created:: 2026-05-03
updated:: 2026-05-04

- **怎么刷**
	- 第一轮先刷 Prompt、上下文工程和 RAG 的关系。
	- 第二轮刷 Agent 模式：Chaining、Routing、Reflection。
	- 第三轮用项目讲清楚为什么不能只靠 Prompt。

- **高频必会**
	- Prompt Engineering 的核心原则是什么？ #card
		- 指令清晰、上下文分隔、输出格式明确、必要时提供示例，复杂任务拆步骤，并明确证据不足、权限不足或无法完成时如何处理。
	- 上下文工程和 Prompt Engineering 有什么区别？ #card
		- Prompt Engineering 关注指令怎么写；上下文工程关注整个输入上下文如何组织，包括指令、检索证据、历史状态、工具结果、记忆和约束。
	- Agent 和普通 LLM 调用有什么区别？ #card
		- 普通 LLM 调用通常是一次输入输出；Agent 会围绕目标规划步骤、调用工具、观察结果、处理异常，并根据反馈继续行动。
	- Prompt Chaining 适合什么场景？ #card
		- 适合复杂、多阶段、需要中间检查的任务。它把大任务拆成小任务，降低单次生成难度，也方便定位哪一步出错。
	- Routing 在 Agent 中解决什么问题？ #card
		- 它解决下一步走哪条链路的问题，根据输入和状态选择模型、工具、知识库、人工流程或拒答策略。
	- Reflection 有什么作用和风险？ #card
		- 它让 Agent 检查和改进自己的输出，提升复杂任务稳定性。风险是增加成本和延迟，也可能陷入无效循环，需要明确停止条件。
	- MCP 是什么？ #card
		- MCP 是大模型应用连接外部工具、数据源和业务系统的标准协议，让 Agent 能以统一方式发现、理解并调用外部能力。

- **复杂题入口**
	- [[Question/Prompt Engineering 的核心原则是什么]]
	- [[Question/上下文工程和 Prompt Engineering 有什么区别]]
	- [[Question/Agent 和普通 LLM 调用有什么区别]]
	- [[Question/Prompt Chaining 适合什么场景]]
	- [[Question/Routing 在 Agent 中解决什么问题]]
	- [[Question/Reflection 有什么作用和风险]]
	- [[Question/MCP 和 function calling 有什么区别]]

- **关联概念**
	- [[Concept/Prompt Engineering]]
	- [[Concept/上下文工程]]
	- [[Concept/Agent]]
	- [[Concept/Prompt Chaining]]
	- [[Concept/Routing]]
	- [[Concept/Reflection]]
	- [[Concept/Chain-of-Thought]]
	- [[Concept/MCP]]

- **项目入口**
	- [[Project/简易RAG系统]]
	- [[Project/智能客服RAG实战]]
	- [[Project/图文知识库]]
