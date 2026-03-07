- 容器拆包
	- ```python
	  # 把元组中的数据拆解出来
	  
	  tuple1 = (10, 20)
	  # 拆包
	  num1, num2 = tuple1
	  以上代码可以简写为
	  num1, num2 = (10, 20)
	  ```
	- ```python
	  # 数据交换
	  c1 = '可乐'
	  c2 = '牛奶'
	  c2, c1 = c1, c2
	  print(f"{c1}, {c2}") # 输出： 牛奶, 可乐
	  ```
- 推导式
	- ```python
	  # 推导式演示:
	  """
	      格式:
	          变量名 = [表达式 for 变量 in 列表]
	          变量名 = [表达式 for 变量 in 列表 if 条件]
	          变量名 = [表达式 for 变量 in 列表 for 变量 in 列表]
	  
	  """
	  # 变量名 = [表达式 for 变量 in 列表]
	  my_list = []
	  for i in range(1,10):
	    my_list.append(i)
	  print(my_list) # 输出： [1, 2, 3, 4, 5, 6, 7, 8, 9]
	  # 使用推导式
	  my_list = [i for i in range(1, 10)]
	  print(my_list) # 输出： [1, 2, 3, 4, 5, 6, 7, 8, 9]
	  
	  
	  # 带条件的推导式：变量名 = [表达式 for 变量 in 列表 if 条件]
	  my_list3 = []
	  for e in range(0, 10):
	    if e % 2 == 0:
	      my_list3.append(e)
	  print(my_list3)
	  # 使用推导式
	  my_list3 = [i for i in range(10) if i % 2 == 0]
	  print(my_list3)
	  
	  
	  # 嵌套循环的推导式
	  my_list6 = []
	  for i in range(1, 3):
	    for e in range(0, 3):
	      my_list6.append((i, e))
	  print(my_list6)
	  推导式
	  my_list6 = [(i, e) for i in range(1, 3) for e in range(0, 3)]
	  ```
- 自定义函数
	- ```python
	  def sale_ticket_1(name):
	      print(f"卖出1张票,卖给了{name}")
	  ```
- 多个返回值：使用元组模拟返回多个结果，理论上一个函数只能返回一个结果
	- ```python
	  # 类似Java中使用集合返回多个结果，不过这里使用语法糖免去了创建集合的过程
	  def return_num():
	      return 1, 2
	    
	  result = return_num()
	  print(result)
	  print(type(result))  # <class 'tuple'>
	  ```