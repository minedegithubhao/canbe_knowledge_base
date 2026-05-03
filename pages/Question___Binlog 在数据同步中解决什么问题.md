alias:: Binlog 同步作用, MySQL Binlog 面试
type:: question
domain:: [[MOC/数据库与数据同步]]
difficulty:: 中
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Binlog 在数据同步中解决什么问题？

- **标准回答**
	- Binlog 解决的是数据库变更的增量捕获问题。MySQL 发生新增、修改、删除后，会把变更写入 Binlog。下游系统可以订阅这些日志，把变更同步到 ES、缓存、MQ 或数仓，而不需要反复全量扫描数据库。
	- 在工程上，Binlog 只是变更来源。要做可靠同步，还需要消费者处理位点、幂等、重复消费、失败重试、延迟监控和全量校验。

- **回答结构**
	- 先定义：MySQL 二进制变更日志。
	- 再说明用途：复制、恢复、增量同步。
	- 再讲链路：MySQL 写入、Binlog 记录、Canal 解析、下游消费。
	- 最后补工程风险：异步延迟、重复、失败、对账。

- **项目追问**
	- 为什么不用定时全表扫描？
		- 全表扫描成本高、延迟大、对主库压力大，而且难以及时捕获删除和更新。
	- Binlog 同步是否强一致？
		- 通常不是强一致，是异步最终一致，需要延迟监控和补偿。

- **关联知识**
	- [[Concept/Binlog]]
	- [[Concept/Canal]]
	- [[Concept/MySQL]]
	- [[Concept/混合检索]]

- **我的易错点**
	- 不要把 Binlog 说成业务消息队列。
	- 不要忽略幂等、失败重试和对账。

- **来源**
	- [[Concept/Binlog]]
	- [[Binlog]]
	- [[Source/MySQL 8.4 Reference Manual - Binary Logging]]
