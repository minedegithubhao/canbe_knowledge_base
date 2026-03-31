- alias::
  tags::
  type:: 概念
  status:: 草稿 | 整理中 | 已掌握
- Chunk 的目的： #面试背诵汇总/大模型/RAG
	- Chunk 是长文本被分割后的小片段，每个 chunk 是一个独立的文本单元（通常 100-1000 字符），在 LangChain 中以 Document 对象形式存储。Chunk 的主要目的包括：
		- **便于 LLM 处理**：LLM（如 ChatOpenAI、DeepSeekLLM）有输入长度限制（如 4096 tokens），长文本无法一次性输入。Chunk 将大文档分成小块，确保每个块适合 LLM 处理。
		- **用于向量嵌入（Embedding）**：在 RAG 系统中，chunk 是向量化的基本单位。每个 chunk 被转换为向量（embedding），存储到向量数据库（如milvus、 Chroma、FAISS）。检索时，只需搜索相关 chunk，减少计算量，提高效率。
		- **优化检索：**小块更适合精确检索。例如，搜索“AI 发展历史”时，只返回包含相关内容的 chunk，而不是整个文档，提升 RAG 系统的准确性和速度。
		- **内存和计算效率**：大文档直接处理可能导致内存溢出或高计算成本。Chunk 化后，只处理必要部分，节省资源。
		- 工业场景：在智能制造或 IoT 中，chunk 化日志或报告便于快速定位异常（如设备故障），或生成结构化数据（如 JSON）用于分析。
		- Chunk_size 和 Chunk_overlap
			- chunk_size：每个 chunk 的最大长度（通常按字符数或 token 数）。例如，chunk_size=200 表示每个块不超过 200 字符。大小影响处理效率：
				- 太小：块太碎，上下文丢失，检索效果差。
				- 太大：块过长，可能超 LLM 输入限制或增加计算成本。
			- Chunk_overlap：相邻 chunk 之间的重叠字符数。例如，chunk_overlap=50 表示每个 chunk 的末尾 50 字符会与下一个 chunk 的开头重复。重叠确保：
				- 句子或段落不被硬切断，保留语义完整性。
				- 检索时上下文连贯，类似书页重叠，避免“断章取义”。