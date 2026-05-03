alias:: conda环境面试, Python虚拟环境解决什么问题
type:: question
domain:: [[MOC/Python]]
difficulty:: 简单
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- conda 环境管理解决什么问题？

- **标准回答**
	- conda 环境管理主要解决依赖隔离和环境复现问题。不同项目可能需要不同 Python 版本和不同包版本，如果都装在全局环境或 base 环境里，容易产生冲突。为每个项目创建独立环境，可以让依赖边界清楚，出现问题时也更容易重建和排查。

- **回答结构**
	- 依赖隔离。
	- Python 版本隔离。
	- 项目复现。
	- 冲突排查。
	- 不污染 base 环境。

- **项目追问**
	- 为什么不建议所有项目共用 base 环境？
		- 依赖会互相覆盖，项目越多越难判断哪个包属于哪个项目。
	- 环境出问题时为什么新建环境更稳？
		- 干净环境能减少历史包残留影响，更容易验证最小依赖集合。

- **关联知识**
	- [[Concept/conda环境管理]]
	- [[Concept/Python]]
	- [[Concept/Python API调用]]

- **我的易错点**
	- 不要只背 conda 命令。
	- 要讲隔离、复现和冲突排查。

- **来源**
	- [[Concept/conda环境管理]]
	- [[conda环境配置]]
