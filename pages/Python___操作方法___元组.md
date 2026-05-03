alias:: Python元组旧笔记
type:: concept
status:: archived
updated:: 2026-05-03

- **迁移说明**
	- 本页面内容已整理到 [[Concept/Python元组]] 和 [[Question/Python 列表和元组有什么区别]]。
	- 后续请维护新页面；本页保留旧操作示例。

- for循环
	- ```python
	  # for 循环
	  for e in tuple1:
	      print(e)
	  ```
- 查
	- ```python
	  userTuple = ('张三', '李四', '王五', 10, 20, 30, True, False)
	  # 使用索引查找元素
	  元组[索引]
	  userTuple[1] # 输出： 李四
	  # 查找元素
	  userTuple.index('王五') # 输出： 2
	  # 统计数量
	  userTuple.count('王五') # 输出： 1
	  # 元组长度
	  len(userTuple) # 输出：8
	  ```
