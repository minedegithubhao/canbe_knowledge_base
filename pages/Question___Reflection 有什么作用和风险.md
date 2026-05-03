alias:: 反思模式有什么作用和风险
type:: question
domain:: [[MOC/大模型应用]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Reflection 有什么作用和风险？

- **标准回答**
	- Reflection 的作用是让 Agent 或模型检查自己的输出、计划或执行结果，并根据反馈修正，从而提高复杂任务的稳定性。风险是增加成本和延迟，也可能在没有明确标准时反复自我包装错误，甚至陷入无效循环。

- **回答结构**
	- 先说作用：自检、修正、提升稳定性。
	- 再说流程：生成、检查、反馈、修正。
	- 再说风险：成本、延迟、循环、标准不清。
	- 最后说控制：明确评估标准和停止条件。

- **项目追问**
	- 代码 Agent 中 Reflection 怎么体现？
		- 写完代码后跑测试，根据失败信息修复；这比让模型凭感觉自我评价更可靠。

- **关联知识**
	- [[Concept/Reflection]]
	- [[Concept/Agent]]
	- [[Concept/Prompt Chaining]]

- **我的易错点**
	- 不要把 Reflection 说成万能自我纠错；必须有外部标准或可验证信号。

- **来源**
	- [[Concept/Reflection]]
	- [[Reflection]]
