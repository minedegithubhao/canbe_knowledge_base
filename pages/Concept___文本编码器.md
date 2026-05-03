alias:: Text Encoder, 文本编码器
type:: concept
domain:: [[MOC/Transformer]]
status:: growing
level:: 入门
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- 文本编码器是把文本转换成向量表示的模型，常见底层架构是 Transformer Encoder。

- **解决的问题**
	- 将文本转成可用于检索、分类、聚类、匹配的向量。

- **核心机制**
	- 文本分词。
	- Token ID 查嵌入表。
	- Encoder 编码上下文。
	- 池化或取特殊 token 得到句向量。

- **典型流程**
	- 输入文本。
	- 分词和嵌入。
	- Transformer Encoder 编码。
	- 输出文本向量。

- **项目中怎么用**
	- RAG 中 embedding 模型就是典型文本编码器。
	- 图文检索中 CLIP 的文本分支也是文本编码器。

- **面试表达**
	- 文本编码器做什么？ #card
		- 它把文本变成向量，用于语义检索、匹配、分类和聚类，常见底层是 Transformer Encoder。

- **常见误区**
	- 误区：文本编码器和生成模型一样。
		- 文本编码器更偏表示，生成模型更偏逐 token 生成。

- **相关概念**
	- [[Concept/Only-Encoder]]
	- [[Concept/Transformer Encoder]]
	- [[Concept/文本嵌入]]
	- [[Concept/池化]]

- **来源**
	- [[Text Encoder]]
