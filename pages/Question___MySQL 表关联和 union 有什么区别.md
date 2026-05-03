alias:: Join 和 Union 区别, SQL 表关联面试
type:: question
domain:: [[MOC/数据库与数据同步]]
difficulty:: 低
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- MySQL 表关联和 union 有什么区别？

- **标准回答**
	- 表关联通常指 Join，是按关联条件把多张表横向拼接，结果会包含来自多张表的列。`union` 是把多个查询结果纵向合并，要求列数量和类型兼容，结果行数通常变多。
	- `union` 默认去重，`union all` 不去重。实际项目里，Join 用来拼实体关系，union 用来合并同构结果。

- **回答结构**
	- 先讲方向：Join 横向，union 纵向。
	- 再讲前提：Join 需要关联条件，union 需要列结构兼容。
	- 再讲去重：`union` 去重，`union all` 不去重。
	- 最后讲场景：实体拼接 vs 结果合并。

- **项目追问**
	- 为什么有时 `union all` 比 `union` 更合适？
		- 如果业务确定不需要去重，`union all` 避免额外去重成本，语义也更明确。

- **关联知识**
	- [[Concept/MySQL 表关联]]
	- [[Concept/MySQL]]

- **我的易错点**
	- 不要把 `left join` 和 `union` 混为一谈。
	- 注意 `union` 的去重语义。

- **来源**
	- [[Concept/MySQL 表关联]]
	- [[Mysql/表关联]]
