alias:: Rerank, Reranker, Re-ranking, 精排, 大模型/RAG/重排序
type:: concept
domain:: [[MOC/RAG]]
status:: stable
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-03

- **一句话定义**
	- 重排序是在初召回之后，用更强的相关性模型重新评估 query 和候选 chunk 的匹配程度，选出最适合放进 Prompt 的证据。

- **解决的问题**
	- 向量检索和关键词检索通常追求召回覆盖，会带来一些不相关或弱相关内容。
	- 上下文窗口有限，不能把所有候选都塞给 LLM。
	- 低质量上下文会稀释证据，诱发生成幻觉。

- **典型流程**
	- 向量检索和 BM25 各自召回一批候选。
	- 通过去重、加权融合或 RRF 得到候选列表。
	- [[Concept/BGE Reranker]] 等 Reranker 对 query 和每个候选 chunk 打相关性分数。
	- 过滤低于阈值的 chunk，或取 Top K。
	- 将保留下来的证据交给 Prompt。

- **Rerank 和 RRF 的区别**
	- RRF 是基于多个召回列表的排名做融合，不真正理解 query 和 chunk 的语义关系。
	- Reranker 通常是 Cross-Encoder，会把 query 和 chunk 放在一起读，相关性判断更细，但速度更慢。
	- RRF 更适合多路召回融合，Rerank 更适合最终精排。

- **工程注意点**
	- 阈值不是越高越好，过高可能过滤掉弱相关但必要的证据。
	- Top K 不是越小越好，过小可能漏掉答案所需信息。
	- Rerank 前的候选数量要足够，否则精排没有发挥空间。
	- 过滤低分证据时要结合 [[Concept/检索后过滤]]，明确过滤后是拒答、追问还是降级检索。
	- 评估时要同时看召回率、准确率、真实性和错误样本日志。

- **项目中怎么用**
	- 在 [[Project/手册类RAG实战]] 中，加入 Rerank 熔断后提高了上下文纯度，但也暴露了部分相关片段评分偏低、被过滤的问题。
	- 在 [[Project/小说RAG实战]] 中，Rerank 可用于减少描写性噪声，把更硬的设定、事件和证据排到前面。

- **面试表达**
	- Rerank 解决什么问题？ #card
		- 它解决初召回候选多但不够准的问题。先通过向量检索和关键词检索提高覆盖，再用 Reranker 对 query 和 chunk 的相关性精排，保留最适合进入 Prompt 的证据。
	- Rerank 阈值怎么设置？ #card
		- 不能只靠经验值。要用评估集和错误样本看阈值变化对召回率、准确率和真实性的影响，阈值过高会漏掉必要证据，阈值过低会放进噪声。

- **常见误区**
	- 误区：有了 Rerank 就不需要改切分。
		- 如果 chunk 被切断或缺少关键特征，Reranker 也可能给低分。
	- 误区：Rerank 能修复所有检索问题。
		- 如果初召回没有正确候选，Rerank 无法凭空产生正确证据。

- **相关概念**
	- [[Concept/混合检索]]
	- [[Concept/RRF]]
	- [[Concept/BGE Reranker]]
	- [[Concept/检索后过滤]]
	- [[Concept/文档切分]]
	- [[Concept/RAGAS]]
	- [[Concept/RAG]]

- **来源**
	- [[重排序]]
	- [[Reranker]]
	- [[BGE Reranker]]
	- [[bge-reranker-v2-m3模型]]
	- [[Project/手册类RAG实战]]
