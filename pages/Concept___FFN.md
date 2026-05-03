alias:: FFN, Feed Forward Network, 前馈神经网络, 大模型/Transformer/FFN
type:: concept
domain:: [[MOC/Transformer]]
status:: seed
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- FFN 是 Transformer 层中的前馈网络，对每个 token 位置独立做非线性特征变换。

- **解决的问题**
	- 注意力负责 token 间信息交互，FFN 负责对每个位置的表示做进一步非线性加工。

- **核心机制**
	- 通常由两层线性层和激活函数组成。
	- 对序列中每个位置共享同一组参数。
	- 不直接在不同 token 之间交换信息。

- **典型流程**
	- 输入每个 token 的上下文化向量。
	- 第一层线性变换升维。
	- 激活函数引入非线性。
	- 第二层线性变换回到模型维度。

- **项目中怎么用**
	- Encoder Layer 和 Decoder Layer 中都会有 FFN。

- **面试表达**
	- FFN 在 Transformer 里做什么？ #card
		- Attention 做 token 间信息交互，FFN 对每个 token 的表示做非线性变换，提升模型表达能力。

- **常见误区**
	- 误区：FFN 是用来建模 token 关系的。
		- token 关系主要由 Attention 建模，FFN 主要是位置级变换。

- **相关概念**
	- [[Concept/Encoder Layer]]
	- [[Concept/线性层]]
	- [[Concept/激活函数]]
	- [[Concept/神经网络]]

- **来源**
	- [[大模型/Transformer/FFN]]
