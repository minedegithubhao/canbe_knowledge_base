alias:: MySQL Binary Logging 官方文档, MySQL Binlog 官方文档
type:: source
source-type:: official-doc
author:: MySQL
url:: https://dev.mysql.com/doc/refman/8.4/en/replication-options-binary-log.html
accessed:: 2026-05-03
created:: 2026-05-03
updated:: 2026-05-03
status:: compiled

- **原始信息**
	- MySQL 8.4 Reference Manual 中关于 Binary Logging 的官方说明。

- **核心观点**
	- Binary log 记录会改变数据的操作，可用于备份和复制。
	- MySQL 提供 `log_bin`、`log_bin_basename` 等选项和变量管理二进制日志。
	- 在复制和恢复场景中，禁用 binary logging 会影响 GTID 恢复和复制能力。

- **可沉淀的概念**
	- [[Concept/Binlog]]
	- [[Concept/MySQL]]

- **已更新页面**
	- [[Concept/Binlog]]
	- [[Question/Binlog 在数据同步中解决什么问题]]

- **待追问问题**
	- Binlog 三种格式在同步系统中如何取舍？
