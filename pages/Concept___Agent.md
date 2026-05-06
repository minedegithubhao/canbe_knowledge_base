alias:: Agent, 智能体, LLM Agent, AI Agent
type:: concept
domain:: [[MOC/大模型应用]]
status:: growing
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-04

- **一句话定义**
	- Agent 是能围绕目标进行感知、规划、工具调用、执行和反馈调整的大模型应用系统。

- **解决的问题**
	- 普通 LLM 调用通常只完成一次输入到输出的生成。
	- 复杂任务需要分解步骤、调用工具、读取环境、处理异常、根据反馈继续行动。
	- Agent 把 LLM 从“回答器”扩展成“任务执行器”。

- **核心循环**
	- 接收目标。
	- 读取环境和上下文。
	- 制定计划或选择下一步。
	- 调用工具或执行动作。
	- 观察结果并调整。
	- 达成目标或请求人工介入。

- **常见模式**
	- [[Concept/Prompt Chaining]]：把任务拆成多个有依赖的步骤。
	- [[Concept/Routing]]：根据输入选择不同路径、工具或子任务。
	- [[Concept/Reflection]]：让系统检查输出并迭代优化。
	- [[Concept/MCP]]：把外部工具、资源和提示词标准化暴露给 Agent。
	- RAG：为 Agent 提供外部知识。
	- Human-in-the-loop：关键节点让人确认。

- **项目中怎么用**
	- 知识库助手可以用 Agent 做检索、整理、归档和自检。
	- 数据分析助手可以用 Agent 调用查询、绘图、解释和报告生成工具。
	- 企业客服 Agent 可以结合 RAG、工具调用和人工转接。
	- 企业业务 Agent 可以通过 [[Concept/MCP]] 接入订单、客户、工单、知识库和内部平台能力。

- **面试表达**
	- Agent 和普通 LLM 调用有什么区别？ #card
		- 普通 LLM 调用通常是一次输入输出；Agent 围绕目标循环工作，会规划步骤、调用工具、观察结果、处理异常，并根据反馈继续行动。

- **常见误区**
	- 误区：Agent 等于多轮对话。
		- 多轮对话只是交互形式，Agent 关键在目标、状态、工具、执行和反馈循环。
	- 误区：Agent 越自主越好。
		- 生产系统需要权限、审计、失败恢复和人工介入。

- **相关概念**
	- [[Concept/Prompt Engineering]]
	- [[Concept/上下文工程]]
	- [[Concept/Prompt Chaining]]
	- [[Concept/Routing]]
	- [[Concept/Reflection]]
	- [[Concept/MCP]]
	- [[Concept/RAG]]

- **来源**
	- [[Agent]]
	- [[MOC/大模型]]
	- [[Concept/MCP]]
