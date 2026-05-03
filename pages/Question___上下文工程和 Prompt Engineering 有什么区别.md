alias:: Context Engineering 和 Prompt Engineering 区别
type:: question
domain:: [[MOC/大模型应用]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- 上下文工程和 Prompt Engineering 有什么区别？

- **标准回答**
	- Prompt Engineering 主要关注指令怎么写，包括角色、任务、约束、示例和输出格式。上下文工程关注系统给模型什么信息、如何组织、给多少、何时更新和如何过滤，范围包括 Prompt、RAG 证据、历史对话、工具结果、状态、记忆、权限和安全约束。

- **回答结构**
	- 先说 Prompt Engineering 是写指令。
	- 再说上下文工程是组织完整输入。
	- 再列组成：证据、历史、工具、状态、记忆、约束。
	- 最后说生产系统更关注上下文工程。

- **项目追问**
	- RAG 中上下文工程体现在哪里？
		- 体现在证据选择、排序、引用、拒答、冲突处理和 Prompt 构建。

- **关联知识**
	- [[Concept/上下文工程]]
	- [[Concept/Prompt Engineering]]
	- [[Concept/RAG]]
	- [[Concept/检索后过滤]]

- **我的易错点**
	- 不要把上下文工程简化成“把更多内容塞进 Prompt”。

- **来源**
	- [[Concept/上下文工程]]
	- [[上下文工程]]
