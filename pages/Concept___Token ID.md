alias:: Token ID, Token ID序列, 大模型/Transformer/Token ID
type:: concept
domain:: [[MOC/Transformer]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- Token ID 是 Token 在词表中的数字编号，模型实际接收的是这些编号对应的向量表示。

- **解决的问题**
	- 将离散的文本 token 转成可以查表和计算的数字。

- **核心机制**
	- 词表保存 token 和 id 的映射。
	- 分词器把 token 转成 Token ID。
	- Token ID 查询嵌入表得到初始向量。

- **典型流程**
	- Token 序列。
	- 查词表。
	- Token ID 序列。
	- 查嵌入表。
	- 向量序列。

- **项目中怎么用**
	- 分词器输出的 `input_ids` 就是 Token ID 序列。
	- 模型训练和推理都基于 Token ID 进行输入表示。

- **面试表达**
	- Token 和 Token ID 有什么区别？ #card
		- Token 是文本片段，Token ID 是这个文本片段在词表中的数字编号。模型不是直接处理字符串，而是处理 Token ID 对应的向量。

- **常见误区**
	- 误区：Token ID 本身就是语义向量。
		- Token ID 只是编号，语义表示来自嵌入表和模型计算。

- **相关概念**
	- [[Concept/Token]]
	- [[Concept/词表]]
	- [[Concept/嵌入表]]

- **来源**
	- [[大模型/Transformer/Token ID]]
	- [[Token ID序列]]
