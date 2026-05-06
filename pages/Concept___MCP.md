alias:: Model Context Protocol, 模型上下文协议, MCP协议, AI工具协议
type:: concept
domain:: [[MOC/大模型应用工程]]
status:: growing
level:: 面试可讲
created:: 2026-05-04
updated:: 2026-05-04

- **一句话定义**
	- MCP 是一套让 AI 应用以标准方式连接外部数据、工具和业务系统的开放协议。
- **解决的问题**
	- 普通大模型只能基于输入上下文生成文本，难以稳定访问企业数据库、文件系统、SaaS、内部 Java 服务和业务工作流。
	- 如果每个 AI 应用都为每个系统单独写一套连接器，集成会变成大量碎片化胶水代码。
	- MCP 试图把这类连接抽象成统一协议，让不同 AI 客户端可以复用同一类外部能力。
- **核心机制**
	- MCP 采用 client-server 架构。
	- MCP Host 是 AI 应用，例如 IDE、桌面助手、企业智能客服或 coding agent。
	- MCP Client 是 Host 内部连接某个 MCP Server 的组件。
	- MCP Server 是暴露外部能力的服务端程序，背后可以连接文件系统、数据库、Java 后端、第三方 SaaS 或内部平台。
	- MCP 的数据层基于 JSON-RPC，负责生命周期、能力协商、工具发现、资源读取、提示词获取和通知。
	- MCP 的传输层负责通信与认证，常见方式包括本地 stdio 和远程 HTTP。
- **MCP Server 通常暴露什么**
	- tools：模型可以主动调用的可执行动作，例如查订单、发消息、查数据库、创建工单。
	- resources：应用可读取并放入上下文的数据源，例如文件内容、数据库 schema、API 文档、知识库内容。
	- prompts：可复用的提示词模板或工作流模板，例如固定的故障排查流程、客服处理流程、代码审查流程。
- **和 function calling 的区别**
	- function calling 是模型或平台层面的工具调用能力，重点是让模型按 schema 产生函数调用参数。
	- MCP 是应用集成层协议，重点是让工具、资源、提示词、连接、发现、复用和传输有统一接口。
	- 更准确的理解是：MCP Server 暴露的 tool，常常会被 AI 应用注册成模型可见的 function/tool，再由模型决定是否调用。
- **企业里怎么用**
	- 不建议把所有后端接口原样暴露给模型。
	- 更合理的做法是按业务能力封装 MCP Server，例如 Customer MCP、Order MCP、Ticket MCP、Finance MCP、Knowledge Base MCP。
	- 一个 MCP Server 背后可以调用多个 Java 服务、数据库或第三方系统。
	- 工具名和描述应面向任务，而不是面向底层表或 RPC，例如 `get_customer_summary` 比 `query_customer_table` 更适合模型理解。
	- 生产环境需要显式处理权限、参数校验、审计日志、限流、错误恢复和人工确认。
- **面试表达**
	- MCP 是什么？ #card
		- MCP 是大模型应用连接外部工具、数据源和业务系统的标准协议。它把工具、资源和提示词以统一方式暴露给 AI 应用，让 Agent 能发现、理解并调用外部能力。
	- MCP 和 function calling 有什么区别？ #card
		- function calling 是模型调用函数的能力；MCP 是把外部工具、资源和提示词标准化暴露给 AI 应用的协议。MCP tool 最后经常会被 AI 应用注册成模型可调用的 function 或 tool。
	- 企业里谁负责开发 MCP？ #card
		- 通常后端或平台团队负责 MCP Server 的权限、数据、事务、安全和审计；大模型应用开发负责定义 AI 场景需要哪些工具、如何接入 MCP，以及如何编排工具调用结果。
- **常见误区**
	- 误区：MCP 是一种新模型。
		- MCP 是连接协议，不是模型本身。
	- 误区：MCP 可以替代 Java 后端。
		- MCP Server 通常是在 AI 应用和后端系统之间做适配，不能替代业务系统本身。
	- 误区：一个 Java 服务必须对应一个 MCP Server。
		- MCP 更适合按业务能力、权限边界和 AI 任务边界划分。
	- 误区：把所有 API 暴露给模型就算接入 MCP。
		- 生产系统应暴露少量高内聚、可审计、权限清晰、语义友好的业务工具。
- **相关概念**
	- [[Concept/Agent]]
	- [[Concept/上下文工程]]
	- [[Concept/Prompt Engineering]]
	- [[Concept/LangChain]]
	- [[Concept/LCEL]]
	- [[Concept/Codex使用指南]]
	- [[Question/MCP 和 function calling 有什么区别]]
	- [[Question/企业里 MCP Server 应该怎么设计]]
- **来源**
	- [[Source/Model Context Protocol - Introduction]]
	- [[Source/Model Context Protocol - Architecture overview]]
	- [[Source/Model Context Protocol - Server concepts]]
	- [[2026_05_04]]