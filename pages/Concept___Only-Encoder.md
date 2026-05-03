alias:: Only-Encoder, 仅编码器, Encoder-only
type:: concept
domain:: [[MOC/Transformer]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- Only-Encoder 是以 Transformer Encoder 为主体的模型架构，擅长理解、表示和编码输入。

- **解决的问题**
	- 适合需要理解整段输入的任务，例如分类、匹配、检索、Embedding 和特征提取。
	- 可以双向看上下文，因此更适合做表示型任务。

- **核心机制**
	- 输入 token 序列进入多层 [[Concept/Transformer Encoder]]。
	- 每层通过 [[Concept/Self-Attention]] 建模全局上下文。
	- 输出可以取 CLS 向量、平均池化向量或每个 token 的上下文化表示。

- **典型流程**
	- 文本输入。
	- 分词和嵌入。
	- 多层 Encoder 编码。
	- 输出分类结果、句向量或 token 表示。

- **项目中怎么用**
	- BERT、Embedding 模型、文本编码器和部分图像编码器都可归入这一类。
	- RAG 中的 embedding 模型常用 encoder-only 思路。

- **面试表达**
	- Only-Encoder 适合什么任务？ #card
		- 适合理解和表示类任务，例如文本分类、语义匹配、Embedding、检索和特征提取，因为它可以双向看完整输入。

- **常见误区**
	- 误区：Only-Encoder 适合直接生成长文本。
		- 它更适合理解和表示，长文本生成通常使用 Decoder-only 或 Encoder-Decoder。

- **相关概念**
	- [[Concept/Transformer Encoder]]
	- [[Concept/文本编码器]]
	- [[Concept/理解型与表示型大模型]]
	- [[Concept/嵌入表]]

- **来源**
	- [[大模型/Transformer/Only-Encoder]]
