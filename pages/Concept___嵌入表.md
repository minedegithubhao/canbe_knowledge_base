alias:: Embedding Table, 嵌入表
type:: concept
domain:: [[MOC/Transformer]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- 嵌入表是把 Token ID 映射成初始向量的参数矩阵。

- **解决的问题**
	- Token ID 只是离散编号，不能直接表示语义；嵌入表把编号转成模型可计算的连续向量。

- **核心机制**
	- 行数通常对应词表大小。
	- 列数对应向量维度。
	- 每个 Token ID 查到一行向量。

- **典型流程**
	- Token ID。
	- 查嵌入表。
	- 得到初始 token 向量。
	- 进入 Transformer。

- **项目中怎么用**
	- 语言模型输入层和输出层都与词表、嵌入维度密切相关。

- **面试表达**
	- 词表和嵌入表有什么区别？ #card
		- 词表负责 Token 和 Token ID 的映射，嵌入表负责 Token ID 到向量的映射。词表是字典，嵌入表是模型参数矩阵。

- **常见误区**
	- 误区：Token ID 越大语义越强。
		- Token ID 只是编号，语义来自嵌入向量和后续 Transformer 计算。

- **相关概念**
	- [[Concept/词表]]
	- [[Concept/Token ID]]
	- [[Concept/向量]]

- **来源**
	- [[Embedding Table]]
	- [[初始向量]]
