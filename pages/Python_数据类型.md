- 数值类型
	- int, float, bool, str, list
	- 整数类型：python中不再区分`int`和`long`
		- ```python
		  age = 18
		  
		  print(type(age))  # 输出: <class 'int'>
		  print(isinstance(age, float))   # 输出: True
		  ```
	- 小数类型：只有`float`且是双精度，第三方库`decimal.Decimal`解决float 精度丢失
		- ```python
		  p_price = 3.5
		  print(type(p_price))  # 输出: <class 'float'>
		  
		  
		  # Decimal示例
		  from decimal import Decimal
		  # float 精度问题示例
		  print(0.1 + 0.2)  # 输出 0.30000000000000004（不精确）
		  # Decimal 解决精度问题
		  print(Decimal('0.1') + Decimal('0.2'))  # 输出 0.3（精确）
		  ```
	- 布尔类型：`True`和`False`，布尔型本质是 `int` 的子类，`True` 等价于 `1`，`False` 等价于 `0`，可以参与数值运算
		- ```python
		  print(True + 5)   # 输出 6
		  print(False + 5)   # 输出 5
		  
		  print(type(True)) # 输出: <class 'bool'>
		  print(isinstance(True, bool)) # 输出: True
		  ```
	- 字符串类型：
		- ```python
		  p_name = '大白菜'
		  
		  print(type(p_name)) # 输出: <class 'str'>
		  print(isinstance(p_name, str)) # 输出: True
		  ```
	- 列表类型：
		- ```python
		  list1 = ['张三', '李四', 3, 4.5, True]
		  print(list1) # 输出：['张三', '李四', 3, 4.5, True]
		  print(type(list1))  # 输出: <class 'list'>
		  print(isinstance(list1, list)) # 输出: True
		  ```
	- 元组类型：元组引用地址不可修改
		- ```python
		  userTuple = ('张三','李四','王五',10,20,30,True,False)
		  print(userTuple) # 输出：('张三', '李四', '王五', 10, 20, 30, True, False)
		  print(type(userTuple)) # 输出：<class 'tuple'>
		  ```
	- 无序集合：无序、去重
		- ```python
		  # 定义集合
		  # 格式一:  变量名称 = {元素1,元素2,元素3......}
		  # 格式二:  变量名称 = set()   空集合
		  # 💡set2 = {}  # 此种定义方法 并不是定义空集合, 而是空的字典
		  
		  
		  set1 = {'张三','李四','王五','张三','王五','赵六'}
		  # 去重 和 无序  发现每次都是不一样的 所以是无序的
		  print(set1)  # 输出： {'王五', '赵六', '张三', '李四'}
		  print(type(set1)) # 输出： <class 'set'>
		  
		  # 定义 空集合
		  set2 = set()
		  ```
	- 字典
		- ```python
		  person = {'name': 'Tom', 'age': 20, 'gender': '男'}
		  
		  # 空字典
		  dict2 = {}
		  dict3 = dict()
		  
		  person = {'name': 'Tom', 'age': 20, 'gender': '男'}
		  print(person) # 输出： {'name': 'Tom', 'age': 20, 'gender': '男'}
		  print(type(person)) # 输出： <class 'dict'>
		  ```