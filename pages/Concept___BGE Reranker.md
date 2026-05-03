alias:: BGE Reranker, bge-reranker, bge-reranker-v2-m3, BAAI General Embedding Reranker
type:: concept
domain:: [[MOC/RAG]]
status:: growing
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- BGE Reranker 是 BGE 系列的重排序模型，常作为 RAG 检索链路里的 Cross-Encoder，对 query 和候选 chunk 做更细粒度的相关性判断。

- **解决的问题**
	- 初召回阶段为了提高覆盖，通常会召回较多候选，里面会混入弱相关或无关 chunk。
	- 向量检索和 BM25 的分数尺度不同，融合后不一定代表最终证据质量。
	- 生成阶段上下文窗口有限，需要把最相关、最干净的证据排到前面。

- **核心机制**
	- Bi-Encoder 向量召回通常是分别编码 query 和 chunk，再计算相似度，速度快但判断较粗。
	- Cross-Encoder Reranker 会把 query 和 chunk 放在一起编码，让模型直接判断二者相关性。
	- 因为每个候选都要和 query 成对计算，BGE Reranker 通常比向量召回慢，但精排能力更强。

- **典型流程**
	- 向量检索、BM25 或 [[Concept/混合检索]] 先召回一批候选。
	- 可用 [[Concept/RRF]]、加权融合或去重生成候选池。
	- BGE Reranker 对 query 和候选 chunk 逐个打分。
	- 按分数排序，取 Top K 或设置阈值过滤。
	- 将保留证据送入 Prompt。

- **项目中怎么用**
	- 手册类 RAG 中，可以用 BGE Reranker 提升证据纯度，但要用评估集调整阈值和 Top K，避免过滤掉弱相关但必要的片段。
	- 小说 RAG 中，可以用 BGE Reranker 抑制描写性噪声，把包含设定、事件、角色关系的证据排到前面。
	- 智能客服 RAG 中，可以用它控制 FAQ 召回结果的相关性，减少知识库外问题的误答。

- **工程注意点**
	- Reranker 不能弥补初召回完全没有正确候选的问题。
	- 阈值和 Top K 需要通过评估集调，不要只套固定经验值。
	- 候选池过小会让 Reranker 没有发挥空间，候选池过大则会增加延迟。
	- 模型版本、输入长度、多语言能力和部署延迟都要结合业务场景评估。

- **面试表达**
	- BGE Reranker 在 RAG 中解决什么问题？ #card
		- 它解决初召回候选不够准的问题。向量检索和 BM25 先保证覆盖，BGE Reranker 再对 query 和 chunk 做成对相关性判断，筛出更适合进入 Prompt 的证据。
	- BGE Reranker 和向量检索有什么区别？ #card
		- 向量检索通常是 Bi-Encoder，速度快，适合初召回；BGE Reranker 更像 Cross-Encoder，会把 query 和候选一起读，判断更准但更慢，适合精排。

- **常见误区**
	- 误区：上了 BGE Reranker 就不用优化切分。
		- 如果 chunk 被切坏、缺少关键上下文或混入大量噪声，Reranker 也可能误判。
	- 误区：Reranker 分数越高阈值越好。
		- 阈值过高会提高上下文纯度，也可能牺牲召回率，需要结合错误样本调参。

- **相关概念**
	- [[Concept/重排序]]
	- [[Concept/RRF]]
	- [[Concept/混合检索]]
	- [[Concept/检索后过滤]]
	- [[Concept/RAG]]

- **来源**
	- [[BGE Reranker]]
	- [[bge-reranker-v2-m3模型]]
	- [[Reranker]]
	- [[重排序]]
