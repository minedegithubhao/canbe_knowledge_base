alias:: Canal 同步 ES 面试, MySQL ES 同步怎么做
type:: question
domain:: [[MOC/数据库与数据同步]]
difficulty:: 中
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Canal 如何保证 MySQL 到 ES 的同步？

- **标准回答**
	- Canal 订阅 MySQL Binlog，解析出表、主键、操作类型和字段变更，再把事件交给同步任务或 MQ。同步任务按主键幂等写入 ES，处理新增、更新和删除。
	- 可靠性不能只靠 Canal。生产上还需要失败重试、消费位点、重复消费幂等、延迟监控、索引映射兼容和定时全量对账，才能保证最终一致。

- **回答结构**
	- 先讲数据来源：MySQL Binlog。
	- 再讲 Canal 职责：订阅、解析、投递。
	- 再讲 ES 写入：按主键 upsert/delete。
	- 最后讲可靠性：幂等、重试、延迟、对账、告警。

- **项目追问**
	- 如果 Canal 漏数据怎么办？
		- 通过消费位点、失败告警、补偿任务和 MySQL/ES 定时对账修复。
	- 如果 ES 写入失败怎么办？
		- 同步任务要重试，超过阈值进入死信或补偿队列，不能直接丢弃。

- **关联知识**
	- [[Concept/Canal]]
	- [[Concept/Binlog]]
	- [[Concept/MySQL]]
	- [[Concept/混合检索]]

- **我的易错点**
	- 不要只说“监听 Binlog”。
	- 要补上幂等、失败重试、监控和对账。

- **来源**
	- [[Concept/Canal]]
	- [[Canal]]
	- [[Source/Alibaba Canal README]]
