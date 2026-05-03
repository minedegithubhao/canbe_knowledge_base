alias:: Transformer 为什么适合大模型
type:: question
domain:: [[MOC/Transformer]]
difficulty:: 中等
status:: practicing
created:: 2026-05-02
updated:: 2026-05-02

- **题目**
	- 为什么 Transformer 适合大模型？

- **标准回答**
	- Transformer 适合大模型，核心原因是它能并行处理序列，训练效率比传统逐步处理序列的结构更好；Self-Attention 能动态建模任意 token 之间的关系，适合学习长距离依赖和上下文语义；多层堆叠后可以形成强大的表示和生成能力。因此 Transformer 可以在大规模数据和参数下持续扩展能力。

- **回答结构**
	- 并行训练。
	- 注意力建模 token 关系。
	- 多层堆叠形成强表示。
	- 能扩展到大数据和大参数。

- **项目追问**
	- 生成型大模型通常使用 Decoder-only。
	- 表示型模型通常使用 Encoder-only。
	- 多模态模型也可以把图片、音频等转成序列交给 Transformer 处理。

- **关联知识**
	- [[Concept/Transformer]]
	- [[Concept/Self-Attention]]
	- [[Concept/Only-Decoder]]
	- [[Concept/Only-Encoder]]
	- [[Concept/多模态LLM]]

- **我的易错点**
	- 不要只说“参数多”，要说清楚架构为什么能扩展。

- **来源**
	- [[Transformer]]
	- [[大模型分类]]
