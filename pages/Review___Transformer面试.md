alias:: Transformer面试题, 大模型基础面试, Transformer刷题
type:: review
domain:: [[MOC/Transformer]]
status:: active
updated:: 2026-05-02

- **怎么刷**
	- 第一轮刷大模型输入链路：Token、Token ID、词表、嵌入表、向量。
	- 第二轮刷 Transformer 结构：Self-Attention、FFN、Encoder Layer、Decoder。
	- 第三轮刷架构区别：Only-Encoder、Only-Decoder、Encoder-Decoder。
	- 第四轮刷复杂题入口。

- **高频必会**
	- 大模型输入文本后发生了什么？ #card
		- 文本先被分词成 Token，再转成 Token ID；Token ID 查询嵌入表得到向量序列，向量序列进入 Transformer，最后输出表示、分类或生成结果。
	- Transformer 为什么适合大模型？ #card
		- Transformer 能并行处理序列，注意力机制能动态建模 token 之间的关系，堆叠后可以学习复杂语义和上下文表示，所以适合扩展到大规模参数和数据。
	- Transformer 的一层通常包含什么？ #card
		- 通常包含注意力模块、FFN、残差连接和归一化。Encoder 层主要是 Self-Attention + FFN，Decoder 层会使用 Masked Self-Attention，Encoder-Decoder 里还会有 Cross-Attention。

- **输入链路**
	- Token 是什么？ #card
		- Token 是模型处理文本的基本单位，文本会先被分词器切成 token，再映射为 Token ID，最后转成向量进入模型。
	- Token 和 Token ID 有什么区别？ #card
		- Token 是文本片段，Token ID 是这个文本片段在词表中的数字编号。模型不是直接处理字符串，而是处理 Token ID 对应的向量。
	- 词表和嵌入表有什么区别？ #card
		- 词表负责 Token 和 Token ID 的映射，嵌入表负责 Token ID 到向量的映射。词表是字典，嵌入表是模型参数矩阵。
	- 分词在大模型输入中做什么？ #card
		- 分词把文本切成 Token，再通过词表转成 Token ID，最后模型通过嵌入表把 Token ID 转成向量。

- **结构链路**
	- Self-Attention 在做什么？ #card
		- 它让每个 token 根据和其他 token 的相关性分配注意力权重，再聚合其他 token 的 Value，从而得到包含上下文信息的新表示。
	- Self-Attention 和 Masked Self-Attention 有什么区别？ #card
		- Self-Attention 可以看同一序列中的所有 token；Masked Self-Attention 会屏蔽未来 token，让当前位置只能看历史上下文，因此适合生成模型。
	- Cross-Attention 的作用是什么？ #card
		- 它让 Decoder 在生成时读取 Encoder 的输出，把源输入的信息融合进目标序列生成中。
	- FFN 在 Transformer 里做什么？ #card
		- Attention 做 token 间信息交互，FFN 对每个 token 的表示做非线性变换，提升模型表达能力。

- **架构区别**
	- Only-Encoder 适合什么任务？ #card
		- 适合理解和表示类任务，例如文本分类、语义匹配、Embedding、检索和特征提取，因为它可以双向看完整输入。
	- Only-Decoder 为什么适合生成？ #card
		- 它使用 Masked Self-Attention，只能看到当前位置之前的 token，因此天然适合按顺序预测下一个 token，形成自回归生成。
	- Encoder-Decoder 和 Only-Decoder 的区别是什么？ #card
		- Encoder-Decoder 先编码输入，再由 Decoder 生成输出，并通过 Cross-Attention 读取 Encoder 信息；Only-Decoder 通常只用一个 Decoder 堆叠，直接基于上下文自回归生成。

- **复杂题入口**
	- [[Question/Only-Encoder、Only-Decoder、Encoder-Decoder 有什么区别]]
	- [[Question/Self-Attention 和 Masked Self-Attention 有什么区别]]
	- [[Question/Token、Token ID、词表、嵌入表是什么关系]]
	- [[Question/Transformer Encoder 一层包含什么]]
	- [[Question/为什么 Transformer 适合大模型]]

- **关联概念**
	- [[Concept/大模型]]
	- [[Concept/Transformer]]
	- [[Concept/Token]]
	- [[Concept/Token ID]]
	- [[Concept/词表]]
	- [[Concept/嵌入表]]
	- [[Concept/Self-Attention]]
	- [[Concept/Masked Self-Attention]]
	- [[Concept/Cross-Attention]]
	- [[Concept/Only-Encoder]]
	- [[Concept/Only-Decoder]]
	- [[Concept/Encoder-Decoder]]
