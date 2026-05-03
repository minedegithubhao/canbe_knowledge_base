alias:: Token, 词元, token序列
type:: concept
domain:: [[MOC/Transformer]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- Token 是模型处理文本时的基本文字单位，可以是字、词、子词或符号片段。

- **解决的问题**
	- 让自然语言文本变成模型可以编号和计算的离散单位。

- **核心机制**
	- 文本经过分词器切成 token。
	- 每个 token 在词表中对应一个 Token ID。
	- Token ID 再通过嵌入表变成向量。

- **典型流程**
	- 文本。
	- 分词。
	- Token 序列。
	- Token ID 序列。
	- 向量序列。

- **项目中怎么用**
	- 上下文长度、计费、截断、Prompt 设计都和 token 数有关。

- **面试表达**
	- Token 是什么？ #card
		- Token 是模型处理文本的基本单位，文本会先被分词器切成 token，再映射为 Token ID，最后转成向量进入模型。

- **常见误区**
	- 误区：Token 一定等于一个汉字或一个单词。
		- Token 可以是字、词、子词或符号片段，取决于分词器。

- **相关概念**
	- [[Concept/Token ID]]
	- [[Concept/词表]]
	- [[Concept/分词]]

- **来源**
	- [[Token]]
	- [[token序列]]
