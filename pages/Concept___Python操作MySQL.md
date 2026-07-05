alias:: Python MySQL, Python操作Mysql, Python数据库操作, PyMySQL, mysql-connector
type:: concept
domain:: [[MOC/Python]]
status:: growing
level:: 项目可用
created:: 2026-05-03
updated:: 2026-05-26

- **一句话定义**
	- Python 操作 MySQL 是指用 Python 客户端连接 MySQL，执行查询、写入、事务和批量处理，并在工程中保证安全、稳定和可维护。

- **解决的问题**
	- 让 Python 脚本、后端服务或数据任务读写关系型数据。
	- 把业务对象、模型结果或任务状态持久化到 MySQL。
	- 在工程中处理连接、事务、异常、SQL 注入和资源释放。

- **核心流程**
	- 创建连接或从连接池获取连接。
	- 创建游标，使用参数化 SQL 执行查询或写入。
	- 查询场景读取结果并转换为业务结构。
	- 写入场景根据事务边界提交或回滚。
	- 最后关闭游标和连接，或归还连接池。

- **常见操作**
	- 查询：使用条件过滤、分页和必要索引，避免一次性拉取过大结果集。
	- 新增：批量插入时优先使用批量执行，减少网络往返。
	- 更新：明确 where 条件和影响行数，防止误更新。
	- 删除：优先软删除或先确认影响范围，重要数据避免直接硬删。
	- 事务：多个相关写操作要么全部成功，要么失败回滚。

- **工程要点**
	- 使用参数化 SQL，不拼接用户输入，避免 SQL 注入。
	- 连接信息不要写死在代码里，使用配置或环境变量管理。
	- Web 服务和长期任务优先使用连接池，避免频繁创建连接。
	- 捕获数据库异常时要区分可重试错误、数据错误和业务错误。
	- 线上代码要记录慢 SQL、失败原因和关键上下文，但不要记录敏感数据。

- **面试表达**
	- Python 操作 MySQL 要注意什么？ #card
		- 要讲连接管理、参数化 SQL、防注入、事务提交回滚、异常处理、连接池和资源释放。不要只说增删改查 API。

- **常见误区**
	- 误区：会执行 SQL 就等于会用 Python 操作 MySQL。
		- 工程里更重要的是事务边界、连接复用、异常处理和数据安全。
	- 误区：字符串拼接 SQL 简单直接。
		- 拼接用户输入会带来 SQL 注入风险，应该使用参数化查询。

- **证据链说明**
	- [[Python操作Mysql]] 是旧笔记来源，只能支撑“Python 操作 MySQL”这个主题入口和增删改查范围。
	- 工程要点需要结合 [[Question/Python 操作 MySQL 要注意什么]] 复习，重点是连接生命周期、参数化 SQL、事务、异常处理和资源释放。
	- MySQL 的数据库角色和数据同步背景可回到 [[Concept/MySQL]]、[[Concept/Binlog]] 和 [[Concept/Canal]]。

- **相关概念**
	- [[Concept/Python]]
	- [[Concept/Python异常]]
	- [[Concept/Python上下文管理器]]
	- [[Concept/MySQL]]
	- [[Concept/MySQL 表关联]]
	- [[Question/Python 操作 MySQL 要注意什么]]

- **来源**
	- [[Python操作Mysql]]
	- [[Concept/MySQL]]
	- [[Question/Python 操作 MySQL 要注意什么]]
