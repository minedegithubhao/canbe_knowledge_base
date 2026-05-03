alias:: Python元组, tuple, 元组
type:: concept
domain:: [[MOC/Python]]
status:: growing
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- Python 元组是有序、不可变的序列容器，适合表达固定结构、不可变记录和多返回值。

- **解决的问题**
	- 固定一组位置语义明确的数据。
	- 避免列表被意外增删改。
	- 承接函数多返回值和拆包。

- **核心机制**
	- tuple 保留元素顺序，可以按索引访问。
	- tuple 本身不可变，不能原地添加、删除或替换元素引用。
	- tuple 可参与拆包，函数返回多个值时本质上常由 tuple 承接。
	- tuple 能否可哈希取决于其中元素是否都可哈希。

- **典型流程**
	- 表达固定结构时用 tuple。
	- 需要频繁增删改时用 list。
	- 多返回值可以直接返回多个对象，再由调用方拆包。

- **项目中怎么用**
	- 用 tuple 表示固定字段组合，例如坐标、范围、复合 key。
	- 从函数返回多个结果时，用 tuple 和拆包提升可读性。

- **面试表达**
	- tuple 为什么不是绝对深层不可变？ #card
		- tuple 限制的是元素引用不能被替换。如果某个元素引用的是 list 这类可变对象，这个对象内部仍然可以被修改。

- **常见误区**
	- 误区：tuple 一定可以作为 dict key。
		- 只有当 tuple 内部所有元素都可哈希时，tuple 才能作为 dict key。

- **相关概念**
	- [[Concept/Python数据类型]]
	- [[Concept/Python可变对象]]
	- [[Concept/Python列表]]
	- [[Concept/Python函数]]

- **来源**
	- [[Python/操作方法/元组]]
	- [[Python/函数]]
