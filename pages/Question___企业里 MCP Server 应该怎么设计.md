alias:: MCP Server 设计, 企业 MCP 设计, MCP 工具设计
type:: question
domain:: [[MOC/大模型应用工程]]
difficulty:: 中等
status:: practicing
created:: 2026-05-04
updated:: 2026-05-04

- **题目**
	- 企业里 MCP Server 应该怎么设计？
- **标准回答**
	- 企业里设计 MCP Server 时，不应该把所有后端接口原样暴露给模型，而应该按业务能力、权限边界和 AI 任务边界封装少量高内聚工具。
	- 例如可以拆成 Customer MCP、Order MCP、Ticket MCP、Finance MCP、Knowledge Base MCP。每个 MCP Server 背后可以调用一个或多个 Java 服务、数据库或第三方系统。
	- tool 设计要面向模型可理解的业务动作，例如 `get_customer_summary`、`get_recent_customer_tickets`、`get_order_delivery_status`、`assess_renewal_risk`。
	- 生产环境必须处理认证授权、参数校验、敏感字段脱敏、审批确认、审计日志、限流、错误恢复和人工介入。
- **回答结构**
	- 划分粒度：按业务能力和权限边界，不按所有接口机械映射。
	- tool 设计：语义清晰、输入输出明确、单一职责。
	- 后端关系：MCP Server 是 AI 接入层，背后仍调用 Java 服务、数据库或 SaaS。
	- 风险控制：权限、审计、审批、限流、脱敏、错误处理。
	- 协作分工：后端或平台团队管系统边界，大模型应用开发管场景和编排。
- **项目追问**
	- 一个 Java 服务是否对应一个 MCP Server？
		- 不一定。MCP Server 更适合按业务能力和权限边界设计，一个 MCP Server 可以聚合多个 Java 服务，一个 Java 服务也可以被多个 MCP Server 以不同权限暴露。
	- 谁负责写 MCP Server？
		- 小团队早期可能由大模型应用开发直接实现；生产环境通常由后端或平台团队负责安全、数据、事务和审计，大模型应用开发负责定义工具需求、Agent 流程和调用结果处理。
	- 为什么不要暴露太细的数据库查询工具？
		- 太细的工具增加模型选择难度，也放大越权、误操作和数据泄露风险。业务语义工具更容易控制权限、日志和输出范围。
- **关联知识**
	- [[Concept/MCP]]
	- [[Concept/Agent]]
	- [[Concept/上下文工程]]
	- [[Question/MCP 和 function calling 有什么区别]]
- **我的易错点**
	- 不要从后端接口清单倒推 MCP tool；应该从用户任务和业务权限倒推工具。
	- 不要只关注模型能不能调通，还要讲清楚权限、审计、审批和失败恢复。
- **来源**
	- [[Concept/MCP]]
	- [[Source/Model Context Protocol - Introduction]]
	- [[Source/Model Context Protocol - Architecture overview]]
	- [[Source/Model Context Protocol - Server concepts]]
	- [[2026_05_04]]