alias:: Python MySQL 面试, Python数据库操作注意事项
type:: question
domain:: [[MOC/Python]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Python 操作 MySQL 要注意什么？

- **标准回答**
	- Python 操作 MySQL 不能只讲增删改查，还要讲工程边界。首先要正确管理连接和游标，长期服务优先使用连接池；其次要使用参数化 SQL，避免拼接用户输入导致 SQL 注入；写操作要明确事务边界，成功提交，失败回滚；最后要做好异常处理、资源释放、慢 SQL 日志和配置管理。

- **回答结构**
	- 连接管理和连接池。
	- 参数化 SQL 和防注入。
	- 查询、插入、更新、删除的影响范围。
	- 事务提交和回滚。
	- 异常处理、日志和资源释放。

- **项目追问**
	- 为什么不要拼接 SQL？
		- 用户输入可能改变 SQL 语义，造成 SQL 注入，应该使用参数化查询。
	- 什么时候需要事务？
		- 多个写操作必须保持一致时需要事务，例如订单和库存同时更新。

- **关联知识**
	- [[Concept/Python操作MySQL]]
	- [[Concept/MySQL]]
	- [[Concept/Python异常]]
	- [[Concept/Python上下文管理器]]

- **我的易错点**
	- 不要只说会查询和写入。
	- 要主动讲安全、事务和连接生命周期。

- **来源**
	- [[Concept/Python操作MySQL]]
	- [[Python操作Mysql]]

