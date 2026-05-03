alias:: Python数据类型, Python基础类型
type:: concept
domain:: [[MOC/Python]]
status:: growing
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- Python 数据类型是对象的分类方式，决定对象支持什么操作、是否可变、能否作为字典 key 或集合元素。

- **解决的问题**
	- 选择正确的数据表示方式。
	- 判断对象是否适合修改、去重、映射、排序或哈希。
	- 理解函数传参和容器嵌套时的副作用。

- **核心机制**
	- 数值类型包括 int、float、bool；bool 是 int 的子类，True 和 False 可参与数值运算。
	- str、tuple 通常按不可变对象理解；list、dict、set 是可变对象。
	- dict 用 key 到 value 的映射表达结构化数据，set 用哈希集合表达去重和成员判断。
	- tuple 不可变指元素引用不可变；如果元素本身是可变对象，可变对象内部仍可能变化。
	- float 是二进制浮点数，涉及金额或高精度小数时应考虑 Decimal。

- **典型流程**
	- 表达一组有序可变数据，优先用 [[Concept/Python列表]]。
	- 表达固定结构或不可变记录，优先用 [[Concept/Python元组]]。
	- 表达 key-value 映射，优先用 [[Concept/Python字典]]。
	- 表达去重和成员判断，优先用 [[Concept/Python集合]]。
	- 表达文本，使用 [[Concept/Python字符串]]。

- **项目中怎么用**
	- list 常用于批量数据和队列式临时结果。
	- dict 常用于配置、索引、聚合计数和对象序列化。
	- set 常用于去重、交集和快速判断。
	- tuple 常用于多返回值、不可变记录和固定位置语义。

- **面试表达**
	- Python 常见基础类型有哪些？ #card
		- 常见有 int、float、bool、str、list、tuple、dict、set 和 NoneType。面试中要进一步按可变性、顺序性、是否可哈希和典型使用场景分类。

- **常见误区**
	- 误区：tuple 里所有东西都完全不能变。
		- tuple 的元素引用不可变，但引用指向的可变对象内部仍能变。
	- 误区：空集合可以写成花括号。
		- 空花括号创建的是 dict，空 set 要用 set 函数创建。

- **相关概念**
	- [[Concept/Python]]
	- [[Concept/Python可变对象]]
	- [[Concept/Python列表]]
	- [[Concept/Python元组]]
	- [[Concept/Python字典]]
	- [[Concept/Python集合]]
	- [[Concept/Python字符串]]
	- [[Concept/Python类型转换]]
	- [[Concept/Python运算符]]

- **来源**
	- [[Python/数据类型]]
	- [[Python/操作方法/列表]]
	- [[Python/操作方法/元组]]
	- [[Python/操作方法/字典]]
	- [[Python/操作方法/集合]]
	- [[Python/操作方法/字符串]]
	- [[Python/数据类型/转换]]
	- [[Python/运算符]]
