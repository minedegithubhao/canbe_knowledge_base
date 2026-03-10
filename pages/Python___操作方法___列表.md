alias:: 列表

- 遍历
	- ```python
	  userList = ['张三','李四','王五','赵六']
	  
	  # for循环
	  for e in userList:
	      print(e)
	      
	  # while循环
	  # 计数器
	  i = 0
	  while i < len(userList):
	      print(userList[i])
	  
	      # 更新计数器
	      i += 1
	  ```
- 查
	- ```python
	  ls = ['apple', 'banana', 'pineapple', 'apple']
	  print(ls[1])
	  # 获取下标
	  print(ls.index('apple')) # 输出： 0
	  # 统计次数
	  print(ls.count('apple')) # 输出： 2
	  # 判断是否存在
	  print('banana' in ls) # 输出： True
	  # 判断是否存在
	  print('banana' not in ls) # 输出： False
	  ```
- 增
	- ```python
	  ls = ['apple', 'banana', 'pineapple']
	  ls.append('orange') # 输出： ['apple', 'banana', 'pineapple', 'orange']
	  
	  ls = ['apple', 'banana', 'pineapple']
	  ls.extend(['orange']) # 输出： ['apple', 'banana', 'pineapple', 'orange']
	  ls.extend('orange') # 输出：['apple', 'banana', 'pineapple', 'orange', 'o', 'r', 'a', 'n', 'g', 'e']
	  
	  ls = ['apple', 'banana', 'pineapple']
	  ls.insert(1, 'orange') # 输出： ['apple', 'orange', 'banana', 'pineapple']
	  ```
- 删
	- ```python
	  ls = ['apple', 'banana', 'pineapple']
	  # 删除指定下标数据
	  del ls[1] # 输出： ['apple', 'pineapple']
	  
	  ls = ['apple', 'banana', 'pineapple']
	  # 默认删除最后一个数据
	  ls.pop() # 输出： ['apple', 'banana']
	  # 删除指定位置数据
	  ls.pop(1) # 输出：['apple', 'pineapple']
	  
	  ls = ['apple', 'banana', 'pineapple', 'banana']
	  # 移除第一个匹配项
	  ls.remove('banana') # 输出；['apple', 'pineapple', 'banana']
	  ```
- 改
	- ```python
	  ls = ['apple', 'banana', 'pineapple', 'banana']
	  # 修改指定位置内容
	  ls[1] = 'orange' # 输出： ['apple', 'orange', 'pineapple', 'banana']
	  
	  ls = ['apple', 'banana', 'pineapple']
	  # 倒序
	  ls.reverse() # 输出： ['pineapple', 'banana', 'apple']
	  
	  # 排序
	  ls = [5, 3, 1, 2, 4]
	  # 升序
	  ls.sort() # 输出： [1, 2, 3, 4, 5]
	  # 降序
	  ls.sort(reverse= True) # 输出： [5, 4, 3, 2, 1]
	  ```