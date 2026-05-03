alias:: Encoder Layer, 编码器层, 大模型/Transformer/Encoder/Encoder Layer
type:: concept
domain:: [[MOC/Transformer]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- Encoder Layer 是 Transformer Encoder 的基本层，通常由 Self-Attention、FFN、残差连接和归一化组成。

- **解决的问题**
	- 让每个 token 表示同时吸收上下文信息和非线性特征变换。
	- 通过多层堆叠逐步形成更抽象的语义表示。

- **核心机制**
	- [[Concept/Self-Attention]] 负责 token 间信息交互。
	- [[Concept/FFN]] 负责对每个位置做非线性变换。
	- 残差连接保留原始信息并帮助梯度传播。
	- 归一化提高训练稳定性。

- **典型流程**
	- 输入向量序列。
	- Self-Attention 更新上下文表示。
	- 残差和归一化。
	- FFN 进一步变换。
	- 残差和归一化后输出。

- **项目中怎么用**
	- 多层 Encoder Layer 组成 Transformer Encoder。

- **面试表达**
	- Transformer Encoder 一层包含什么？ #card
		- 通常包含 Self-Attention、FFN、残差连接和归一化。Self-Attention 做上下文交互，FFN 做位置级非线性变换。

- **常见误区**
	- 误区：Encoder Layer 只有 Attention。
		- Attention 只是其中一部分，FFN 和稳定训练结构也很关键。

- **相关概念**
	- [[Concept/Transformer Encoder]]
	- [[Concept/Self-Attention]]
	- [[Concept/FFN]]

- **来源**
	- [[大模型/Transformer/Encoder/Encoder Layer]]
