alias:: 数据库面试, MySQL面试, 数据同步面试
type:: review
domain:: [[MOC/数据库与数据同步]]
status:: active
created:: 2026-05-03
updated:: 2026-05-03

- **刷题入口**
	- [[Question/Binlog 在数据同步中解决什么问题]]
	- [[Question/Canal 如何保证 MySQL 到 ES 的同步]]
	- [[Question/MySQL 表关联和 union 有什么区别]]
	- [[Question/MySQL 窗口函数适合什么场景]]

- **短卡片**
	- Binlog 在同步里解决什么问题？ #card
		- 它提供 MySQL 数据变更的增量来源，让下游不用反复全表扫描，可以按事件同步到 ES、缓存、MQ 或数仓。
	- Canal 的核心职责是什么？ #card
		- Canal 负责订阅和解析 MySQL Binlog，把变更事件交给客户端、MQ 或同步任务；幂等写入、失败补偿和对账通常还要业务侧完成。
	- Join 和 union 的本质区别是什么？ #card
		- Join 是按关联键横向拼接表，union 是纵向合并结构兼容的查询结果。
	- 窗口函数和 `group by` 的区别是什么？ #card
		- `group by` 会聚合折叠行，窗口函数保留明细行并给每行附加窗口计算结果。

- **复习顺序**
	- 先刷 MySQL 查询：表关联、窗口函数、常用函数。
	- 再刷数据同步：Binlog、Canal、ES 同步。
	- 最后结合 [[Concept/混合检索]] 讲 MySQL 到 ES 的项目链路。

- **关联知识**
	- [[MOC/数据库与数据同步]]
	- [[Concept/MySQL]]
	- [[Concept/Binlog]]
	- [[Concept/Canal]]
	- [[Concept/混合检索]]
