alias:: Python dict 为什么快, 字典查询为什么快, Python哈希表
type:: question
domain:: [[MOC/Python]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Python 字典为什么查询快？

- **标准回答**
	- Python 字典基于哈希表实现。查询时会先根据 key 计算哈希值，再定位到候选存储位置，所以平均情况下查询、插入和删除都接近常数时间。
	- 这个结论有前提：key 必须可哈希，哈希值在生命周期内应稳定；如果发生哈希冲突，会通过冲突处理继续定位，因此极端情况下性能会退化。

- **回答结构**
	- 先说 dict 是 key-value 映射。
	- 再说底层核心是哈希表。
	- 再解释通过 key 的哈希值定位位置。
	- 最后补充 key 可哈希、冲突和扩容边界。

- **项目追问**
	- list 查找和 dict 查找有什么区别？
		- list 通常需要线性扫描；dict 能通过 key 的哈希值快速定位。
	- 为什么 list 不能直接作为 dict key？
		- list 是可变对象，内容变化会导致哈希不稳定，因此不可哈希。

- **关联知识**
	- [[Concept/Python字典]]
	- [[Concept/Python集合]]
	- [[Concept/Python可变对象]]

- **我的易错点**
	- 不要只说“因为用了哈希”，要说明哈希值如何帮助定位。
	- 不要忘记 key 必须可哈希。

- **来源**
	- [[Concept/Python字典]]
	- [[Python/操作方法/字典]]
