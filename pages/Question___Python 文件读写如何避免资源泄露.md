alias:: Python文件关闭, Python文件资源泄露, with open 面试
type:: question
domain:: [[MOC/Python]]
difficulty:: 简单
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Python 文件读写如何避免资源泄露？

- **标准回答**
	- 优先使用 with open 打开文件，把读写逻辑放在 with 块内。with 块退出时文件会自动关闭，即使读写过程中发生异常，也会执行资源清理逻辑。
	- 同时要根据文件类型选择文本模式或二进制模式，文本文件显式指定编码，大文件优先逐行或分块读取，避免一次性读入内存。

- **回答结构**
	- 先说使用 with open。
	- 再说异常时也能自动清理。
	- 补充编码、模式和大文件读取策略。
	- 最后说明手动 close 容易遗漏。

- **项目追问**
	- 写入模式和追加模式有什么区别？
		- 写入模式会清空已有内容，追加模式会在文件末尾继续写。
	- 什么时候使用二进制模式？
		- 处理图片、音频、视频或不需要文本解码的文件时使用二进制模式。

- **关联知识**
	- [[Concept/Python文件操作]]
	- [[Concept/Python上下文管理器]]
	- [[Concept/Python异常]]

- **我的易错点**
	- 不要只写 open 和 close，要说明异常路径下 close 可能被跳过。
	- 不要忘记显式编码和大文件内存问题。

- **来源**
	- [[Concept/Python文件操作]]
	- [[python/文件]]
