alias:: 简易聊天机器人
tags:: 项目实战

- 前端页面`streamlit_app.py`，使用[[Streamlit]]技术
- ```python
  # 1. 导入相关包，如streamlit包
  import streamlit as st
  from langchain_classic.memory import ConversationBufferMemory
  from get_response import get_response
  
  # 3. 主界面主标题
  st.title("黑马智聊机器人")
  
  # 5. 会话保持：用于存储会话记录
  if "memory" not in st.session_state:
      st.session_state['memory'] = ConversationBufferMemory()
      # 初始化消息列表，包含系统欢迎语
      st.session_state['messages'] = [{'role': 'assistant', 'content': '你好，我是黑马智聊机器人，有什么可以帮助你的么？'}]
  
  # 6. 编写一个循环结构，用于打印会话记录
  for message in st.session_state['messages']:
      with st.chat_message(message['role']):
          st.markdown(message['content'])
  
  # 4. 创建一个聊天窗口
  prompt = st.chat_input("请输入您要咨询的问题：")
  # 7. 如果文本框有数据，继续向下执行
  if prompt:
      # 添加用户消息到会话历史
      st.session_state['messages'].append({'role': 'user', 'content': prompt})
      st.chat_message("user").markdown(prompt)
      
      # 10. 向 get_response 函数发送完整的会话历史 (包含上下文)
      with st.spinner("AI 小助手正在思考中..."):
          content = get_response(st.session_state['messages'])
      
      # 添加 AI 回复到会话历史
      st.session_state['messages'].append({'role': 'assistant', 'content': content})
      st.chat_message("assistant").markdown(content)
  ```
- 后端服务
	- 参考 [[Python/Api调用]]
	- ```python
	  # 1. 导入相关包
	  import ollama
	  
	  # 2. 定义一个函数，用于发起请求，返回结果
	  # def get_response(prompt):
	  #     messages = []
	  #     messages.append({'role': 'user', 'content': prompt, })
	  #     response = ollama.chat(model='qwen2.5:7b', messages=messages)
	  #     return response['message']['content']
	  
	  # 3. 定义一个函数，用于发起请求，返回结果
	  def get_response(prompt):
	      # response = ollama.chat(model='qwen2:0.5b', messages=prompt[-50:])
	      response = ollama.chat(model='deepseek-r1:1.5b', messages=prompt[-50:])
	      return response['message']['content']
	  
	  
	  # 7. 测试，测试结束后，终止
	  if __name__ == '__main__':
	      s=input("请输入你要表达的内容")
	      while True:
	  
	          prompt = s
	          result = get_response(prompt)
	          print(result)
	  ```