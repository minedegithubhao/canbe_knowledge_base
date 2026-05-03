alias:: Text Embedding
type:: concept
domain:: [[MOC/RAG]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- 文本嵌入是把文本转换为向量表示的过程，让检索系统可以用向量距离衡量语义相似度。

- **在 RAG 中的位置**
	- 离线阶段对 chunk 生成 embedding。
	- 在线阶段对用户 query 生成 embedding。
	- 向量库用 query 向量查找相近 chunk 向量。

- **基本过程**
	- 文本被分词成 token。
	- token 被映射为 token id。
	- embedding 模型把 token 或整段文本编码成向量。
	- RAG 通常使用句向量或段落向量做检索。

- **注意点**
	- embedding 不是语义的完整复制，长文本被压成一个向量会丢失结构和细节。
	- embedding 模型要和语言、领域、文档类型匹配。
	- 对编号、实体、专业术语特别敏感的场景，不能只依赖向量检索。

- **面试表达**
	- RAG 里的 embedding 解决什么问题？ #card
		- 它把 query 和 chunk 转成向量，让系统可以按语义相似度召回文档片段。但 embedding 会损失细节，所以常需要关键词检索、metadata 和 Rerank 补充。

- **相关概念**
	- [[Concept/向量检索]]
	- [[Concept/向量库]]
	- [[Concept/混合检索]]
	- [[Concept/池化]]
	- [[Concept/RAG]]
	- [[Concept/Embedding召回]]
	- [[Concept/双塔模型]]
	- [[Concept/距离度量]]

- **来源**
	- [[大模型/RAG/文本嵌入]]
	- [[Embedding使用]]
