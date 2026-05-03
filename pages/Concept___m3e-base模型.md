alias:: m3e-base, M3E Base, m3e embedding
type:: concept
domain:: [[MOC/RAG]]
status:: seed
level:: 项目可用
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- m3e-base 是一个中文文本嵌入模型，常被用于中文 RAG、语义检索和相似度匹配实验。

- **解决的问题**
	- 中文 RAG 需要把 query 和文档 chunk 编码成向量。
	- 通用英文 embedding 或分词规则不一定适合中文语义检索。
	- 本地实验时，m3e-base 可作为中文 embedding 基线模型。

- **核心机制**
	- 输入文本经过分词器转成 token。
	- Only-Encoder 类模型把 token 序列编码为向量表示。
	- 句向量或文本向量用于相似度计算、向量库召回和聚类。

- **项目中怎么用**
	- 适合做中文 RAG 原型和离线评估基线。
	- 如果业务有大量专有名词、缩写或行业术语，需要用评估集验证召回质量。
	- 和 [[Concept/BGE Reranker]]、[[Concept/混合检索]] 配合时，embedding 负责初召回，Reranker 负责精排。

- **面试表达**
	- embedding 模型选型时为什么不能只看模型名字？ #card
		- 因为检索效果取决于语料领域、query 类型、chunk 粒度、向量库索引和评估集。m3e-base 可以做中文基线，但项目里仍要用真实问题评估召回率、准确率和最终答案质量。

- **常见误区**
	- 误区：中文模型一定适合所有中文业务。
		- 垂直领域术语、表格、代码、编号类问题仍可能需要混合检索或微调。
	- 误区：embedding 好就不需要 Rerank。
		- embedding 适合快速召回，Rerank 更适合细粒度相关性判断。

- **相关概念**
	- [[Concept/文本嵌入]]
	- [[Concept/文本编码器]]
	- [[Concept/分词]]
	- [[Concept/Token]]
	- [[Concept/BGE Reranker]]
	- [[Concept/混合检索]]

- **来源**
	- [[m3e-base模型]]
	- [[Concept/文本嵌入]]
