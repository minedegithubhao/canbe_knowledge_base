alias:: Alibaba Canal, MySQL 增量订阅, Canal 同步
type:: concept
domain:: [[MOC/数据库与数据同步]]
status:: stable
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- Canal 是阿里开源的 MySQL Binlog 增量订阅和消费组件，常用于把 MySQL 变更同步到 ES、MQ 或其他下游系统。

- **解决的问题**
	- 避免下游系统定时全表扫描 MySQL。
	- 将 MySQL 的新增、修改、删除事件实时或准实时推送给检索索引、缓存和消息系统。
	- 在 MySQL 主库和 ES/缓存/数仓之间建立可追踪的增量同步链路。

- **核心机制**
	- Canal 订阅 MySQL Binlog。
	- 解析 Binlog 中的数据库、表、主键、操作类型和字段变更。
	- 将变更事件投递给 Canal Client、MQ 或下游同步任务。
	- 下游按事件更新 ES 索引、缓存或其他存储。

- **典型流程**
	- MySQL 写入或更新 chunk。
	- Binlog 产生变更事件。
	- Canal 拉取并解析事件。
	- 同步任务把事件转成 ES 文档更新。
	- 定时校验任务兜底修复遗漏、乱序或失败数据。

- **项目中怎么用**
	- 混合检索项目中，Canal 可把 MySQL chunk 表同步到 ES，让 ES 保存和 MySQL 一致的原生 JSON。
	- 检索时 ES 能直接返回关键词召回结果，不需要再逐条回查 MySQL。

- **面试表达**
	- Canal 如何保证 MySQL 到 ES 的同步？ #card
		- Canal 订阅 MySQL Binlog 获取增量变更，然后同步任务按主键幂等写入 ES。工程上还需要处理失败重试、重复消费、延迟监控和定时全量校验，不能只说“监听 Binlog”。

- **常见误区**
	- 误区：Canal 自己完成所有业务同步逻辑。
		- Canal 主要负责 Binlog 订阅和解析，字段映射、幂等写入、异常补偿通常还需要业务同步任务完成。
	- 误区：有 Canal 就不需要校验。
		- 生产链路仍可能有延迟、失败、重复或格式变更，定时对账和告警很重要。

- **相关概念**
	- [[Concept/MySQL]]
	- [[Concept/Binlog]]
	- [[Concept/混合检索]]
	- [[Concept/倒排索引]]

- **来源**
	- [[Canal]]
	- [[Source/Alibaba Canal README]]
	- [[Concept/混合检索]]
