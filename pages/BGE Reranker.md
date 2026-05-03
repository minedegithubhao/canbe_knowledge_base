alias:: BGE Reranker旧笔记
type:: concept
status:: archived
updated:: 2026-05-03

- **迁移说明**
	- 这页是旧 BGE Reranker 笔记，稳定内容已整理到 [[Concept/BGE Reranker]]、[[Concept/重排序]] 和 [[Concept/混合检索]]。
	- 后续学习和复习优先使用新页面；本页保留为原始资料和历史上下文。

	- **BGE 的优势**：它是一个 **Cross-Encoder（交叉编码器）**。它会把你的“重写问题”和“候选片段”真的放在一起读。比 [[RRF]] （倒数排名融合）更强大的“裁判”。
	- ```python
	  # 7.16 执行Milvus混合搜索，结合稠密和稀疏向量
	  milvus_results = self.client.hybrid_search(
	      collection_name=config.MILVUS_COLLECTION_NAME,
	      reqs=[dense_req, sparse_req],
	      ranker=WeightedRanker(0.7, 0.3),
	      # limit=k, filter=filter_expr, output_fields=["*"]
	      limit=k,
	      # filter=filter_expr,
	      output_fields=['id', "work_experience", "age", "name", "doc_hash", "text", "parent_content", "gender"]
	  )
	  ```
	- 稠密向量和稀疏向量权重如何分配 #card #面试背诵汇总/重点
		- | 场景 | 权重设置 | 说明 |
		  | ---- | ---- | ---- |
		  | **纯语义搜索（推荐文章）** | **0.8, 0.2** | 语义更重要 |
		  | **✅ 智能客服 / FAQ（你）** | **0.7, 0.3** | **最均衡** |
		  | **法律 / 医疗 / 术语强** | **0.6, 0.4** | 关键词更重要 |
		  | **电商商品搜索** | **0.5, 0.5** | 语义 + 关键词同等重要 |
	- **`bge-reranker`**：这是一个**系列名**，代表BGE（BAAI General Embedding）旗下的重排序器（Reranker）模型家族。它本身不是一个具体模型，而是对这类模型的统称
		- **`bge-reranker-base`**：这是该系列的**第一代产品**
		- **`bge-reranker-v2-m3`**：这是该系列**第二代产品**
		- | 特性 | **bge-reranker-base (第一代)** | **bge-reranker-v2-m3 (第二代)** |
		  | ---- | ---- | ---- |
		  | **发布时间** | 2023年9月 | 2024年3月 |
		  | **基础模型** | `xlm-roberta-base` | `bge-m3` |
		  | **参数规模** | 约 278M | 568M |
		  | **支持语言** | 中英双语 | **多语言**，支持 100+ 种语言 |
		  | **输入长度** | 512 个 token | **8192** 个 token |
		  | **主要特点** | 轻量、高效，是 v1 系列的代表作 | 第二代重排序模型，性能更强、支持多语言和超长文本 |
