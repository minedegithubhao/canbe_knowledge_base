alias:: 向量检索面试, 向量数据库面试, Vector Search 面试
type:: review
domain:: [[MOC/向量检索]]
status:: active
updated:: 2026-05-03

- **怎么刷**
	- 第一轮刷主链路：文本嵌入、向量库、向量检索、ANN、重排。
	- 第二轮刷索引：FLAT、IVF_FLAT、HNSW 的速度、召回、内存和构建成本。
	- 第三轮刷项目：RAG 中为什么不能只靠向量检索，怎么结合混合检索、metadata 过滤和 Rerank。
	- 每道题都要能说出“解决什么问题、牺牲什么、参数怎么影响效果”。

- **高频必会**
	- 向量数据库解决什么问题？ #card
		- 向量数据库负责存储向量、原文和 metadata，并按相似度快速召回候选数据。它解决的是语义召回和向量索引管理问题，不等于完整 RAG 系统。
	- HNSW 的核心思想是什么？ #card
		- HNSW 用多层图组织向量，高层像快速跳转的高速路，底层做更精细的邻近搜索，从而在速度和召回之间取得平衡。
	- IVF_FLAT 和 HNSW 有什么区别？ #card
		- IVF_FLAT 先聚类分桶，查询时只搜部分桶，更省内存但召回依赖 nprobe；HNSW 构建多层近邻图，查询快、召回高，但内存和构建成本更高。
	- 向量检索为什么还需要召回和重排？ #card
		- 向量检索先用低成本方式召回候选，重排再用更强相关性模型精排。这样兼顾速度、成本和准确性。
	- RAG 中向量库怎么选型？ #card
		- 先看数据规模、延迟、召回率、过滤能力、更新频率和运维成本。小规模高精度可用 FLAT，通用 RAG 常考虑 HNSW，超大规模可考虑 IVF 类索引，并结合混合检索和 Rerank。

- **复杂题入口**
	- [[Question/向量数据库解决什么问题]]
	- [[Question/HNSW 的核心思想是什么]]
	- [[Question/IVF_FLAT 和 HNSW 有什么区别]]
	- [[Question/向量检索为什么还需要召回和重排]]
	- [[Question/RAG 中向量库怎么选型]]

- **关联概念**
	- [[Concept/向量检索]]
	- [[Concept/向量库]]
	- [[Concept/Milvus]]
	- [[Concept/近似最近邻搜索]]
	- [[Concept/HNSW]]
	- [[Concept/IVF_FLAT]]
	- [[Concept/文本嵌入]]
	- [[Concept/距离度量]]
	- [[Concept/混合检索]]
	- [[Concept/重排序]]
