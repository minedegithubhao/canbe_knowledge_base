alias:: 自注意力和掩码自注意力区别
type:: question
domain:: [[MOC/Transformer]]
difficulty:: 中等
status:: practicing
created:: 2026-05-02
updated:: 2026-05-02

- **题目**
	- Self-Attention 和 Masked Self-Attention 有什么区别？

- **标准回答**
	- Self-Attention 让每个 token 可以根据相关性关注同一序列中的其他 token，用来聚合上下文信息。Masked Self-Attention 在 Self-Attention 的基础上加入因果 mask，屏蔽未来 token，让当前位置只能看到自己和之前的 token，因此适合自回归生成。

- **回答结构**
	- 先说共同点：都基于 Q、K、V 计算注意力。
	- 再说差异：是否能看到未来 token。
	- 再说用途：Encoder 理解 vs Decoder 生成。

- **项目追问**
	- Decoder-only 模型必须用 mask 防止训练时偷看答案。
	- padding mask 和 causal mask 是不同用途。

- **关联知识**
	- [[Concept/Self-Attention]]
	- [[Concept/Masked Self-Attention]]
	- [[Concept/Only-Decoder]]

- **我的易错点**
	- 不要把 causal mask 和 padding mask 混为一谈。

- **来源**
	- [[大模型/Transformer/Self-Attention]]
	- [[大模型/Transformer/Decoder/Masked Self-Attention]]
