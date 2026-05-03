alias:: Prompt Chaining, 提示链, 链式提示
type:: concept
domain:: [[MOC/大模型应用]]
status:: growing
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- Prompt Chaining 是把复杂任务拆成多个连续提示步骤，并把前一步输出作为后一步输入的任务编排方式。

- **解决的问题**
	- 一次性提示处理复杂任务容易遗漏步骤、格式不稳或推理混乱。
	- 拆成多个步骤后，每一步更简单、更可检查、更容易定位问题。
	- 中间结果可以被人工或程序校验。

- **典型流程**
	- 将目标任务拆成若干子任务。
	- 为每个子任务设计独立 Prompt。
	- 前一步输出进入下一步 Prompt。
	- 必要时在中间做校验、修正或人工确认。
	- 汇总最终结果。

- **适用场景**
	- 信息抽取后再总结。
	- 先分类再路由。
	- 先生成草稿再审校。
	- 先检索证据再生成答案。

- **面试表达**
	- Prompt Chaining 适合什么场景？ #card
		- 适合复杂、多阶段、需要中间检查的任务。它把大任务拆成小任务，降低单次生成难度，也方便定位哪一步出错。

- **常见误区**
	- 误区：拆得越细越好。
		- 过度拆分会增加延迟、成本和错误传播。
	- 误区：Prompt Chaining 自动保证正确。
		- 它只是降低复杂度，仍需要评估、校验和异常处理。

- **相关概念**
	- [[Concept/Prompt Engineering]]
	- [[Concept/Agent]]
	- [[Concept/Routing]]
	- [[Concept/Reflection]]

- **来源**
	- [[Prompt Chaining]]
	- [[Prompt]]
	- [[Agent]]
