- 定义
  id:: 69ace2ec-7be0-4add-929e-33c91a0f3c0d
	- ```python
	  class Person(object):
	      # 属性
	      # 方法（函数）
	      def eat(self):
	          print('吃零食')
	      def drink(self):
	          print('喝可乐')
	  ```
- 实例化 & 方法调用
	- ```python
	  # 1、定义一个类
	  class Person(object):
	      # 定义相关方法
	      def eat(self):
	          print('吃零食')
	      def drink(self):
	          print('喝可乐')
	  
	  # 2、实例化对象
	  p1 = Person()
	  # 3、调用类中的方法
	  p1.eat()
	  p1.drink()
	  
	  p2 = Person()
	  ```
- self关键字：谁实例化了对象，`self`就指向谁。
	- ```python
	  # 1、定义一个类
	  class Person():
	      # 定义一个方法
	      def speak(self):
	          print(self)
	          print('Nice to meet you!')
	  
	  # 2、类的实例化（生成对象）
	  p1 = Person()
	  print(p1)
	  p1.speak()
	  
	  p2 = Person()
	  print(p2)
	  p2.speak()
	  ```
- 类的外面添加属性和获取属性
	- ```python
	  # 1、定义一个Person类
	  class Person(object):
	      print(f'我的名字：{self.name}，我的年龄：{self.age}，我的住址：{self.address}')
	  
	  # 2、实例化Person类，生成p1对象
	  p1 = Person()
	  
	  # 3、为p1对象添加属性
	  p1.name = '老王'
	  p1.age = 18
	  p1.address = '北京市顺义区京顺路99号'
	  
	  # 4、获取p1对象的属性
	  print(f'我的姓名：{p1.name}')
	  print(f'我的年龄：{p1.age}')
	  print(f'我的住址：{p1.address}')
	  ```
- 魔术方法：
	- 魔术变量：`__name__`，`__file__`这，拥有特殊功能的变量
	- 魔法方法：`__xxx__()`，具有特殊功能的函数
		- `__init__()`当实例化对象时，其会自动被触发（构造方法）
			- ```python
			  # 1、定义一个类
			  class Person():
			      # 初始化实例对象属性
			      def __init__(self, name, age):
			          # 赋予name属性、age属性给实例化对象本身
			          # self.实例化对象属性 = 参数
			          self.name = name
			          self.age = age
			  
			  # 2、实例化对象并传入初始化属性值
			  p1 = Person('孙悟空', 500)
			  # 3、调用p1对象自身属性name与age
			  print(p1.name)
			  print(p1.age)
			  ```
		- `__str__()`print时格式化输出， 类比Java中的t`oString()`方法
			- ```python
			  # 1、定义一个类
			  class Car():
			      # 首先定义一个__init__方法，用于初始化实例对象属性
			      def __init__(self, brand, model, color):
			          self.brand = brand
			          self.model = model
			          self.color = color
			  
			      # 定义一个__str__内置魔术方法，用于输出小汽车的相关信息
			      def __str__(self):
			          return f'汽车品牌：{self.brand}，汽车型号：{self.model}，汽车颜色：{self.color}'
			  
			  # 2、实例化对象c1
			  c1 = Car('奔驰', 'S600', '黑色')
			  print(c1)
			  ```
		- `__del__()`当手工删除对象或对象被销毁时，其会自动被触发（被调用）
			- ```python
			  class Person():
			      # 构造函数__init__
			      def __init__(self, name, age):
			          self.name = name
			          self.age = age
			  
			      # 析构方法__del__
			      def __del__(self):
			          print(f'{self}对象已经被删除')
			  
			  # 实例化对象
			  p1 = Person('白骨精', 100)
			  # 删除对象p1
			  del p1
			  ```
- 公/私有属性和公/私有方法
  id:: 69ace5ed-3091-4b28-9566-903a1be3e3da
	- 属性名和方法名 前面 加上两个下划线 `__`，**使用方法和Java一样**
	- ```python
	  class Girl():
	      def __init__(self, name):
	          self.name = name #  共有属性
	          self.__age = 18 # 私有属性
	  
	      # 公共方法：提供给外部的访问接口
	      def get_age(self):
	          # 内部访问：允许直接访问
	          # 外部访问：根据需求要添加限制条件
	          return self.__age
	  
	      # 公共方法：提供给外部的设置接口
	      def set_age(self, age):
	          self.__age = age
	  
	  girl = Girl('小美')
	  print(girl.__age)  # 报错，不允许外部直接访问私有属性，提示Girl对象没有__age属性
	  girl.set_age(19)
	  print(girl.get_age())
	  ```
