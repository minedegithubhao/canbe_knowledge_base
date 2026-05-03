alias:: Mysql 表关联, SQL Join, Join, Union
type:: concept
domain:: [[MOC/数据库与数据同步]]
status:: seed
level:: 入门
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- MySQL 表关联是用 Join 把多张表按关联条件横向拼接；`union` 则是把结构相同的查询结果纵向合并。

- **解决的问题**
	- 当业务实体分散在多张表时，用 Join 组合出完整视图。
	- 当多个查询结果结构一致时，用 `union` 或 `union all` 合并结果集。

- **核心机制**
	- `inner join` 只保留两边都匹配的记录。
	- `left join` 保留左表记录，右表没有匹配时补空值。
	- `right join` 保留右表记录，左表没有匹配时补空值。
	- `union` 默认去重，`union all` 不去重。

- **典型流程**
	- 明确主表和关联表。
	- 确定关联键和过滤条件。
	- 判断是否需要保留未匹配记录。
	- 根据需求选择 `inner join`、`left join` 或 `union all`。

- **项目中怎么用**
	- 评估集、文档 metadata、用户行为和业务标签经常分表存储，查询分析时需要 Join。
	- RAG 管理后台可能需要把文档表、chunk 表、评估任务表和结果表关联起来定位问题。

- **面试表达**
	- Join 和 union 有什么区别？ #card
		- Join 是按关联键横向拼接多张表，结果列通常变多；union 是纵向合并多个查询结果，要求列结构兼容，结果行通常变多。

- **常见误区**
	- 误区：能用 Join 就随便 Join。
		- Join 要关注主表、连接类型、过滤条件位置和数据量，否则容易造成结果丢失或性能问题。
	- 误区：`union` 和 `union all` 一样。
		- `union` 会去重，可能更慢；`union all` 保留重复，适合确定不需要去重的场景。

- **相关概念**
	- [[Concept/MySQL]]
	- [[Concept/MySQL 常用函数]]

- **来源**
	- [[Mysql/表关联]]
