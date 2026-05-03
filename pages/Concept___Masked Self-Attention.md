alias:: Masked Self-Attention, 掩码自注意力, 大模型/Transformer/Decoder/Masked Self-Attention
type:: concept
domain:: [[MOC/Transformer]]
status:: seed
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- Masked Self-Attention 是带因果掩码的自注意力，让当前位置只能关注自己和之前的 token，不能看到未来 token。

- **解决的问题**
	- 防止生成模型在训练或生成时偷看未来答案。
	- 支持自回归的逐 token 生成。

- **核心机制**
	- 在注意力分数上加入 mask。
	- 未来位置被屏蔽，Softmax 后权重接近 0。
	- 当前 token 只能基于历史上下文预测下一个 token。

- **典型流程**
	- 输入已有 token 序列。
	- 计算注意力分数。
	- 对未来 token 位置加 mask。
	- 聚合允许看到的 Value。
	- 输出用于预测下一个 token。

- **项目中怎么用**
	- Decoder-only 生成模型使用它完成自回归生成。

- **面试表达**
	- Self-Attention 和 Masked Self-Attention 有什么区别？ #card
		- Self-Attention 可以看同一序列中的所有 token；Masked Self-Attention 会屏蔽未来 token，让当前位置只能看历史上下文，因此适合生成模型。

- **常见误区**
	- 误区：Mask 是为了删除 padding。
		- 这里的 mask 主要是因果 mask；padding mask 是另一个常见用途。

- **相关概念**
	- [[Concept/Self-Attention]]
	- [[Concept/Only-Decoder]]

- **来源**
	- [[大模型/Transformer/Decoder/Masked Self-Attention]]
