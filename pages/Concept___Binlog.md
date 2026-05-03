alias:: MySQL Binlog, MySQL 二进制日志, Binary Log
type:: concept
domain:: [[MOC/数据库与数据同步]]
status:: stable
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- Binlog 是 MySQL 的二进制日志，用来记录数据变更，是主从复制、恢复和增量同步的重要数据源。

- **解决的问题**
	- 让下游系统知道 MySQL 发生了哪些增删改。
	- 支撑主从复制、数据恢复、审计和异构同步。
	- 在 MySQL 到 ES、缓存、消息队列、数仓的链路中提供增量变更来源。

- **核心机制**
	- MySQL 在执行会改变数据的操作时写入二进制日志。
	- 下游复制组件或订阅组件按位点持续读取日志。
	- 订阅方把日志事件解析成表、主键、操作类型和变更前后数据，再投递给目标系统。

- **典型流程**
	- MySQL 写入业务数据。
	- Binlog 记录变更事件。
	- [[Concept/Canal]] 伪装成 MySQL 从库或订阅端拉取 Binlog。
	- Canal 解析事件并投递给 ES、MQ 或业务消费者。
	- 下游按主键幂等更新索引或缓存。

- **项目中怎么用**
	- 在 RAG 混合检索中，文档 chunk 先写 MySQL 主库，再通过 Binlog/Canal 同步到 ES。
	- 这样 ES 可以承担关键词检索，MySQL 保持权威数据，系统不需要在检索阶段逐条回查 MySQL。

- **面试表达**
	- Binlog 在数据同步里解决什么问题？ #card
		- Binlog 提供数据库变更的增量来源。同步系统不需要反复全表扫描，只要订阅 Binlog，就能把新增、修改、删除事件传给 ES、缓存或消息队列。

- **常见误区**
	- 误区：Binlog 等于业务消息队列。
		- Binlog 是数据库变更日志，不直接表达业务语义；消费者仍需要解析表结构、操作类型、幂等和异常补偿。
	- 误区：订阅 Binlog 就一定强一致。
		- Binlog 同步通常是异步链路，还需要处理延迟、失败重试、重复消费和全量校验。

- **相关概念**
	- [[Concept/MySQL]]
	- [[Concept/Canal]]
	- [[Concept/混合检索]]
	- [[Concept/倒排索引]]

- **来源**
	- [[Binlog]]
	- [[Source/MySQL 8.4 Reference Manual - Binary Logging]]
	- [[Source/Alibaba Canal README]]
