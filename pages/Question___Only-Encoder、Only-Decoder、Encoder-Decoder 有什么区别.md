alias:: 三种Transformer架构区别, Encoder Decoder 架构区别
type:: question
domain:: [[MOC/Transformer]]
difficulty:: 中等
status:: practicing
created:: 2026-05-02
updated:: 2026-05-02

- **题目**
	- Only-Encoder、Only-Decoder、Encoder-Decoder 有什么区别？

- **标准回答**
	- Only-Encoder 以 Transformer Encoder 为主体，可以双向看完整输入，适合理解、表示、分类、匹配和 embedding。Only-Decoder 以 Decoder 为主体，使用 Masked Self-Attention，只能看历史 token，适合自回归生成。Encoder-Decoder 先用 Encoder 编码输入，再用 Decoder 生成输出，并通过 Cross-Attention 读取 Encoder 信息，适合翻译、摘要、改写等输入输出结构不同的任务。

- **回答结构**
	- 先按任务区分：理解表示、开放生成、序列到序列。
	- 再按注意力区分：双向 Self-Attention、Masked Self-Attention、Cross-Attention。
	- 最后给代表模型：BERT、GPT/LLaMA、T5/BART。

- **项目追问**
	- RAG 中 embedding 模型多偏 Only-Encoder。
	- RAG 中最终生成答案的 LLM 多偏 Only-Decoder。
	- 翻译和摘要类模型常见 Encoder-Decoder。

- **关联知识**
	- [[Concept/Only-Encoder]]
	- [[Concept/Only-Decoder]]
	- [[Concept/Encoder-Decoder]]
	- [[Concept/Cross-Attention]]
	- [[Concept/Masked Self-Attention]]

- **我的易错点**
	- 不要只背代表模型，要说清楚注意力机制和任务类型。

- **来源**
	- [[大模型分类]]
	- [[Only-Decoder]]
	- [[Encoder-Decoder]]
	- [[大模型/Transformer/Only-Encoder]]
