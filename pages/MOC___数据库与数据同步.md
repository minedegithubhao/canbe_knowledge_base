alias:: 数据库地图, 数据同步地图, MySQL地图
type:: moc
status:: growing
created:: 2026-05-03
updated:: 2026-05-03

- **学习路径**
	- 先理解关系型数据库基础：[[Concept/MySQL]]
	- 再理解查询表达：[[Concept/MySQL 表关联]]、[[Concept/MySQL 窗口函数]]、[[Concept/MySQL 常用函数]]
	- 再理解变更日志：[[Concept/Binlog]]
	- 最后理解增量同步链路：[[Concept/Canal]]

- **核心概念**
	- [[Concept/MySQL]]
	- [[Concept/MySQL 表关联]]
	- [[Concept/MySQL 窗口函数]]
	- [[Concept/MySQL 常用函数]]
	- [[Concept/Binlog]]
	- [[Concept/Canal]]

- **项目实战**
	- [[Concept/混合检索]]
		- MySQL 可作为业务主库，ES 作为检索索引，Binlog/Canal 负责增量同步。
	- [[Project/手册类RAG实战]]
		- 可从 RAG 检索工程角度理解 MySQL、ES、Canal 的职责边界。

- **面试重点**
	- [[Review/数据库与数据同步面试]]
	- [[Question/Binlog 在数据同步中解决什么问题]]
	- [[Question/Canal 如何保证 MySQL 到 ES 的同步]]
	- [[Question/MySQL 表关联和 union 有什么区别]]
	- [[Question/MySQL 窗口函数适合什么场景]]

- **旧页面迁移索引**
	- 已迁移：[[Mysql]]、[[Binlog]]、[[Canal]]
	- 已归档为来源：[[Mysql/函数/字符串函数]]、[[Mysql/函数/数值函数]]、[[Mysql/函数/时间日期函数]]、[[Mysql/函数/开窗函数]]、[[Mysql/条件判断]]、[[Mysql/表关联]]

- **最近更新**
	- 2026-05-03
		- 建立数据库与数据同步 MOC，接入 MySQL、Binlog、Canal 和面试复习入口。

- **尚未整理**
	- 事务、索引、锁、隔离级别、慢查询优化。
