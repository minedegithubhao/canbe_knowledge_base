alias:: Tokenization, 分词, 大模型/Transformer/分词
type:: concept
domain:: [[MOC/Transformer]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- 分词是把原始文本切成 Token，并进一步转换成 Token ID 的过程。

- **解决的问题**
	- 将自然语言字符串转换成模型可以处理的离散输入。

- **核心机制**
	- 文本被分词器切成 Token。
	- Token 通过词表映射为 Token ID。
	- 分词器还可能返回 attention_mask、token_type_ids 等辅助字段。

- **典型流程**
	- 文本。
	- 分词。
	- Token 序列。
	- 查词表。
	- Token ID 序列。
	- 转成张量输入模型。

- **项目中怎么用**
	- Prompt 长度、截断、padding、batch 输入都依赖分词器。
	- RAG 中 chunk size 常需要按 token 估算。

- **面试表达**
	- 分词在大模型输入中做什么？ #card
		- 分词把文本切成 Token，再通过词表转成 Token ID，最后模型通过嵌入表把 Token ID 转成向量。

- **常见误区**
	- 误区：不同模型的 token 数一定一样。
		- 不同模型的分词器和词表不同，同一句话的 token 数可能不同。

- **相关概念**
	- [[Concept/Token]]
	- [[Concept/Token ID]]
	- [[Concept/词表]]
	- [[Concept/张量]]

- **来源**
	- [[大模型/Transformer/分词]]
