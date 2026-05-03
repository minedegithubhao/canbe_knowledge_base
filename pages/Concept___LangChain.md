alias:: langchain的使用, LangChain AI, LangChain框架
type:: concept
domain:: [[MOC/大模型应用工程]]
status:: growing
level:: 项目可用
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- LangChain 是用于构建 LLM 应用和 Agent 的开源框架，提供模型接口、提示模板、输出解析、工具调用、检索和链式编排等组件。

- **解决的问题**
	- 统一不同模型供应商的调用方式。
	- 把 Prompt、模型、解析器、检索器、工具和记忆等组件组合成应用流程。
	- 降低从聊天 Demo 到 RAG、Agent、工作流应用的工程组织成本。

- **核心机制**
	- Model：封装不同模型的调用。
	- Prompt：组织系统提示、用户输入和变量。
	- Output Parser：把模型输出转成字符串、JSON、Pydantic 对象等结构。
	- Tool：把普通函数或外部能力暴露给模型调用。
	- Agent：让模型根据目标选择工具、执行动作并汇总结果。
	- [[Concept/LCEL]]：用 Runnable 和管道组合任务流程。

- **典型流程**
	- 定义模型和提示模板。
	- 组合模型、解析器、检索器或工具。
	- 用 `invoke`、批处理、流式输出等方式执行。
	- 接入日志、评估、异常处理和权限控制。

- **项目中怎么用**
	- RAG 项目中，用 LangChain 组织加载、切分、Embedding、向量库、检索和生成。
	- Agent 项目中，用工具调用和 Agent 执行器组织外部系统操作。
	- 原型阶段可结合 [[Concept/Streamlit]] 快速做演示页面。

- **面试表达**
	- LangChain 解决什么问题？ #card
		- LangChain 不是模型本身，而是 LLM 应用工程框架。它把模型、Prompt、检索、工具、解析器和编排统一成可组合组件，方便构建 RAG、Agent 和自动化工作流。

- **常见误区**
	- 误区：用了 LangChain 就等于工程成熟。
		- LangChain 解决组件和编排问题，生产系统还要补充权限、稳定性、监控、评估、成本控制和异常兜底。
	- 误区：所有逻辑都要塞进 LangChain。
		- 稳定业务逻辑可以保留在普通代码里，LangChain 更适合模型相关的上下文、工具和链式调用。

- **相关概念**
	- [[Concept/LCEL]]
	- [[Concept/Agent]]
	- [[Concept/Prompt Engineering]]
	- [[Concept/上下文工程]]
	- [[Concept/RAG]]
	- [[Concept/Streamlit]]

- **来源**
	- [[langchain的使用]]
	- [[Source/LangChain Docs - Overview]]
	- [[Source/LangChain API Reference - Runnable]]
