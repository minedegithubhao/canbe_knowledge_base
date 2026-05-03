alias:: 生成型大模型, Generative LLM, 大模型/Transformer/生成型
type:: concept
domain:: [[MOC/Transformer]]
status:: seed
level:: 入门
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- 生成型大模型主要根据上下文逐 token 生成文本、代码或其他内容。

- **解决的问题**
	- 生成回答、续写、摘要、代码、计划、工具调用参数等输出。

- **核心机制**
	- 常见架构是 [[Concept/Only-Decoder]] 或 [[Concept/Encoder-Decoder]]。
	- Decoder-only 通过 Masked Self-Attention 自回归生成。
	- Encoder-Decoder 先理解输入，再生成输出。

- **典型流程**
	- 输入 prompt。
	- 模型预测下一个 token。
	- token 加入上下文。
	- 循环直到结束。

- **项目中怎么用**
	- Chatbot、RAG 回答生成、Agent 规划、代码生成。

- **面试表达**
	- 生成型大模型为什么常用 Decoder-only？ #card
		- Decoder-only 使用 Masked Self-Attention，可以基于历史上下文逐 token 预测下一个 token，天然适合自回归生成。

- **常见误区**
	- 误区：生成型模型只会生成，不会理解。
		- 它也能理解上下文，但训练目标和使用方式更偏生成。

- **相关概念**
	- [[Concept/Only-Decoder]]
	- [[Concept/Encoder-Decoder]]
	- [[Concept/Masked Self-Attention]]

- **来源**
	- [[大模型/Transformer/生成型]]
