alias:: Canal 官方 README, Alibaba Canal 官方文档
type:: source
source-type:: official-doc
author:: Alibaba
url:: https://github.com/alibaba/canal
accessed:: 2026-05-03
created:: 2026-05-03
updated:: 2026-05-03
status:: compiled

- **原始信息**
	- Alibaba Canal GitHub README。

- **核心观点**
	- Canal 是 MySQL Binlog 增量订阅和消费组件。
	- Canal 支持 client-server 模式，可将变更记录投递到 MQ 等下游系统。
	- 多语言客户端可基于 Canal 解析结果实现不同消费逻辑。

- **可沉淀的概念**
	- [[Concept/Canal]]
	- [[Concept/Binlog]]

- **已更新页面**
	- [[Concept/Canal]]
	- [[Question/Canal 如何保证 MySQL 到 ES 的同步]]

- **待追问问题**
	- Canal 同步链路如何做位点管理、幂等和补偿？
