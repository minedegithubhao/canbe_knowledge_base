alias:: LangChain Expression Language
type:: concept
domain:: [[MOC/大模型应用工程]]
status:: stable
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- LCEL 是 LangChain 的声明式链式编排方式，用 Runnable、管道符和组合结构把 Prompt、模型、解析器、检索器等组件连接成可执行链。

- **解决的问题**
	- 让 LLM 应用流程从一堆手写调用变成可组合、可复用、可并行、可流式执行的链。
	- 统一串行、并行、透传、自定义函数和解析器的组合方式。

- **核心机制**
	- Runnable 是可执行单元，支持 `invoke`、批处理、异步和流式能力。
	- 管道符把前一步输出传给后一步，形成串行链。
	- `RunnableParallel` 让多个分支接收同一输入并并行执行。
	- `RunnablePassthrough` 用来保留原始输入，常见于 RAG 中同时传递问题和检索上下文。
	- `RunnableLambda` 可把普通函数包装进链路。

- **典型流程**
	- 定义 Prompt。
	- 接入模型。
	- 接入输出解析器。
	- 必要时增加检索分支、透传分支或自定义处理函数。
	- 用统一接口执行和调试。

- **项目中怎么用**
	- RAG 链里常用 LCEL 表达“问题进入检索器，同时保留原问题，再组合 Prompt，调用模型，解析输出”。
	- 评估链可把同一输入并行送到多个指标计算或多个模型评审。

- **面试表达**
	- LCEL 解决什么问题？ #card
		- LCEL 解决的是 LLM 应用流程编排问题。它把 Prompt、模型、检索器、工具函数和解析器都抽象成 Runnable，通过串行、并行和透传组合成可执行链。

- **常见误区**
	- 误区：LCEL 是新的模型能力。
		- LCEL 是应用编排方式，不改变模型本身能力。
	- 误区：链越长越工程化。
		- 链路太长会增加调试难度。稳定业务逻辑可以拆到普通函数或服务里，只把模型相关流程放入链。

- **相关概念**
	- [[Concept/LangChain]]
	- [[Concept/Prompt Chaining]]
	- [[Concept/RAG]]
	- [[Concept/Agent]]
	- [[Concept/上下文工程]]

- **来源**
	- [[LCEL]]
	- [[langchain的使用]]
	- [[Source/LangChain API Reference - Runnable]]
