alias:: MySQL 开窗函数面试, SQL Window Function 面试
type:: question
domain:: [[MOC/数据库与数据同步]]
difficulty:: 中
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- MySQL 窗口函数适合什么场景？

- **标准回答**
	- 窗口函数适合在保留明细行的同时做组内排名、Top N、累计统计、占比、前后行比较等计算。它和 `group by` 的区别是，`group by` 会把多行聚合成一行，而窗口函数会保留每一行。
	- 常见函数包括 `row_number`、`rank`、`dense_rank`、`lag`、`lead`，窗口范围由 `over`、`partition by` 和 `order by` 决定。

- **回答结构**
	- 先讲核心：保留明细行。
	- 再讲场景：排名、Top N、累计、前后行。
	- 再讲语法：`over`、`partition by`、`order by`。
	- 最后和 `group by` 对比。

- **项目追问**
	- 每个用户取最近一次行为怎么写？
		- 可以按用户 `partition by`，按时间倒序 `order by`，用 `row_number` 标记第一条，再外层过滤排名为 1。

- **关联知识**
	- [[Concept/MySQL 窗口函数]]
	- [[Concept/MySQL]]

- **我的易错点**
	- 不要忘记窗口函数不会自动过滤，只是给行加计算结果。
	- `rank` 并列会跳号，`dense_rank` 不跳号。

- **来源**
	- [[Concept/MySQL 窗口函数]]
	- [[Mysql/函数/开窗函数]]
