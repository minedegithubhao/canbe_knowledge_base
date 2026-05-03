alias:: Python列表, list, 列表
type:: concept
domain:: [[MOC/Python]]
status:: growing
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- Python 列表是有序、可变、可重复的序列容器，适合保存需要按位置访问和动态增删改的数据。

- **解决的问题**
	- 保存一组顺序数据。
	- 支持按索引访问、遍历、追加、插入、删除、排序和反转。
	- 作为批处理、临时结果和多元素返回的常用容器。

- **核心机制**
	- list 保留元素顺序，可以通过索引访问。
	- list 是可变对象，append、extend、insert、pop、remove、sort、reverse 等操作会修改原列表。
	- extend 会迭代传入对象并逐个加入元素；append 会把传入对象整体作为一个元素加入。
	- sort 是原地排序；sorted 会返回新列表。

- **典型流程**
	- 追加单个元素用 append。
	- 合并可迭代对象用 extend。
	- 删除指定位置用 pop 或 del。
	- 删除第一个匹配值用 remove。
	- 需要排序时，先明确是否允许原地修改。

- **项目中怎么用**
	- 批量读取结果后，用 list 作为临时集合，再交给下游处理。
	- 需要稳定去重时，通常结合 dict 或 set，而不是只用 list。
	- 大量头部插入或弹出时，list 不一定合适，应考虑 deque。

- **面试表达**
	- list 的 append 和 extend 有什么区别？ #card
		- append 把参数作为一个整体元素追加到列表末尾；extend 会遍历参数，把其中元素逐个追加到列表中。

- **常见误区**
	- 误区：pop 必须传索引。
		- 不传索引时，pop 默认删除并返回最后一个元素。
	- 误区：sort 会返回排序后的新列表。
		- sort 原地修改列表，返回值不是新列表。

- **相关概念**
	- [[Concept/Python数据类型]]
	- [[Concept/Python可变对象]]
	- [[Concept/Python元组]]
	- [[Concept/Python集合]]

- **来源**
	- [[Python/操作方法/列表]]
	- [[Python/数据类型]]
