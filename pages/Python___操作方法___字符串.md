- 字符串查找
	- ```python
	  # 定义一个字符串
	  str1 = 'hello world hello linux hello python'
	  
	  # 查找字符串，在返回下标，不在返回-1
	  print(str1.find('linux1'))
	  # 查找字符串，在返回下标，不在报错
	  print(str1.index('linux1'))
	  ```
- 字符串修改方法
	- ```python
	  str1 = 'hello world hello linux hello python'
	  # 返回替换后的字符串
	  # 输出：hello good hello linux hello python
	  print(str1.replace('world', 'good'))
	  
	  str2 = 'Mon, Tur, Wed'
	  # 返回切割后的列表序列
	  # 输出： ['Mon', ' Tur', ' Wed']
	  print(str2.split(','))
	  # 输出： <class 'list'>
	  print(type(str2.split(',')))
	  
	  str3 = 'apple-banana-orange'
	  # 所有单词首字母大写
	  # 输出：Apple-Banana-Orange
	  print(str3.title())
	  ```