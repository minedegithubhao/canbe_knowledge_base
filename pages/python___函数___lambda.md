- 基本语法
	- ```python
	  变量 = lambda 函数参数:表达式（函数代码 + return返回值）
	  # 调用变量
	  变量()
	  ```
- 空参的lambda表达式
	- ```python
	  def fn1():
	      return 100
	  
	  fn1 = lambda : 100
	  ```
- 带参数的lambda表达式
	- ```python
	  def fn1(num1, num2):
	      return num1 + num2
	  
	  fn1 = lambda num1, num2 : num1 + num2
	  ```
- 带默认参数的lambda表达式
	- ```python
	  def fn2(num1, num2=30):
	      return num1 + num2
	  
	  fn2 = lambda num1, num2=30 : num1 + num2
	  ```
- 三目运算符lambda表达式
	- ```python
	  # 带 if判断（三目运算符）的lambda表达式
	  # 普通函数
	  def fn3(name: str):
	      a = 0
	      if name == "张三":
	          a = 1
	      else:
	          a = 0
	      return a
	  
	  # 普通函数
	  def fn4(name: str):
	      return 1 if name == "张三" else 0
	    
	  # lambda表达式
	  fn4 = lambda name : 1 if name == "张三" else 0
	  ```
- 列表数据+字典数据排序（重点）
	- ```python
	  # 在一个列表中, 放置了三个元素, 每一个元素又是一个字典
	  students = [
	      {'name': 'Tom', 'age': 20},
	      {'name': 'Rose', 'age': 19},
	      {'name': 'Jack', 'age': 22}
	  ]
	  
	  
	  # 知识点：列表.sort(key=排序的key索引, reverse=True)
	  # key: 是用于指定 根据 谁 进行排序 默认是列表中一个个的元素
	  #def fn1(student_dict): # key就是students的元素 = student_dict
	  #  return student_dict['name']
	  
	  # 按name值升序排列
	  # students.sort(key=lambda x: x['name']) # 所以这里的x是字典student_dict。
	  students.sort(key=lambda x: x['age'], reverse=True)
	  ```