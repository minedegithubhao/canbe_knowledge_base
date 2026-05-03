alias:: Large Language Model, LLM, 大语言模型, 大模型
type:: concept
domain:: [[MOC/大模型]]
status:: growing
level:: 入门
created:: 2026-05-02
updated:: 2026-05-03

- **一句话定义**
	- 大模型是参数规模大、在大量数据上训练、能处理语言或多模态任务的基础模型；常见 LLM 主要基于 Transformer 架构。

- **解决的问题**
	- 把语言理解、生成、问答、摘要、分类、代码生成等任务统一到一个通用模型能力中。
	- 通过预训练获得通用知识和语言能力，再通过提示词、RAG、微调、Agent 等方式适配具体应用。

- **核心机制**
	- 文本先经过 [[Concept/分词]]，变成 [[Concept/Token]] 和 [[Concept/Token ID]]。
	- Token ID 通过 [[Concept/嵌入表]] 变成 [[Concept/向量]]。
	- 向量序列进入 [[Concept/Transformer]]，通过注意力和前馈网络建模上下文关系。
	- 生成型模型通常逐 token 预测下一个 token。

- **典型流程**
	- 输入文本。
	- 分词并转成 Token ID。
	- Token ID 查嵌入表得到向量序列。
	- Transformer 层处理上下文。
	- 输出分类结果、向量表示或生成文本。

- **项目中怎么用**
	- RAG 项目中，大模型负责基于检索证据生成答案。
	- Embedding 项目中，编码器模型负责把文本或图片编码为向量。
	- Agent 项目中，大模型负责理解任务、规划步骤和调用工具。
	- Prompt 和上下文工程负责把任务、证据、历史状态和约束组织成模型可用输入。
	- LangChain 和 LCEL 可用于把模型调用、Prompt、检索、工具和解析器组织成工程链路。

- **面试表达**
	- LLM 和 RAG 的区别是什么？ #card
		- LLM 是负责理解和生成的模型本体，RAG 是围绕 LLM 的应用架构。RAG 先从外部知识库检索证据，再把证据放进 Prompt 让 LLM 回答。
	- 大模型输入文本后发生了什么？ #card
		- 文本先被分词成 Token，再转成 Token ID；Token ID 查询嵌入表得到向量序列，向量序列进入 Transformer，最后输出表示、分类或生成结果。

- **常见误区**
	- 误区：大模型等于 RAG。
		- RAG 是让大模型接入外部知识的一种应用架构，不是模型本身。
	- 误区：大模型直接处理中文字符串。
		- 模型实际处理的是 Token ID 和向量。

- **相关概念**
	- [[Concept/Transformer]]
	- [[Concept/Token]]
	- [[Concept/分词]]
	- [[Concept/嵌入表]]
	- [[Concept/RAG]]
	- [[Concept/Prompt Engineering]]
	- [[Concept/上下文工程]]
	- [[Concept/Agent]]
	- [[Concept/LangChain]]
	- [[Concept/LCEL]]
	- [[Concept/Streamlit]]

- **来源**
	- [[大模型]]
	- [[大模型分类]]
