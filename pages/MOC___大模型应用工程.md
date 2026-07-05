alias:: LLM工程地图, LangChain地图, 大模型工程地图
type:: moc
domain:: [[MOC/大模型应用]]
status:: growing
created:: 2026-05-03
updated:: 2026-05-26

- **学习路径**
	- 先理解应用框架定位：[[Concept/LangChain]]
	- 再理解链式编排：[[Concept/LCEL]]
	- 再理解工具调用和 Agent：[[Concept/Agent]]
	- 再理解外部工具和业务系统接入：[[Concept/MCP]]
	- 再理解开发代理和工程协作：[[Concept/Codex使用指南]]
	- 再理解前端原型和演示：[[Concept/Streamlit]]
	- 最后回到项目：[[Project/简易RAG系统]]、[[Project/智能客服RAG实战]]

- **核心概念**
	- [[Concept/LangChain]]
	- [[Concept/LCEL]]
	- [[Concept/Streamlit]]
	- [[Concept/Agent]]
	- [[Concept/MCP]]
	- [[Concept/Codex使用指南]]
	- [[Concept/Prompt Chaining]]
	- [[Concept/上下文工程]]

- **项目实战**
	- [[Project/简易RAG系统]]
		- 用 LangChain 组织加载、切分、向量库、检索和生成。
	- [[Project/智能客服RAG实战]]
		- 可用 LangChain/LCEL 表达检索链、生成链和评估链。
	- [[简易聊天机器人]]
		- 旧页可作为 Streamlit 和 LangChain 组合的来源材料。

- **面试重点**
	- [[Review/大模型应用工程面试]]
	- [[Question/LCEL 解决什么问题]]
	- [[Question/LangChain 工具调用和 Agent 有什么区别]]
	- [[Question/Streamlit 适合什么场景]]
	- [[Question/MCP 和 function calling 有什么区别]]
	- [[Question/企业里 MCP Server 应该怎么设计]]
	- [[Question/如何高效使用 Codex 维护代码和知识库]]

- **旧页面迁移索引**
	- 已迁移：[[LCEL]]、[[langchain的使用]]、[[Streamlit]]
	- 相关来源：[[简易聊天机器人]]、[[简易RAG系统]]

- **最近更新**
	- 2026-05-04
		- 新增 [[Concept/MCP]]、[[Question/MCP 和 function calling 有什么区别]] 和 [[Question/企业里 MCP Server 应该怎么设计]]，接入 Model Context Protocol 官方资料。
	- 2026-05-03
		- 新增 [[Concept/Codex使用指南]] 和 [[Question/如何高效使用 Codex 维护代码和知识库]]，接入 Codex CLI、Codex web 和 OpenAI code generation 官方资料。
	- 2026-05-03
		- 建立大模型应用工程 MOC，接入 LangChain、LCEL、Streamlit 和面试复习入口。

- **后续深挖**
	- LangGraph、LangSmith、部署、可观测性、测试和评估流水线。
	- Codex cloud 环境配置、审批模式和 CI/CD 自动化实践。
