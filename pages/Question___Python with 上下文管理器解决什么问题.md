alias:: Python with 作用, Python上下文管理器面试
type:: question
domain:: [[MOC/Python]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Python with 上下文管理器解决什么问题？

- **标准回答**
	- with 上下文管理器解决资源申请和释放容易分散、容易遗漏的问题。进入 with 块时获取资源，离开 with 块时自动执行清理逻辑，即使中间抛异常，也会执行退出逻辑。
	- 最常见例子是 with open 打开文件，不需要手动写 close。工程中数据库连接、锁、临时目录和计时器也常用上下文管理器封装。

- **回答结构**
	- 先说资源管理问题。
	- 再说进入和退出逻辑。
	- 举 with open 的文件关闭例子。
	- 扩展到异常场景和其他资源。

- **项目追问**
	- with 和 try finally 有什么关系？
		- 都能表达清理逻辑，但 with 把资源管理协议结构化，调用方更不容易漏写清理。
	- with 能吞掉异常吗？
		- 取决于上下文管理器的退出逻辑是否选择处理异常；普通使用中通常让异常继续传播。

- **关联知识**
	- [[Concept/Python上下文管理器]]
	- [[Concept/Python文件操作]]
	- [[Concept/Python异常]]

- **我的易错点**
	- 不要只说“自动关闭文件”，要说资源管理和异常退出。
	- 不要把 with 限定为文件专用语法。

- **来源**
	- [[Concept/Python上下文管理器]]
	- [[python/文件]]
	- [[Concept/Python异常]]
