alias:: Vocab, Vocabulary, 词表, 大模型/Transformer/Vocab
type:: concept
domain:: [[MOC/Transformer]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- 词表是 Token 和 Token ID 之间的映射表。

- **解决的问题**
	- 让分词后的文本单位可以转换成数字编号。
	- 让模型输出的 Token ID 可以转换回文本。

- **核心机制**
	- token 到 id。
	- id 到 token。
	- 分词器依赖词表完成编码和解码。

- **典型流程**
	- 编码：Token 查词表得到 Token ID。
	- 解码：Token ID 查词表还原成 Token。

- **项目中怎么用**
	- 不同模型可能使用不同词表和分词器。
	- 词表大小会影响嵌入表行数和输出层大小。

- **面试表达**
	- 词表是什么？ #card
		- 词表是 Token 和 Token ID 的映射字典，分词器用它把文本 token 编码成数字，也能把数字解码回文本。

- **常见误区**
	- 误区：词表就是嵌入表。
		- 词表是 token 和 id 的映射；嵌入表是 id 到向量的参数矩阵。

- **相关概念**
	- [[Concept/Token]]
	- [[Concept/Token ID]]
	- [[Concept/嵌入表]]

- **来源**
	- [[大模型/Transformer/Vocab]]
