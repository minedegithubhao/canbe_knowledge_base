alias:: Encoder Layer 包含什么, Transformer Encoder Layer
type:: question
domain:: [[MOC/Transformer]]
difficulty:: 中等
status:: practicing
created:: 2026-05-02
updated:: 2026-05-02

- **题目**
	- Transformer Encoder 一层包含什么？

- **标准回答**
	- Transformer Encoder 的一层通常包含 Self-Attention、FFN、残差连接和归一化。Self-Attention 负责让 token 之间交互上下文信息，FFN 对每个位置的表示做非线性变换，残差连接和归一化帮助深层网络稳定训练。

- **回答结构**
	- 先列组件：Self-Attention、FFN、残差、归一化。
	- 再讲分工：交互、变换、稳定训练。
	- 最后说明多层堆叠形成 Transformer Encoder。

- **项目追问**
	- Decoder 层相比 Encoder 层会多 Masked Self-Attention，Encoder-Decoder 中还会有 Cross-Attention。

- **关联知识**
	- [[Concept/Transformer Encoder]]
	- [[Concept/Encoder Layer]]
	- [[Concept/Self-Attention]]
	- [[Concept/FFN]]

- **我的易错点**
	- 不要只说 Attention，FFN 和稳定训练结构也要说。

- **来源**
	- [[大模型/Transformer/Transformer Encoder]]
	- [[大模型/Transformer/Encoder/Encoder Layer]]
