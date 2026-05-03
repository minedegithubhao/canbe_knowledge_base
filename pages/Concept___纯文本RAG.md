alias:: Text-only RAG
type:: concept
domain:: [[MOC/RAG]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- 纯文本 RAG 是最常见的 RAG 形态：用户输入文本问题，系统从文本知识库中召回文本证据，再让 LLM 基于文本上下文回答。

- **适用场景**
	- 制度、合同、政策、手册、FAQ、内部知识库。
	- 代码文档、接口文档、产品说明、客服问答。
	- 文档主要信息以文字表达，图片或音视频不是主要证据。

- **典型流程**
	- 文档清洗。
	- 文档切分。
	- 文本 embedding。
	- 写入向量库和关键词索引。
	- 用户 query 检索相关 chunk。
	- Rerank 精排。
	- Prompt 注入证据并生成答案。

- **关键特点**
	- 实现成本最低，工程上最常见。
	- 效果高度依赖清洗、切分、embedding、混合检索和 Rerank。
	- 长文本被压成向量后会丢失细节、结构和逻辑，因此需要 metadata、Query Rewriting、多路召回和重排序补偿。

- **面试表达**
	- 纯文本 RAG 的局限是什么？ #card
		- 文本被压成向量后会丢失部分细节、结构和逻辑，长 chunk 尤其明显。因此工业场景通常需要文档结构、metadata、混合检索、Query Rewriting 和 Rerank 来补偿。

- **相关概念**
	- [[Concept/RAG]]
	- [[Concept/文本嵌入]]
	- [[Concept/文档切分]]
	- [[Concept/混合检索]]

- **来源**
	- [[大模型/RAG/纯文本RAG]]
	- [[Project/简易RAG系统]]
