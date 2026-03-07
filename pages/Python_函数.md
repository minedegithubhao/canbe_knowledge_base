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
- 全局变量的修改：python中定义的全局变量（数值、字符串、布尔类型、元组类型）修改时需要加上`global`,`可变类型`(引用可变)可以不加global关键字。
	- ```python
	  # 定义全局变量num = 10
	  num = 10
	  # 定义一个函数func
	  def func():
	      # 尝试在局部作用域中修改全局变量
	      num = 20
	  # 调用函数func
	  func()
	  # 尝试访问全局变量num
	  print(num) # 输出：10
	  
	  
	  def func():
	      # 加上global才能修改全局变量
	      global num
	      num = 20
	  ```
- 函数缺省参数（默认值）：定义缺省参数要写在参数列表最后
	- ```python
	  def user_info(name, age, gender='男'):
	      print(f'我的名字{name}，今年{age}岁了，我的性别为{gender}')
	  
	  user_info('李林', 25)
	  user_info('振华', 28)
	  user_info('婉儿', 18, '女')
	  ```
- 不定长元组（位置）参数
	- ```python
	  def user_info(*args):
	      # print(args)  # 元组类型数据，对传递参数有顺序要求
	      print(f'我的名字{args[0]}，今年{args[1]}岁了，住在{args[2]}')
	  
	  # 调用函数，传递参数
	  user_info('Tom', 23, '美国纽约')
	  ```
- 不定长字典（关键字）参数
	- ```python
	  def user_info(**kwargs):
	      # print(kwargs)  # 字典类型数据，对传递参数没有顺序要求，格式要求key = value值
	      print(f'我的名字{kwargs["name"]}，今年{kwargs["age"]}岁了，住在{kwargs["address"]}')
	  
	  # 调用函数，传递参数
	  user_info(name='Tom', address='美国纽约', age=23)
	  ```
- 不定长元组 + 字典参数
	- ```python
	  def func(*args, **kwargs):
	      print(args)
	      print(kwargs)
	  
	  
	  # 定义一个元组（也可以是列表）
	  tuple1 = (10, 20, 30)
	  # 定义一个字典
	  dict1 = {'first': 40, 'second': 50, 'third': 60}
	  # 需求：把元组传递给*args参数，字典传递给**kwargs
	  # ① 如果想把元组传递给*args，必须在tuple1的前面加一个*号
	  # ② 如果想把字典传递给**kwargs，必须在dict1的前面加两个**号
	  func(*tuple1, **dict1)
	  ```