alias:: Python Api调用旧笔记
type:: concept
domain:: [[MOC/Python]]
status:: archived
updated:: 2026-05-03

- **迁移说明**
	- 本页面内容已迁移到 [[Concept/Python API调用]] 和 [[Question/Python API 调用如何做稳定性处理]]。
	- 后续请维护新页面，本页面只保留为旧链接和来源入口。

- **原始内容**
	- 简单 API 调用
		- ```python
		  import ollama
		  
		  # 写死的提示词
		  prompt = """
		  请为以下功能生成一段Python代码：
		  求两个数的最大公约数
		  """
		  response = ollama.chat(
		      model='qwen2:0.5b',
		      messages=[{'role': 'user', 'content': prompt}],
		  )
		  result = response['message']['content']
		  print(result)
		  ```
	- 互动式 API 调用
		- ```python
		  import ollama
		  
		  while True:
		      prompt = input("请输入您的问题：")
		      response = ollama.chat(
		          model='qwen2:0.5b',
		          messages=[{'role': 'user', 'content': prompt}],
		      )
		      result = response['message']['content']
		      print(result)
		  ```
	- 互动式 API 分类
		- ```python
		  import ollama
		  
		  while True:
		      question = input("请输入您的问题：")
		  
		      prompt = f"""
		      你需要对用户的反馈进行原因分类
		      分类包括: 价格过高, 售后支持不足，产品使用体验不佳，其他
		      回答格式为: 分类结果：xx
		      用户的问题是: {question}
		      """
		  
		      response = ollama.chat(
		          model='qwen2:0.5b',
		          messages=[{'role': 'user', 'content': prompt}],
		      )
		      result = response['message']['content']
		      print(result)
		  ```
