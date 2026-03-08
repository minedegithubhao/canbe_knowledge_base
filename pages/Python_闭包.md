- 闭包
	- ```python
	  # 用闭包实现“带状态的函数”
	  def cacl():
	      count = 0  # 这个变量不会被外部访问，天然封装
	      def add():
	          nonlocal count  # 声明使用外部函数的变量
	          count += 1
	          return count
	      return add
	  
	  # 创建两个独立的计数器（状态互不干扰）
	  cacl1 = cacl()
	  print(cacl1)
	  cacl2 = cacl()
	  print(cacl2)
	  
	  print(f'cacl1()计算结果{cacl1()}')  # 1（计数器1的count=1）
	  print(f'cacl1()计算结果{cacl1()}')  # 1（计数器1的count=1）
	  print(f'cacl2()计算结果{cacl2()}')  # 1（计数器1的count=1）
	  ```
	- ```python
	  # 闭包的类的实现
	  class Counter:
	      def __init__(self):
	          # 实例属性 = Java的成员变量
	          self.count = 0
	      
	      def increment(self):
	          self.count += 1
	          return self.count
	  
	  # 创建对象 = Java的new Counter()
	  counter1 = Counter()
	  counter2 = Counter()
	  
	  print(counter1.increment())  # 1
	  print(counter1.increment())  # 2
	  print(counter2.increment())  # 1
	  ```
- `nonlocal`关键字和`global`关键字的区别 #card #Python/基础知识
	- nonlocal关键字（在函数内部修改函数外部的变量，这个变量非全局变量）
		- ```python
		  '''
		  Python闭包：① 有嵌套 ② 有引用 ③ 有返回
		  '''
		  
		  def outer():
		      num = 10
		      def inner():
		          # 这种写法无法实现通过闭包修改外部的局部变量'
		          nonlocal num
		          num = 20
		      print('outer函数中的num：', num)  # 10
		      inner()  # 执行函数inner，让num=20生效
		      print('outer函数中的num：', num)  # 20
		      return inner
		  
		  f = outer()
		  f()
		  ```
	- global关键字（在函数内部声明变量，代表引用全局作用域中的全局变量）
		- {{embed ((69acc1ca-862a-44a6-b456-69a0947a7366))}}