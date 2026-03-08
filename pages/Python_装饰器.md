- 原理
	- ```python
	  # 要求：把登录功能封装起来（比如封装成一个函数，添加这个登录不能影响现有功能函数）
	  '''
	  装饰器：本质是一个闭包，有嵌套、有引用、有返回（返回的是函数的内存地址）
	  参数fn在check中也是一个局部变量
	  参数fn：就是要装饰的函数的函数名，如comment，如download
	  '''
	  def check(fn):
	      def inner():
	          # 开发登录功能
	          print('登录功能')
	          # 调用原函数
	          fn()
	      return inner
	  
	  
	  # 评论功能（前提：登录）
	  def comment():
	      print('评论功能')
	  
	  comment = check(comment)
	  comment()
	  
	  # 下载功能（前提：登录）
	  def download():
	      print('下载功能')
	  
	  download = check(download)
	  download()
	  ```
- 装饰器定义
	- ```python
	  '''
	  装饰器：本质就是一个闭包 ① 有嵌套 ② 有引用 ③ 有返回
	  '''
	  def check(fn):
	  
	      def inner():
	          # 开发登录验证功能
	          print('验证登录')
	          # 执行原有函数
	          fn()
	      return inner
	  
	  @check
	  def comment():
	      print('发表评论')
	  
	  comment()
	  ```
- 装饰器的作用：获取程序的执行时间
	- ```python
	  '''
	  定义获取程序的执行时间装饰器 => 闭包（① 有嵌套 ② 有引用 ③ 有返回）
	  '''
	  import time
	  
	  def get_time(fn):
	      def inner():
	          # ① 添加装饰器修饰功能（获取程序的执行时间）
	          begin = time.time()
	          # ② 调用fn函数，执行原函数代码
	          fn()
	          end = time.time()
	          print(f'这个函数的执行时间：{end - begin}')
	      return inner
	  
	  
	  @get_time
	  def demo():
	      for i in range(1000000):
	          print(i)
	  
	  demo()
	  ```
- 带有参数装饰器
	- ```python
	  '''
	  带有参数的装饰器：① 有嵌套 ② 有引用 ③ 有返回
	  '''
	  def logging(fn):
	      def inner(*args, **kwargs):
	          # 添加装饰器代码（输出日志信息）
	          print('-- 日志信息：正在努力计算机 --')
	          # 执行要修饰的函数
	          fn(*args, **kwargs)  # sum_num(a, b)
	      return inner
	  
	  @logging
	  def sum_num(*args, **kwargs):
	      result = 0
	      # *args代表不定长元组参数，args = (10, 20)
	      for i in args:
	          result += i
	      # **kwargs代表不定长字典参数， kwargs = {a:30, b:40}
	      for i in kwargs.values():
	          result += i
	      print(result)
	  
	  # sum_num带4个参数，而且类型不同，10和20以元组形式传递，a=30，b=40以字典形式传递
	  sum_num(10, 20, a=30, b=40)
	  ```
	- 参考 ((69acc1ca-0073-45d8-9c82-6a027c9e554a))和 ((69acc1ca-6c1c-459a-8bc3-891c5586b438))
- 带有返回值装饰器
	- ```python
	  '''
	  带有返回值的装饰器：① 有嵌套 ② 有引用 ③ 有返回
	  如果一个函数执行完毕后，没有return返回值，则默认返回None
	  '''
	  def logging(fn):
	      def inner(*args, **kwargs):
	          print('-- 日志信息：正在努力计算 --')
	          return fn(*args, **kwargs)  # fn() = sub_num(20, 10) = result
	      return inner
	  
	  @logging
	  def sub_num(a, b):
	      result = a - b
	      return result
	  
	  print(sub_num(20, 10))
	  ```
- 装饰器高级：使用装饰器传递参数
	- ```python
	  '''
	  通用装饰器：① 有嵌套 ② 有引用 ③ 有返回 ④ 有不定长参数 ⑤ 有return返回值
	  真正问题：通过装饰器传递参数，我们应该如何接收这个参数呢？
	  答：在logging方法的外侧在添加一个函数，专门用于接收传递过来的参数
	  '''
	  
	  def logging(flag):
	      # flag = + 或 flag = -
	      def decorator(fn):
	          def inner(*args, **kwargs):
	              if flag == 'info':
	                  print('-- info日志信息：')
	              elif flag == 'debugger':
	                  print('-- debugger日志信息：')
	              return fn(*args, **kwargs)
	          return inner
	      return decorator
	  
	  @logging('info')
	  def sum_num(a, b):
	      result = a + b
	      return result
	  
	  @logging('debugger')
	  def sub_num(a, b):
	      result = a - b
	      return result
	  
	  
	  print(sum_num(10, 20))
	  print(sub_num(100, 80))
	  ```