- **继承**的基本语法：Python**支持多继承**，默认所有类都继承自`Object`
	- ```python
	  # 单继承
	  class B(object):
	      pass
	  
	  class A(B):
	      pass
	  
	  a = A()
	  a.B中的所有公共属性
	  a.B中的所有公共方法
	  
	  # 多继承
	  class B(object):
	      pass
	  
	  class C(object):
	      pass
	  
	  class A(B, C):
	      pass
	  ```
- 方法**重写** 和Java一样
	- ```python
	  class Animal(object):
	      def eat(self):
	          print('吃')
	      # 公共方法
	      def call(self):
	          print('叫')
	  
	  
	  class Dog(Animal):
	      # 重写父类的call方法
	      def call(self):
	          print('汪汪叫')
	  
	  
	  class Cat(Animal):
	      # 重写父类的call方法
	      def call(self):
	          print('喵喵叫)
	  ```
- super()调用父类方法
	- ```python
	  class Car(object):
	      def __init__(self, brand, model, color):
	          self.brand = brand
	          self.model = model
	          self.color = color
	  
	      def run(self):
	          print('i can run')
	  
	  
	  class ElectricCar(Car):
	      def __init__(self, brand, model, color, battery):
	          super().__init__(brand, model, color) # 调用父类方法
	          self.battery = battery
	  
	      def run(self):
	          print(f'i can run with electric，i have a {self.battery} + "kwh battery"')
	  
	  ```
- MRO属性或MRO方法
	- ```python
	  class Car(object):
	      def __init__(self, brand, model, color):
	          self.brand = brand
	          self.model = model
	          self.color = color
	  
	      def run(self):
	          print('i can run')
	  
	          
	  class ElectricCar(Car):
	      def __init__(self, brand, model, color, battery):
	          super().__init__(brand, model, color)
	          self.battery = battery
	  
	      def run(self):
	          print(f'i can run with electric，i has a {self.battery} + "kwh battery"')
	  
	  print(ElectricCar.__mro__) # 输出：(<class '__main__.ElectricCar'>, <class '__main__.Car'>, <class 'object'>)
	  print(ElectricCar.mro()) # 	 输出：[<class '__main__.ElectricCar'>, <class '__main__.Car'>, <class 'object'>]
	  ```
- 多态
	- ```python
	  '''
	  首先定义一个父类，其可能拥有多个子类对象。当我们调用一个公共方法（接口）时，传递的对象不同，则返回的结果不同。
	  '''
	  class Fruit(object):
	      def makejuice(self):
	          print('i can make juice')
	          
	  class Banana(Fruit):
	      # 重写父类方法
	      def makejuice(self):
	          print('i can make banana juice')
	  
	  class Orange(Fruit):
	      # 重写父类方法
	      def makejuice(self):
	          print('i can make orange juice')
	  
	  # 定义一个公共接口（专门用于实现榨汁操作）
	  def service(obj):
	      # obj要求是一个实例化对象，可以传入苹果对象/香蕉对象
	      obj.makejuice()
	  
	  # 调用公共方法
	  service(Orange())
	  ```
- 类属性
	- ```python
	  class Person(object):
	      # 定义类属性
	      count = 0
	      def __init__(self, name, age):
	          self.name = name
	          self.age = age
	  
	  
	  p1 = Person('Tom', 23)
	  p2 = Person('Harry', 26)
	  ```
- 类方法
  id:: 69aceb82-9488-454b-8c77-efec7e45ea59
	- ```python
	  class Tool(object):
	      # 定义一个类属性count
	      count = 0
	      # 定义一个__init__初始化方法
	      def __init__(self, name):
	          self.name = name
	          Tool.count += 1
	      # 封装一个类方法：专门实现对Tool.count类属性进行操作
	      @classmethod
	      def get_count(cls):
	          print(f'我们使用Tool类共实例化了{cls.count}个工具')
	          
	          
	  Tool.get_count()
	  ```
- 静态方法
  id:: 69acebbc-35f2-4776-9790-5cfc0b259f24
	- 操作类属性或类中的其他方法。
	- ```python
	  # 开发一款游戏
	  class Game(object):
	      # 开始游戏，打印游戏功能菜单
	      @staticmethod
	      def menu():
	          print('1、开始游戏')
	          print('2、游戏暂停')
	          print('3、退出游戏')
	  
	  
	  # 开始游戏、打印菜单
	  Game.menu()
	  ```
	- 重点对比 ((69ace5ed-3091-4b28-9566-903a1be3e3da))和 ((69aceb82-9488-454b-8c77-efec7e45ea59)) 以及 ((69acebbc-35f2-4776-9790-5cfc0b259f24))的区别 #card #Python/基础知识