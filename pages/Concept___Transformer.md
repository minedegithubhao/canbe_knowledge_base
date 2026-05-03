alias:: Transformer, 大模型/Transformer
type:: concept
domain:: [[MOC/Transformer]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- Transformer 是一种以注意力机制为核心的神经网络架构，能并行处理序列并建模 token 之间的关系，是现代大模型的主流基础架构。

- **解决的问题**
	- 相比传统 RNN，Transformer 更适合并行训练。
	- 注意力机制可以让模型根据上下文动态关注相关 token。
	- 堆叠多层 Transformer 后，模型能逐层抽取语义、结构和任务相关特征。

- **核心机制**
	- 输入是 token 向量序列。
	- [[Concept/Self-Attention]] 建模序列内部 token 之间的关系。
	- [[Concept/FFN]] 对每个位置做非线性变换。
	- 残差连接和归一化帮助深层网络稳定训练。
	- 生成模型使用 [[Concept/Masked Self-Attention]] 防止看到未来 token。

- **典型流程**
	- 文本变成 Token ID。
	- Token ID 查 [[Concept/嵌入表]] 得到向量。
	- 向量序列进入 Transformer 层。
	- 每层执行注意力、FFN、残差和归一化。
	- 输出上下文化表示或下一 token 概率。

- **项目中怎么用**
	- LLM 生成模型常用 [[Concept/Only-Decoder]]。
	- BERT 类理解模型常用 [[Concept/Only-Encoder]]。
	- T5/BART 类模型常用 [[Concept/Encoder-Decoder]]。
	- 文本编码器、图片编码器、Embedding 模型底层也常使用 Transformer 变体。

- **面试表达**
	- 为什么 Transformer 适合大模型？ #card
		- Transformer 能并行处理序列，注意力机制能动态建模 token 之间的关系，堆叠后可以学习复杂语义和上下文表示，所以适合扩展到大规模参数和大规模数据。
	- Transformer 的一层通常包含什么？ #card
		- 通常包含注意力模块、FFN、残差连接和归一化。Encoder 层主要是 Self-Attention + FFN，Decoder 层会使用 Masked Self-Attention，Encoder-Decoder 里还会有 Cross-Attention。

- **常见误区**
	- 误区：Transformer 只用于文本。
		- 图像、语音和多模态模型也可以使用 Transformer 变体。
	- 误区：注意力就是全部。
		- 注意力是核心，但 FFN、残差、归一化、位置编码和训练目标同样重要。

- **相关概念**
	- [[Concept/Self-Attention]]
	- [[Concept/Masked Self-Attention]]
	- [[Concept/Cross-Attention]]
	- [[Concept/FFN]]
	- [[Concept/Only-Decoder]]
	- [[Concept/Only-Encoder]]

- **来源**
	- [[Transformer]]
	- [[大模型分类]]
