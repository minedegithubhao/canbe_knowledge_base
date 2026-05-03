alias:: 简易RAG系统, 纯文本RAG代码
type:: project
domain:: [[MOC/RAG]]
status:: active
created:: 2026-05-02
updated:: 2026-05-03

- **项目目标**
	- 构建一个最小可运行的纯文本 RAG 系统，用来理解加载、切分、embedding、向量库、检索、Prompt 和评估的完整链路。

- **背景资料**
	- 原始项目笔记保留在 [[简易RAG系统]]。
	- 这是入门项目，重点是跑通闭环，不追求生产级效果。

- **系统架构**
	- 文档加载：读取文本或 PDF。
	- 文档切分：生成 chunk。
	- 向量化：使用 embedding 模型生成向量。
	- 向量库：写入 Chroma 等本地向量库。
	- 检索：根据 query 召回 Top K。
	- 生成：把上下文拼进 Prompt 后调用本地 LLM。
	- 评估：用 PAGAS/RAGAS 思路检查结果。

- **核心流程**
	- 加载文本文件。
	- 使用 RecursiveCharacterTextSplitter 等工具切分 chunk。
	- 使用本地 embedding 模型生成向量。
	- 写入 Chroma 等向量库。
	- 用户输入 query 后相似度检索 Top K。
	- 拼接上下文并调用本地 LLM。
	- 用 PAGAS/RAGAS 思路评估回答。

- **关键模块**
	- [[Concept/文档切分]]
	- [[Concept/文本嵌入]]
	- [[Concept/向量库]]
	- [[Concept/PAGAS]]

- **问题记录**
	- 最小系统通常只有向量检索，容易漏掉精确词和编号。
	- 初版一般缺少 Query Rewriting、混合检索、Rerank 和 metadata。
	- 如果不做评估，很难知道答案好坏来自检索还是生成。

- **指标和验收**
	- 模块完整性：加载、切分、embedding、向量库、检索、Prompt、生成和评估是否全部跑通。
	- 检索命中率：正确证据是否出现在 Top K 结果中。
	- 答案真实性：生成结果是否忠实于召回证据。
	- 回答相关性：答案是否真正回应用户问题。
	- 运行稳定性：本地模型、向量库和依赖环境是否能稳定复现。

- **经验沉淀**
	- 最小系统适合理解 RAG 闭环。
	- 后续要升级为生产系统，需要加入 [[Concept/混合检索]]、[[Concept/重排序]]、[[Concept/Query Rewriting]] 和权限控制。
	- 这个项目适合作为 [[Project/手册类RAG实战]] 的前置练习。

- **面试表达**
	- 最小 RAG 系统需要哪些模块？ #card
		- 至少需要文档加载、文档切分、embedding、向量库、检索、Prompt 构建、LLM 生成和评估。生产系统还会加入混合检索、Rerank、Query Rewriting、metadata 和权限控制。
	- 简易 RAG 和生产 RAG 的区别是什么？ #card
		- 简易 RAG 主要跑通闭环；生产 RAG 还要处理数据清洗、增量更新、metadata、权限控制、混合检索、Rerank、拒答、日志监控和评估回归。

- **项目追问**
	- [[Question/简易 RAG 系统如何升级为生产可用]]
	- [[Question/RAG 项目如何做评估驱动优化]]
	- [[Review/RAG项目面试]]

- **相关概念**
	- [[Concept/纯文本RAG]]
	- [[Concept/文档切分]]
	- [[Concept/文本嵌入]]
	- [[Concept/向量库]]
	- [[Concept/PAGAS]]

- **来源**
	- [[简易RAG系统]]
