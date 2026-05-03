alias:: Mysql, MySQL数据库, 关系型数据库
type:: concept
domain:: [[MOC/数据库与数据同步]]
status:: growing
level:: 项目可用
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- MySQL 是常见的关系型数据库，负责以表、行、列和 SQL 的方式存储、查询和更新结构化业务数据。

- **解决的问题**
	- 保存结构化业务数据，例如用户、订单、文档 chunk、检索 metadata。
	- 用 SQL 支持过滤、排序、聚合、表关联、窗口分析和事务更新。
	- 在工程系统中充当主库，再通过 Binlog、消息队列或同步工具把变更传递给下游系统。

- **核心机制**
	- 表定义数据结构，行保存实体记录，列保存字段。
	- SQL 查询通过 `select`、`where`、`join`、`group by`、`order by`、窗口函数等表达数据需求。
	- 数据变更会进入事务、存储引擎和日志体系，其中 [[Concept/Binlog]] 可用于复制、恢复和增量同步。

- **典型流程**
	- 设计表结构和主键。
	- 写入业务数据。
	- 用 SQL 查询或聚合数据。
	- 数据变更通过 Binlog 被同步到 ES、缓存、数仓或其他服务。

- **项目中怎么用**
	- RAG 项目中，MySQL 可保存原始文档、chunk、metadata、评估集和任务状态。
	- 混合检索中，MySQL 常作为主数据源，ES/向量库作为检索索引。
	- 如果 ES 需要跟随 MySQL 更新，可用 [[Concept/Binlog]] 和 [[Concept/Canal]] 做增量同步。

- **面试表达**
	- MySQL 在检索系统里通常承担什么角色？ #card
		- MySQL 更适合做主数据存储和结构化查询，保存权威数据、状态和 metadata；ES 或向量库更适合做检索索引。工程上要区分主库和索引库，避免每次检索都回查主库造成延迟和耦合。

- **常见误区**
	- 误区：MySQL、ES、向量库可以互相替代。
		- 它们各自擅长的访问模式不同。MySQL 擅长事务和结构化查询，ES 擅长倒排检索，向量库擅长相似度检索。
	- 误区：数据同步只要把数据定时复制过去就行。
		- 生产系统通常还要考虑增量同步、幂等、乱序、失败重试和全量校验。

- **相关概念**
	- [[Concept/MySQL 表关联]]
	- [[Concept/MySQL 窗口函数]]
	- [[Concept/MySQL 常用函数]]
	- [[Concept/Binlog]]
	- [[Concept/Canal]]
	- [[Concept/混合检索]]
	- [[Concept/倒排索引]]

- **来源**
	- [[Mysql]]
	- [[Mysql/表关联]]
	- [[Mysql/函数/字符串函数]]
	- [[Mysql/函数/数值函数]]
	- [[Mysql/函数/时间日期函数]]
	- [[Mysql/函数/开窗函数]]
	- [[Mysql/条件判断]]
	- [[Source/MySQL 8.4 Reference Manual - Binary Logging]]
