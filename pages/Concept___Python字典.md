alias:: Python字典, dict, 字典, 哈希表
type:: concept
domain:: [[MOC/Python]]
status:: growing
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- Python 字典是基于哈希表的 key-value 映射容器，适合快速查找、更新和表达结构化对象。

- **解决的问题**
	- 通过 key 快速定位 value。
	- 表达配置、对象属性、索引、计数和聚合结果。
	- 在数据处理中建立从标识到数据的映射。

- **核心机制**
	- dict 通过 key 的哈希值定位存储位置，平均查询、插入和删除接近常数时间。
	- key 必须可哈希，且相等对象应有一致哈希。
	- values 可以是任意对象。
	- keys、values、items 返回的是视图对象，会随字典变化而反映最新内容。
	- 哈希冲突会影响性能，但正常使用下 dict 仍然非常适合快速查找。

- **典型流程**
	- 用方括号按 key 访问确定存在的值。
	- 用成员判断或 get 处理可能不存在的 key。
	- 用 items 遍历 key 和 value。
	- 用 clear 清空字典，用 del 删除指定 key。

- **项目中怎么用**
	- 数据清洗时用 dict 建立 id 到记录的索引。
	- 统计时用 dict 或 defaultdict 计数和聚合。
	- 接口和配置中用 dict 表达结构化字段。

- **面试表达**
	- Python dict 为什么查询快？ #card
		- dict 基于哈希表，先计算 key 的哈希值，再定位到候选存储位置，因此平均查找接近常数时间。需要补充 key 必须可哈希，哈希冲突和扩容会影响细节性能。

- **常见误区**
	- 误区：所有对象都能做 dict key。
		- 可变对象通常不可哈希，不能直接作为 dict key。
	- 误区：访问不存在的 key 一定返回空。
		- 方括号访问不存在 key 会抛出异常，需要用 get、成员判断或异常处理。

- **相关概念**
	- [[Concept/Python数据类型]]
	- [[Concept/Python可变对象]]
	- [[Concept/Python集合]]

- **来源**
	- [[Python/操作方法/字典]]
	- [[Python/数据类型]]
