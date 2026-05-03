alias:: Python list 和 tuple 区别, 列表和元组区别
type:: question
domain:: [[MOC/Python]]
difficulty:: 简单
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Python 列表和元组有什么区别？

- **标准回答**
	- 列表是有序、可变、可重复的序列容器，适合频繁增删改；元组是有序、不可变、可重复的序列容器，适合表达固定结构、不可变记录和函数多返回值。
	- 要注意，元组不可变主要指元素引用不能被替换。如果元组里的元素本身是可变对象，这个对象内部仍然可能变化。

- **回答结构**
	- 先说共同点：都有序、可索引、可遍历、可重复。
	- 再说核心差异：list 可变，tuple 不可变。
	- 再说使用场景：list 用于动态集合，tuple 用于固定结构和多返回值。
	- 最后补充 tuple 的浅层不可变和可哈希条件。

- **项目追问**
	- tuple 一定能做 dict key 吗？
		- 不一定。只有 tuple 内部所有元素都可哈希时，它才可哈希。
	- 为什么函数多个返回值可以直接拆包？
		- 多返回值通常由 tuple 承接，调用方可以用拆包语法把 tuple 元素绑定到多个变量名。

- **关联知识**
	- [[Concept/Python列表]]
	- [[Concept/Python元组]]
	- [[Concept/Python可变对象]]
	- [[Concept/Python函数]]

- **我的易错点**
	- 不要只说“列表可变、元组不可变”，要补充使用场景。
	- 不要把 tuple 说成深层不可变。

- **来源**
	- [[Concept/Python列表]]
	- [[Concept/Python元组]]
	- [[Python/操作方法/列表]]
	- [[Python/操作方法/元组]]
