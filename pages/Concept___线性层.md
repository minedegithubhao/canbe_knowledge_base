alias:: Linear Layer, 线性层, 大模型/Transformer/线性层
type:: concept
domain:: [[MOC/Transformer]]
status:: seed
level:: 入门
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- 线性层是一种对输入向量做矩阵乘法和偏置变换的神经网络层。

- **解决的问题**
	- 将向量从一个维度映射到另一个维度。
	- 学习不同特征之间的线性组合。

- **核心机制**
	- 输出等于输入乘以权重矩阵，再加偏置。
	- Transformer 中 Q、K、V 投影和 FFN 都会用到线性层。

- **典型流程**
	- 输入向量。
	- 乘权重矩阵。
	- 加偏置。
	- 输出新向量。

- **项目中怎么用**
	- 注意力里的 Q/K/V 投影。
	- FFN 的升维和降维。
	- 输出层把隐藏状态映射到词表 logits。

- **面试表达**
	- 线性层在 Transformer 里有什么用？ #card
		- 它用来做向量空间变换，例如生成 Q/K/V、FFN 升维降维，以及最后把隐藏状态映射到词表 logits。

- **常见误区**
	- 误区：线性层只出现在普通神经网络里。
		- Transformer 里的注意力和 FFN 都大量使用线性层。

- **相关概念**
	- [[Concept/FFN]]
	- [[Concept/Self-Attention]]
	- [[Concept/神经网络]]
	- [[Concept/激活函数]]

- **来源**
	- [[大模型/Transformer/线性层]]
