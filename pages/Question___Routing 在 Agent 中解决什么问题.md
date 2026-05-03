alias:: Agent Routing 面试题
type:: question
domain:: [[MOC/大模型应用]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Routing 在 Agent 中解决什么问题？

- **标准回答**
	- Routing 解决请求应该走哪条处理链路的问题。Agent 可以根据用户输入、任务类型、权限、上下文或系统状态，把请求路由到不同工具、模型、知识库、人工转接或拒答流程。它让系统从固定流程变成条件化流程。

- **回答结构**
	- 先说问题：不同请求不能走同一路。
	- 再说依据：输入、状态、权限、语义。
	- 再说去向：模型、工具、知识库、人工、拒答。
	- 最后说风险：路由错了后续都偏。

- **项目追问**
	- 路由一定要用 LLM 吗？
		- 不一定。强规则场景用规则或分类器更稳定，语义复杂时再用 LLM 或向量路由。

- **关联知识**
	- [[Concept/Routing]]
	- [[Concept/Agent]]
	- [[Concept/RAG]]

- **我的易错点**
	- 不要忽略路由错误的级联影响。

- **来源**
	- [[Concept/Routing]]
	- [[Routing]]
