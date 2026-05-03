alias:: Self-Attention, 自注意力, 大模型/Transformer/Self-Attention
type:: concept
domain:: [[MOC/Transformer]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- Self-Attention 是让序列中每个 token 根据相关性从同一序列的其他 token 聚合信息的机制。

- **解决的问题**
	- 让模型动态判断当前 token 应该关注上下文中的哪些 token。
	- 建模长距离依赖和上下文关系。

- **核心机制**
	- 每个 token 生成 Query、Key、Value。
	- Query 和 Key 计算相关性分数。
	- 分数经过 Softmax 得到注意力权重。
	- 权重加权 Value 得到新的 token 表示。

- **典型流程**
	- 输入 token 向量序列。
	- 计算 Q、K、V。
	- 计算注意力分数。
	- Softmax 归一化。
	- 加权求和得到输出。

- **项目中怎么用**
	- Transformer Encoder 和 Decoder 都大量使用注意力机制。
	- Encoder 中通常可以双向关注全部 token。

- **面试表达**
	- Self-Attention 在做什么？ #card
		- 它让每个 token 根据和其他 token 的相关性分配注意力权重，再聚合其他 token 的 Value，从而得到包含上下文信息的新表示。

- **常见误区**
	- 误区：Self-Attention 只看相邻 token。
		- 它可以直接计算任意两个 token 的关系，是否屏蔽未来 token 取决于 mask。

- **相关概念**
	- [[Concept/Masked Self-Attention]]
	- [[Concept/Cross-Attention]]
	- [[Concept/Softmax]]

- **来源**
	- [[大模型/Transformer/Self-Attention]]
