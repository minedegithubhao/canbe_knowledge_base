alias:: 提示链适合什么场景
type:: question
domain:: [[MOC/大模型应用]]
difficulty:: 简单
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Prompt Chaining 适合什么场景？

- **标准回答**
	- Prompt Chaining 适合复杂、多步骤、需要中间检查的任务。它把一个大任务拆成多个小任务，让每一步更简单、更可控，也更容易定位错误。常见场景包括先抽取再总结、先分类再路由、先生成草稿再审校。

- **回答结构**
	- 先说适合复杂任务。
	- 再说为什么：降低单次生成难度。
	- 再说工程收益：中间结果可检查。
	- 最后说代价：延迟和成本增加。

- **项目追问**
	- Prompt Chaining 的风险是什么？
		- 过度拆分会增加成本、延迟和错误传播。

- **关联知识**
	- [[Concept/Prompt Chaining]]
	- [[Concept/Prompt Engineering]]
	- [[Concept/Agent]]

- **我的易错点**
	- 不要默认所有任务都要链式提示。

- **来源**
	- [[Concept/Prompt Chaining]]
	- [[Prompt Chaining]]
