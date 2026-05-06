type:: source
source-type:: documentation
author:: Model Context Protocol
url:: https://modelcontextprotocol.io/docs/learn/server-concepts
published::
accessed:: 2026-05-04
created:: 2026-05-04
updated:: 2026-05-04
status:: compiled

- **原始信息**
	- 官方 Server concepts 文档解释 MCP Server 如何通过标准协议接口向 AI 应用暴露能力。
	- 文档把 server 能力分为 tools、resources 和 prompts 三类。

- **核心观点**
	- tools 是模型可以主动调用的动作接口，适合写数据库、调用外部 API、修改文件或触发业务逻辑。
	- resources 是应用驱动读取的上下文数据源，适合文件、数据库 schema、API 文档和知识库内容。
	- prompts 是用户显式调用的可复用模板，用于约束特定工作流。
	- tools 应有 schema 定义，MCP 使用 JSON Schema 做参数验证。
	- tool 执行可以要求用户确认，应用也可以通过权限、审批和活动日志控制风险。

- **可沉淀的概念**
	- [[Concept/MCP]]
	- [[Concept/Agent]]
	- [[Concept/上下文工程]]

- **已更新页面**
	- [[Concept/MCP]]
	- [[Question/MCP 和 function calling 有什么区别]]
	- [[Question/企业里 MCP Server 应该怎么设计]]
	- [[MOC/大模型应用工程]]
	- [[Review/大模型应用工程面试]]

- **待追问问题**
	- MCP Server 中 tools、resources、prompts 的权限和 UI 控制边界还可以结合具体客户端继续整理。
