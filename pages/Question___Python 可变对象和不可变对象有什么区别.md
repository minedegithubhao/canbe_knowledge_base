alias:: Python mutable immutable, Python可变不可变区别
type:: question
domain:: [[MOC/Python]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Python 可变对象和不可变对象有什么区别？

- **标准回答**
	- 可变对象可以在原对象上修改内容，例如 list、dict、set；不可变对象创建后不能原地改变内容，例如 int、float、bool、str、tuple。赋值只是变量名重新绑定到对象，并不等于修改原对象。
	- 这个差异会影响函数传参、副作用、默认参数、哈希能力和拷贝行为。尤其是函数默认参数不要使用可变对象，否则多次调用可能共享同一个对象。

- **回答结构**
	- 先定义可变和不可变。
	- 举典型类型例子。
	- 解释变量名绑定和对象修改的差异。
	- 扩展到默认参数、dict key、set 元素和函数副作用。

- **项目追问**
	- 为什么可变对象通常不能做 dict key？
		- dict key 需要稳定哈希值；可变对象内容变化后哈希值可能变化，会破坏哈希表定位。
	- 函数里修改 list 参数会影响外部吗？
		- 如果原地修改这个 list，会影响外部引用到的同一个对象；如果只是把参数名重新绑定到新 list，不会修改外部对象。

- **关联知识**
	- [[Concept/Python可变对象]]
	- [[Concept/Python数据类型]]
	- [[Concept/Python函数]]

- **我的易错点**
	- 不要把 Python 传参简单说成值传递或引用传递。
	- 不要遗漏可变默认参数这个高频坑。

- **来源**
	- [[Concept/Python可变对象]]
	- [[Python/数据类型]]
	- [[Python/函数]]
