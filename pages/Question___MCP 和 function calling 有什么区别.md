alias:: MCP 与 function calling 区别, MCP 和工具调用区别, MCP 和函数调用区别
type:: question
domain:: [[MOC/大模型应用工程]]
difficulty:: 中等
status:: practicing
created:: 2026-05-04
updated:: 2026-05-04

- **题目**
	- MCP 和 function calling 有什么区别？
- **标准回答**
	- function calling 是模型或模型平台提供的工具调用能力，重点是让模型根据用户问题选择某个函数，并按 schema 生成结构化参数。
	- MCP 是 AI 应用和外部系统之间的标准连接协议，重点是工具发现、资源读取、提示词模板、连接方式、能力协商和跨客户端复用。
	- 两者不是互斥关系。MCP Server 暴露出来的 tool，通常会被 AI 应用收集并注册成模型可见的 tool 或 function，最后由模型通过 function calling 或 tool calling 机制触发。
- **回答结构**
	- function calling：模型能力，解决“模型如何调用函数”。
	- MCP：集成协议，解决“外部工具和上下文如何标准化暴露给 AI 应用”。
	- 关系：MCP tool 经常成为模型 tool/function 的来源。
	- 工程价值：复用、发现、权限、传输、资源和提示词统一。
- **项目追问**
	- 如果已经有 function calling，为什么还需要 MCP？
		- function calling 只解决一次调用的 schema 和参数生成；MCP 进一步解决多工具发现、多 server 连接、资源读取、提示词模板、传输方式和跨客户端复用。
	- MCP Server 的 tool 应该怎么命名？
		- 应该面向业务任务命名，例如 `get_order_delivery_status`、`get_customer_summary`，而不是直接暴露 `query_order_table` 这类底层接口。
	- MCP 会不会让模型拥有所有系统权限？
		- 不应该。权限应该在 MCP Server、AI 应用和业务系统多层控制，包括认证、授权、参数校验、审批、审计和限流。
- **关联知识**
	- [[Concept/MCP]]
	- [[Concept/Agent]]
	- [[Concept/上下文工程]]
	- [[Concept/Prompt Engineering]]
- **我的易错点**
	- 不要把 MCP 等同于 function calling。
	- 不要把 MCP 当作模型能力；它更接近 AI 应用和外部系统之间的协议层。
- **来源**
	- [[Concept/MCP]]
	- [[Source/Model Context Protocol - Introduction]]
	- [[Source/Model Context Protocol - Architecture overview]]
	- [[Source/Model Context Protocol - Server concepts]]
	- [[2026_05_04]]