alias:: Token Token ID 词表 嵌入表关系
type:: question
domain:: [[MOC/Transformer]]
difficulty:: 中等
status:: practicing
created:: 2026-05-02
updated:: 2026-05-02

- **题目**
	- Token、Token ID、词表、嵌入表是什么关系？

- **标准回答**
	- Token 是文本被切分后的基本单位；Token ID 是 Token 在词表中的数字编号；词表负责 Token 和 Token ID 的相互映射；嵌入表负责把 Token ID 映射成向量。完整链路是：文本经过分词得到 Token 序列，查词表得到 Token ID 序列，Token ID 查嵌入表得到向量序列，然后进入 Transformer。

- **回答结构**
	- Token：文本片段。
	- Token ID：数字编号。
	- 词表：Token 和 ID 的映射字典。
	- 嵌入表：ID 到向量的参数矩阵。
	- 串起来讲完整输入链路。

- **项目追问**
	- 不同模型分词器不同，同一文本的 token 数可能不同。
	- 词表大小影响嵌入表行数和输出层大小。

- **关联知识**
	- [[Concept/Token]]
	- [[Concept/Token ID]]
	- [[Concept/词表]]
	- [[Concept/嵌入表]]
	- [[Concept/分词]]

- **我的易错点**
	- 不要把词表和嵌入表混成一个东西。

- **来源**
	- [[Token]]
	- [[大模型/Transformer/Token ID]]
	- [[大模型/Transformer/Vocab]]
	- [[Embedding Table]]
