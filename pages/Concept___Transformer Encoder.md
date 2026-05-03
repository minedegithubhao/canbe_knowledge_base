alias:: Transformer Encoder, Encoder, 编码器块, 大模型/Transformer/Transformer Encoder
type:: concept
domain:: [[MOC/Transformer]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- Transformer Encoder 是由多层 Encoder Layer 堆叠形成的编码器，用来把输入 token 向量序列编码成上下文化表示。

- **解决的问题**
	- 将原始 token 向量转换成包含上下文信息的表示。
	- 为分类、检索、匹配、embedding 和理解类任务提供语义特征。

- **核心机制**
	- 多层 [[Concept/Encoder Layer]] 堆叠。
	- 每层通常包含 [[Concept/Self-Attention]]、[[Concept/FFN]]、残差和归一化。

- **典型流程**
	- 输入 token 向量序列。
	- 每层 Encoder Layer 更新每个 token 的表示。
	- 输出上下文化 token 表示或 pooled 表示。

- **项目中怎么用**
	- BERT、文本编码器、Embedding 模型和部分图像编码器都依赖 Encoder 思路。

- **面试表达**
	- Transformer Encoder 是什么？ #card
		- 它是多层 Encoder Layer 的堆叠，用 Self-Attention 和 FFN 把输入 token 向量序列编码成带上下文的表示，常用于理解和表示类任务。

- **常见误区**
	- 误区：Encoder 只输出一个向量。
		- Encoder 通常输出每个 token 的上下文化向量，是否池化成一个向量取决于任务。

- **相关概念**
	- [[Concept/Encoder Layer]]
	- [[Concept/Self-Attention]]
	- [[Concept/FFN]]
	- [[Concept/Only-Encoder]]

- **来源**
	- [[大模型/Transformer/Transformer Encoder]]
