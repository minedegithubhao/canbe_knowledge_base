alias:: Encoder-Decoder, 编码器-解码器
type:: concept
domain:: [[MOC/Transformer]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- Encoder-Decoder 是先用 Encoder 理解输入，再用 Decoder 生成输出的 Transformer 架构。

- **解决的问题**
	- 适合输入和输出结构不同的任务，例如翻译、摘要、改写和序列到序列生成。
	- Encoder 负责理解源序列，Decoder 负责生成目标序列。

- **核心机制**
	- Encoder 使用 Self-Attention 编码输入。
	- Decoder 使用 Masked Self-Attention 生成目标序列。
	- Decoder 通过 [[Concept/Cross-Attention]] 读取 Encoder 的输出。

- **典型流程**
	- 输入文本进入 Encoder。
	- Encoder 输出上下文表示。
	- Decoder 自回归生成输出。
	- Cross-Attention 在生成时融合输入信息。

- **项目中怎么用**
	- T5、BART 等模型属于 Encoder-Decoder 架构。
	- 适合强输入约束的生成任务，例如翻译和摘要。

- **面试表达**
	- Encoder-Decoder 和 Only-Decoder 的区别是什么？ #card
		- Encoder-Decoder 先编码输入，再由 Decoder 生成输出，并通过 Cross-Attention 读取 Encoder 信息；Only-Decoder 通常只用一个 Decoder 堆叠，直接基于上下文自回归生成。

- **常见误区**
	- 误区：Encoder-Decoder 的 Decoder 和 Only-Decoder 完全一样。
		- Encoder-Decoder 的 Decoder 里通常多了 Cross-Attention，用来读取 Encoder 输出。

- **相关概念**
	- [[Concept/Only-Encoder]]
	- [[Concept/Only-Decoder]]
	- [[Concept/Cross-Attention]]

- **来源**
	- [[Encoder-Decoder]]
