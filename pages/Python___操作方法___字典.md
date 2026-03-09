- 遍历
	- ```python
	  # 遍历操作
	  for key in person:
	      print(key)
	      print(person[key])
	  ```
- 删除
	- ```python
	  person = {'name': 'Tom', 'age': 20, 'gender': '男'}
	  # 删除指定元素
	  del person['name'] # 输出： {'age': 20, 'gender': '男'}
	  
	  # 清空
	  person = {'name': 'Tom', 'age': 20, 'gender': '男'}
	  person.clear() # 输出： {}
	  ```
- 修改
	- ```python
	  person = {'name': 'Tom', 'age': 20, 'gender': '男'}
	  person['name'] = '张三' # 输出： {'name': '张三', 'age': 20, 'gender': '男'}
	  ```
- 查
	- ```python
	  person = {'name': 'Tom', 'age': 20, 'gender': '男'}
	  print(person['name']) # 输出： Tom
	  ```
- 其它方法
	- ```python
	  person = {'name': 'Tom', 'age': 20, 'gender': '男'}
	  print(person.keys()) # 输出： dict_keys(['name', 'age', 'gender'])
	  
	  person = {'name': 'Tom', 'age': 20, 'gender': '男'}
	  print(person.keys()) # 输出：dict_keys(['name', 'age', 'gender'])
	  print(type(person.keys())) # 输出：<class 'dict_keys'>
	  
	  person = {'name': 'Tom', 'age': 20, 'gender': '男'}
	  print(person.values()) # 输出： dict_values(['Tom', 20, '男'])
	  print(type(person.values())) # 输出： <class 'dict_values'>
	  
	  person = {'name': 'Tom', 'age': 20, 'gender': '男'}
	  print(person.items()) # 输出： dict_items([('name', 'Tom'), ('age', 20), ('gender', '男')])
	  print(type(person.items())) # 输出： <class 'dict_items'>
	  ```