- 常用函数
	- 一次打印输出多个变量
		- ```python
		  # 一次打印输出多个变量
		  print(age, score, name)
		  ```
	- 判断变量是否属于某个类型
		- ```python
		  # 判断变量是否属于某个类型  如果是 返回 True  否则 返回False
		  print(isinstance(name, bool)) 
		  ```
	- 格式化输出
		- ```python
		  print('字符串%格式' % (变量名称))
		  print('字符串%格式 %格式 %格式' % (变量名称1, 变量名称2, 变量名称3))
		  
		  # 百分号格式化输出
		  print("我的名字为: %s, 今年我%d岁了, 这次考试考了%.2f分" % (name, age, score))
		  
		  # format方法格式化输出
		  print("我的名字为: {}, 今年我{}岁了, 这次考试考了{:.2f}分".format(name, age, score))
		  # format方法格式化输出，\t ：制表符（一个tab键4个空格），\n ：换行符输出
		  print(f"我的名字为: {name},\t今年我{age}岁了,\n这次考试考了{score:.2f}分")
		  # format方法格式化输出，简写形式（推荐）
		  print(f"我的名字为: {name}, 今年我{age}岁了, 这次考试考了{score:.2f}分")
		  
		  # 输出转义字符
		  print("abc\\ndefg")
		  ```
		- | **格式符号** | **转换** |
		  | ---- | ---- | ---- |
		  | %s | 字符串 |
		  | %d | 有符号的十进制整数 |
		  | %f | 浮点数 |
		  | %c | 字符 |
		  | %u | 无符号十进制整数 |
		  | %o | 八进制整数 |
		  | %x | 十六进制整数（小写ox） |
		  | %X | 十六进制整数（大写OX） |
		  | %e | 科学计数法（小写'e'） |
		  | %E | 科学计数法（大写'E'） |
		  | %g | %f和%e的简写 |
		  | %G | %f和%E的简写 |
	- input() 输入方法
		- ```python
		  userName = input("请输入您的用户名:")
		  ```