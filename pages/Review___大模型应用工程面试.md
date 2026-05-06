alias:: LLM工程面试, LangChain面试, LCEL面试
type:: review
domain:: [[MOC/大模型应用工程]]
status:: active
created:: 2026-05-03
updated:: 2026-05-04

- **刷题入口**
	- [[Question/LCEL 解决什么问题]]
	- [[Question/LangChain 工具调用和 Agent 有什么区别]]
	- [[Question/Streamlit 适合什么场景]]
	- [[Question/MCP 和 function calling 有什么区别]]
	- [[Question/企业里 MCP Server 应该怎么设计]]
	- [[Question/如何高效使用 Codex 维护代码和知识库]]

- **短卡片**
	- LangChain 解决什么问题？ #card
		- 它把模型、Prompt、检索、解析器、工具和 Agent 编排成可组合组件，降低 LLM 应用工程组织成本。
	- LCEL 的核心是什么？ #card
		- 把每个步骤抽象成 Runnable，通过串行、并行、透传和自定义函数组合成可执行链。
	- Streamlit 的定位是什么？ #card
		- 快速构建 Python 数据应用和 LLM 原型界面，适合 Demo、内部工具和调试看板。
	- 工具调用和 Agent 的区别是什么？ #card
		- 工具调用是让模型调用单个外部能力；Agent 是围绕目标循环决策、调用工具、观察结果并推进任务。
	- MCP 是什么？ #card
		- MCP 是大模型应用连接外部工具、数据源和业务系统的标准协议，让 Agent 能以统一方式发现、读取和调用外部能力。
	- MCP 和 function calling 有什么区别？ #card
		- function calling 是模型调用函数的能力；MCP 是把外部工具、资源和提示词标准化暴露给 AI 应用的协议。
	- Codex 和普通聊天式代码助手有什么区别？ #card
		- 普通聊天式助手主要给建议或代码片段；Codex 是 coding agent，可以进入仓库上下文，读取文件、修改代码、运行命令、审查 diff，并围绕开发目标持续推进任务。

- **复习顺序**
	- 先会讲 [[Concept/LangChain]] 的框架定位。
	- 再会讲 [[Concept/LCEL]] 的串行、并行和透传。
	- 再结合 [[Concept/Agent]]、[[Concept/MCP]] 和 [[Concept/Codex使用指南]] 讲开发代理、工具调用与外部系统接入。
	- 最后结合 [[Concept/Streamlit]] 讲项目原型和演示。

- **项目入口**
	- [[Project/简易RAG系统]]
	- [[Project/智能客服RAG实战]]
	- [[Project/图文知识库]]
	- [[简易聊天机器人]]

- **关联知识**
	- [[MOC/大模型应用工程]]
	- [[MOC/大模型应用]]
	- [[Concept/LangChain]]
	- [[Concept/LCEL]]
	- [[Concept/Streamlit]]
	- [[Concept/MCP]]
	- [[Concept/Codex使用指南]]
