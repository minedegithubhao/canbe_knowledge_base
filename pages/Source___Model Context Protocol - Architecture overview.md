type:: source
source-type:: documentation
author:: Model Context Protocol
url:: https://modelcontextprotocol.io/docs/learn/architecture
published::
accessed:: 2026-05-04
created:: 2026-05-04
updated:: 2026-05-04
status:: compiled

- **原始信息**
	- 官方架构文档说明 MCP 的 client-server 架构、参与者、分层、生命周期和核心 primitives。
	- MCP Host 是协调多个 MCP Client 的 AI 应用。
	- MCP Client 负责维护到某个 MCP Server 的连接。
	- MCP Server 是向 MCP Client 提供上下文能力的程序，可以本地运行，也可以远程运行。

- **核心观点**
	- MCP 关注上下文交换协议本身，不规定 AI 应用如何使用 LLM 或管理上下文。
	- MCP 包含数据层和传输层。
	- 数据层基于 JSON-RPC，处理生命周期、能力协商、工具、资源、提示词、通知等能力。
	- 传输层处理通信通道和认证，常见机制包括 stdio 和 Streamable HTTP。
	- Server 侧核心 primitives 包括 tools、resources 和 prompts。

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
	- MCP 的安全风险需要单独沉淀为权限、prompt injection、tool poisoning 和供应链安全相关问题。
