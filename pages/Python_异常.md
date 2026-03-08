- 异常捕获
	- ```python
	  try:
	      可能发生错误的代码
	  except:
	      如果出现异常执行的代码
	  ```
	- ```python
	  try:
	      f = open('python.txt', 'r')
	      content = f.readline()
	      print(content)
	  except:
	      f = open('python.txt', 'w', encoding='utf-8')
	      f.write('发生异常，执行except语句中的代码')
	  f.close()
	  ```
- 异常信息打印
	- ```python
	  try:
	      print(name)
	  except Exception as e:
	      print(e)
	  ```
- 异常捕获中else语句
	- ```python
	  try:
	      print(1)
	  except Exception as e:
	      print(e)
	  else:
	      print('哈哈，真开森，没有遇到任何异常')
	  ```
- finally语句
	- ```python
	  try:
	      f = open('python.txt', 'r')
	  except:
	      f = open('python.txt', 'w')
	  else:
	      content = f.readlines()
	      print(content)
	  finally:
	      f.close()
	  ```