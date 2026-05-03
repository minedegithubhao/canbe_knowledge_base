alias:: Softmax, 大模型/Transformer/Softmax
type:: concept
domain:: [[MOC/Transformer]]
status:: seed
level:: 入门
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- Softmax 是把一组分数转换成概率分布的函数，输出值非负且总和为 1。

- **解决的问题**
	- 将注意力分数转换为注意力权重。
	- 将模型输出 logits 转换为 token 概率。

- **核心机制**
	- 对每个分数取指数。
	- 再除以所有指数值之和。
	- 分数越大，转换后的概率越高。

- **典型流程**
	- 注意力中：QK 分数经过 Softmax 得到权重。
	- 生成中：输出 logits 经过 Softmax 得到下一个 token 的概率分布。

- **项目中怎么用**
	- 注意力权重计算。
	- 分类和生成概率计算。

- **面试表达**
	- Softmax 在注意力里有什么用？ #card
		- 它把注意力分数归一化成权重，让模型知道不同 token 应该被关注的比例。

- **常见误区**
	- 误区：Softmax 改变排序。
		- 它通常保持分数大小顺序，但把分数变成概率分布。

- **相关概念**
	- [[Concept/Self-Attention]]
	- [[Concept/线性层]]
	- [[Concept/激活函数]]
	- [[Concept/交叉熵]]

- **来源**
	- [[大模型/Transformer/Softmax]]
