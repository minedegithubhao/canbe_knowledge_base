alias:: Cross-Attention, 交叉注意力, 大模型/Transformer/Decoder/Cross-Attention
type:: concept
domain:: [[MOC/Transformer]]
status:: seed
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- Cross-Attention 是 Decoder 在生成时关注 Encoder 输出的注意力机制，用来把输入序列的信息融合到输出生成中。

- **解决的问题**
	- 在 Encoder-Decoder 架构中，Decoder 需要一边生成目标序列，一边读取源输入信息。
	- Cross-Attention 提供了 Decoder 到 Encoder 表示的连接。

- **核心机制**
	- Query 来自 Decoder 当前状态。
	- Key 和 Value 来自 Encoder 输出。
	- Decoder 根据当前生成状态选择性读取输入信息。

- **典型流程**
	- Encoder 先编码输入。
	- Decoder 使用 Masked Self-Attention 处理已生成内容。
	- Cross-Attention 读取 Encoder 输出。
	- Decoder 继续生成目标 token。

- **项目中怎么用**
	- 翻译、摘要、改写等 Encoder-Decoder 任务常用 Cross-Attention。

- **面试表达**
	- Cross-Attention 的作用是什么？ #card
		- 它让 Decoder 在生成时读取 Encoder 的输出，把源输入的信息融合进目标序列生成中。

- **常见误区**
	- 误区：Cross-Attention 和 Self-Attention 一样。
		- Self-Attention 的 Q、K、V 来自同一序列；Cross-Attention 的 Query 来自 Decoder，Key/Value 来自 Encoder。

- **相关概念**
	- [[Concept/Encoder-Decoder]]
	- [[Concept/Self-Attention]]
	- [[Concept/Masked Self-Attention]]

- **来源**
	- [[大模型/Transformer/Decoder/Cross-Attention]]
