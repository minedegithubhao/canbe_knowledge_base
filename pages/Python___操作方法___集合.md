alias:: Python集合旧笔记
type:: concept
status:: archived
updated:: 2026-05-03

- **迁移说明**
	- 本页面内容已整理到 [[Concept/Python集合]]。
	- 后续请维护新页面；本页保留旧操作示例。

- 增
	- ```python
	  set1 = {'张三', '李四', '王五', '张三', '王五', '赵六'}
	  set1.add('黄七') # 输出： {'黄七', '李四', '张三', '王五', '赵六'}
	  ```
- 删
	- ```python
	  set1 = {'张三', '李四', '王五', '张三', '王五', '赵六'}
	  set1.remove('张三') # 输出： {'李四', '赵六', '王五'}
	  ```
- 查
	- ```python
	  set1 = {'张三', '李四', '王五', '张三', '王五', '赵六'}
	  print('张三' in set1) # 输出： True
	  print('张三' not in set1) # 输出： False
	  ```
- 遍历
	- ```python
	  for e in set1:
	    print(e)
	  ```
-
