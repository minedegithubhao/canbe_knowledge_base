alias:: LCEL 面试, LangChain Expression Language 面试
type:: question
domain:: [[MOC/大模型应用工程]]
difficulty:: 中
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- LCEL 解决什么问题？

- **标准回答**
	- LCEL 解决的是 LLM 应用流程编排问题。它把 Prompt、模型、检索器、解析器和自定义函数抽象成 Runnable，用管道符表达串行流程，用 `RunnableParallel` 表达并行分支，用 `RunnablePassthrough` 保留原始输入。
	- 在 RAG 中，LCEL 常用于把用户问题一边送入检索器生成上下文，一边透传原问题，再组合 Prompt、调用模型并解析输出。

- **回答结构**
	- 先定义：LangChain 的声明式编排方式。
	- 再讲抽象：Runnable。
	- 再讲组合：串行、并行、透传、自定义函数。
	- 最后落到 RAG 链和评估链。

- **项目追问**
	- LCEL 和普通 Python 函数有什么区别？
		- 普通 Python 更自由，LCEL 提供统一 Runnable 接口、组合方式、批处理、流式和可观测性接入。稳定业务逻辑仍然可以放普通函数。

- **关联知识**
	- [[Concept/LCEL]]
	- [[Concept/LangChain]]
	- [[Concept/RAG]]
	- [[Concept/Prompt Chaining]]

- **我的易错点**
	- 不要把 LCEL 讲成模型能力。
	- 不要只背管道符，要讲清楚 Runnable 和组合方式。

- **来源**
	- [[Concept/LCEL]]
	- [[LCEL]]
	- [[langchain的使用]]
	- [[Source/LangChain API Reference - Runnable]]
