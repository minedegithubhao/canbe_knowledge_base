alias:: Python try except 怎么写, Python异常处理面试
type:: question
domain:: [[MOC/Python]]
difficulty:: 简单
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Python 异常处理怎么写？

- **标准回答**
	- Python 异常处理的基本结构是 try、except、else、finally。try 中放可能失败的代码；except 捕获并处理指定异常；else 在没有异常时执行；finally 无论是否异常都会执行，通常用于清理资源。
	- 工程代码要尽量捕获具体异常，避免裸 except。涉及文件、锁、连接等资源时，优先使用上下文管理器，减少手动释放遗漏。

- **回答结构**
	- 先列结构。
	- 解释每个分支什么时候执行。
	- 说明为什么不要裸捕获。
	- 补充资源释放和上下文管理器。

- **项目追问**
	- finally 一定会执行吗？
		- 正常异常流程下会执行，但进程被强制终止等极端情况不应依赖 finally 做最终保障。
	- 为什么不建议直接捕获所有异常？
		- 会隐藏程序 bug，使错误变成静默失败，排查成本更高。

- **关联知识**
	- [[Concept/Python异常]]
	- [[Concept/Python函数]]

- **我的易错点**
	- 不要只写 try 和 except，要知道 else 和 finally 的语义。
	- 不要把异常处理写成吞异常。

- **来源**
	- [[Concept/Python异常]]
	- [[Python/异常]]
