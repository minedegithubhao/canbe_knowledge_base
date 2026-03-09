- 简单Api调用
	- ```python
	  import ollama
	  
	  # 写死的提示词
	  prompt = """
	  请为以下功能生成一段Python代码：
	  求两个数的最大公约数
	  """
	  response = ollama.chat(model='qwen2:0.5b',
	                         messages=[{'role': 'user', 'content': prompt}, ])
	  # 5. 调用模型，回答问题
	  result = response['message']['content']
	  # 6. 打印回答
	  print(result)
	  ```
- 互动式Api调用
	- ```python
	  import ollama
	  
	  while True:
	      # 通过互动的方式获取提示词
	      prompt = input("请输入您的问题：")
	      response = ollama.chat(model='qwen2:0.5b',
	                             messages=[{'role': 'user', 'content': prompt, }, ])
	      # 5. 调用模型，回答问题
	      result = response['message']['content']
	      # 6. 打印回答
	      print(result)
	  ```
- 互动式Api分类
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
	  
	      # 调用模型，回答问题
	      response = ollama.chat(model='qwen2:0.5b', messages=[{'role': 'user',
	                                                            'content': prompt}])
	  
	      result = response['message']['content']
	      print(result)
	  
	  ```
-