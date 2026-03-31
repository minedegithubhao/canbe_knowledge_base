- alias::
  tags::
  type:: 概念
  status:: 草稿
  id:: 69ca68c5-6089-49c1-80e7-a0ecc0e1c51f
- 功能介绍
	- **LangChain AI**
	  collapsed:: true
		- |项目名称|技术栈|核心用途|GitHub 地址|
		  |--|--|--|--|
		  |LangChain|Python/TS|构建 LLM 应用基础组件（链式编排、RAG、嵌入、文档处理等）|https://github.com/langchain-ai/langchain|
		  |langchainjs|JS/TS|前端/Node 环境中构造 LLM 应用|https://github.com/langchain-ai/langchainjs|
		  |langgraph|Python|用图编排复杂 Agent 流程|[https://github.com/langchain-ai/langgraph](https://github.com/langchain-ai/langgraph)|
		  |local-deep-researcher|Python|自动化、多轮本地 Web 研究工具|https://github.com/langchain-ai/local-deep-researcher|
	- LangChain 核心功能
	  collapsed:: true
		- **LLM 和提示（Prompt）**：LangChain 对所有 LLM 大模型进行了 API 抽象，统一了大模型访问 API，同时提供了 Prompt 提示模板管理机制。
		- **输出解析器 (Output Parsers)**：Langchain 接受大模型 (llm) 返回的文本内容之后，可以使用专门的输出解析器对文本内容进行格式化，例如解析 json、或者将 llm 输出的内容转成 python 对象。
		- **链 (Chain)**：Langchain 对一些常见的场景封装了一些现成的模块，例如：基于上下文信息的问答系统，自然语言生成 SQL 查询等等，因为实现这些任务的过程就像工作流一样，一步一步的执行，所以叫链 (chain)。
		- **LCEL**：LangChain Expression Language (LCEL)， langchain 新版本的核心特性，用于解决工作流编排问题，通过 LCEL 表达式，我们可以灵活的自定义 AI 任务处理流程，也就是灵活自定义*链 (Chain)*。
		- **数据增强生成 (RAG)**：因为大模型 (LLM) 不了解新的信息，无法回答新的问题，所以我们可以将新的信息导入到 LLM，用于增强 LLM 生成内容的质量，这种模式叫做 RAG 模式(Retrieval Augmented Generation)。
		- **Agents**：是一种基于大模型（LLM）的应用设计模式，利用 LLM 的自然语言理解和推理能力（LLM 作为大脑)），根据用户的需求自动调用外部系统、设备共同去完成任务，例如：用户输入 “明天请假一天”， 大模型（LLM）自动调用请假系统，发起一个请假申请。
		- **模型记忆（memory）**：让大模型 (llm) 记住之前的对话内容，这种能力称为模型记忆（memory）。
	- 安装命令
		- ```bash
		  #langchain框架安装
		  pip install langchain
		  #langchain版本查看
		  pip show langchain
		  ```
		- 其它包，参考 [[conda环境配置]]
- LLMs
	- OpenAI调用大模型：没有内置的对话上下文管理
	  collapsed:: true
		- ```python
		  from openai import OpenAI
		  
		  # 初始化DeepSeek的API客户端
		  client = OpenAI(api_key=conf.API_KEY, base_url="https://api.deepseek.com")
		  
		  # 调用DeepSeek的API，生成回答
		  response = client.chat.completions.create(
		      model="deepseek-chat",
		      messages=[
		          {"role": "system", "content": "你是传智教育的助手传智小智，请根据用户的问题给出回答"},
		          {"role": "user", "content": "你好，请你介绍一下你自己。"},],)
		  
		  # 打印模型最终的响应结果
		  print(response.choices[0].message.content)
		  ```
	- 使用`langchain` 调用大模型：内置上下文管理
	  collapsed:: true
		- ```python
		  from langchain_openai import ChatOpenAI
		  from langchain.schema import HumanMessage, SystemMessage
		  
		  # 初始化 ChatOpenAI，配置 DeepSeek API
		  llm = ChatOpenAI(
		      model=conf.MODEL,
		      api_key=conf.API_KEY,
		      base_url=conf.API_URL,
		      temperature=0.7,
		      max_tokens=150)
		  
		  messages = [
		      SystemMessage(content="你是传智教育的助手传智小智2号，请根据用户的问题给出回答"),
		      HumanMessage(content="你好，请你介绍一下你自己。")
		  ]
		  
		  result = llm.invoke(messages)
		  print(result.content)
		  ```
	- invoke方法介绍
	  collapsed:: true
		- 字符串
		  collapsed:: true
			- ```python
			  messages = '中国的首都是哪里？'
			  result = llm.invoke(messages)
			  ```
		- 消息对象列表
		  collapsed:: true
			- ```python
			  messages = [
			      SystemMessage(content="你是传智教育的助手传智小智2号，请根据用户的问题给出回答"),
			      HumanMessage(content="你好，请你介绍一下你自己。")
			  ]
			  result = llm.invoke(messages)
			  ```
		- 字典列表
		  collapsed:: true
			- ```python
			  messages = [
			      {
			          "role": "system",
			          "content": "你是一位地理专家"
			      },
			      {
			          "role": "user",
			          "content": "中国的首都是哪里？"
			      }
			  ]
			  
			  result = llm.invoke(messages)
			  ```
- Prompt
	- ChatPromptTemplate如何使用
	  collapsed:: true
		- 作用：**提示的逻辑（固定结构）与提示的数据（动态变量）彻底分离，从而实现代码的简洁、复用、安全和可维护性**
		- ```python
		  from langchain_core.prompts import ChatPromptTemplate
		  
		  # 1. 创建模板（{topic} 是变量）
		  prompt = ChatPromptTemplate.from_messages([
		      ("system", "你是一个专业的AI助手，请用简洁的语言回答问题"),
		      ("user", "请介绍一下{topic}")
		  ])
		  
		  # 2. 使用 .invoke() 传入变量，生成最终消息
		  # 关键：invoke 接收一个字典，key=模板里的变量名
		  formatted_messages = prompt.invoke({"topic": "稀疏向量"})
		  
		  # 3. 输出结果
		  response = llm.invoke(formatted_messages)
		  
		  # 4. 转成可直接传给大模型的格式（messages）
		  print("\n消息内容：")
		  print(response.content)
		  ```
		- `.invoke()` 接收一个字典，如：`prompt.invoke({"变量名": 值})`
	- LangChain中的角色
	  collapsed:: true
		- |LangChain角色|意思|对应 OpenAI|
		  |--|--|--|
		  |system|系统提示|system|
		  |human|用户问题|user|
		  |user|用户问题|user|
		  |ai|AI 回答|assistant|
		  |assistant|AI 回答|assistant|
- Message的使用
	- `SystemMessagePromptTemplate`,`HumanMessagePromptTemplate`,`AIMessagePromptTemplate`的使用
	  collapsed:: true
		- ```python
		  from langchain_openai import ChatOpenAI
		  
		  from config import config
		  
		  conf = config()
		  
		  llm = ChatOpenAI(
		      model=conf.MODEL,
		      api_key=conf.API_KEY,
		      base_url=conf.API_URL,
		      temperature=0.7,
		      max_tokens=150
		  )
		  
		  from langchain_core.prompts import (
		      SystemMessagePromptTemplate,
		      HumanMessagePromptTemplate,
		      AIMessagePromptTemplate,
		      ChatPromptTemplate
		  )
		  
		  # 1. 分别定义每一类消息模板
		  system_prompt = SystemMessagePromptTemplate.from_template(
		      "你是一个温柔的AI助手，回答要简短友好"
		  )
		  
		  human_prompt = HumanMessagePromptTemplate.from_template(
		      "帮我解释一下{word}"
		  )
		  
		  ai_prompt = AIMessagePromptTemplate.from_template(
		      "好的，{word}的意思是："
		  )
		  
		  # 2. 组合成完整对话模板
		  chat_prompt = ChatPromptTemplate.from_messages([
		      system_prompt,
		      human_prompt,
		      ai_prompt
		  ])
		  
		  # 3. 使用 invoke 填充变量
		  formatted_messages = chat_prompt.invoke({
		      "word": "稀疏向量"
		  })
		  
		  # 4. 查看最终生成的消息
		  for msg in formatted_messages.to_messages():
		      print(f"[{msg.type}]\n{msg.content}\n")
		  
		  
		  response = llm.invoke(formatted_messages)
		  print("\n消息内容：")
		  print(response.content)
		  ```
- Chain
	- 串行链
	  collapsed:: true
		- ```python
		  from langchain_core.prompts import ChatPromptTemplate
		  from langchain_core.output_parsers import StrOutputParser
		  
		  print("--- 1. 串行链 (Sequential Chain) 示例 ---")
		  
		  # 定义流水线的三个“工位”
		  prompt = ChatPromptTemplate.from_template("写一句关于“{topic}”的七言绝句。")
		  # llm 在通用环境中已定义
		  parser = StrOutputParser()
		  # 使用 LCEL `|` 管道符，将三个工位连接成一条串行流水线
		  serial_chain = prompt | llm | parser
		  
		  # 启动流水线，投入原材料
		  input_data = {"topic": "月色"}
		  result = serial_chain.invoke(input_data)
		  
		  print(f"【输入】: {input_data}")
		  print(f"【最终输出】: {result}")
		  ```
	- 并行链
	  collapsed:: true
		- ```python
		  from langchain_core.prompts import ChatPromptTemplate
		  from langchain_core.output_parsers import StrOutputParser
		  import json
		  from langchain_core.runnables import RunnableParallel
		  print("\n--- 2. 并行链 (Parallel Chain) 示例 ---")
		  
		  # 定义两条独立的子流水线
		  poem_chain = ChatPromptTemplate.from_template("写一首关于“{topic}”的诗。") | llm | StrOutputParser()
		  joke_chain = ChatPromptTemplate.from_template("讲一个关于“{topic}”的俏皮话。") | llm | StrOutputParser()
		  
		  # 使用 RunnableParallel 将字典结构转换为一个可执行的并行链
		  parallel_chain = RunnableParallel({
		      "poem": poem_chain,
		      "joke": joke_chain
		  })
		  
		  # 启动并行流水线
		  input_data = {"topic": "程序员"}
		  # Now .invoke() works because parallel_chain is a Runnable object, not a dict
		  result = parallel_chain.invoke(input_data)
		  
		  print(f"【输入】: {input_data}")
		  print("【最终输出】:")
		  # 结果是一个字典，包含了所有子流水线的输出
		  print(json.dumps(result, indent=2, ensure_ascii=False))
		  ```
		- 输出
		- ```python
		  {
		    "poem": "## 《编码者》\n\n白炽灯管蚕食着子夜，\n咖啡在瓷杯里第三次续沸。\n你端坐于光的断层，\n像守林人凝视发光的年轮。\n\n指尖有群鸟振翅，\n黑键起伏，驯养温顺的闪电。\n当括号咬合，世界便收拢成\n一座精密的玻璃宫殿。\n\n但总在语法间隙，\n你听见字节在暗处发芽——\n它们长出蕨类植物的卷须，\n悄悄爬上防火墙的篱笆。\n\n于是你俯身，将星辰的碎屑\n撒进循环结构的沟渠。\n直到晨曦把注释染成淡青色，\n像初春的雾气漫过窗棂。\n\n而所有未完成的梦境",
		    "joke": "程序员去餐厅点餐：“给我来份炒饭，但不要放盐。”\n厨师：“不放盐怎么吃？”\n程序员：“没事，我回家后可以自己用‘盐值’（注释）调味。”\n\n（注：中文里“盐值”与代码中的“注释”（comment）谐音，程序员常通过注释调整代码逻辑，此处调侃程序员把生活问题当成编程问题解决。）"
		  }
		  ```
	- 分支与 `RunnablePassthrough`
	  collapsed:: true
		- ```python
		  from langchain_core.prompts import ChatPromptTemplate
		  from langchain_core.output_parsers import StrOutputParser
		  import json
		  from langchain_core.runnables import RunnableParallel, RunnablePassthrough
		  
		  print("\n--- 3. 分支与 RunnablePassthrough 示例 ---")
		  
		  
		  # 1. 模拟一个检索器
		  def fake_retriever(query: str) -> str:
		      """一个模拟的检索器，根据查询返回固定的上下文。"""
		      return f"关于“{query}”的背景知识是：这是一个非常重要的概念。"
		  
		  
		  # 2. 定义需要同时接收 context 和 question 的 Prompt
		  rag_prompt = ChatPromptTemplate.from_template(
		      "根据以下上下文回答问题。\n上下文: {context}\n问题: {question}"
		  )
		  
		  # 3. 构建包含 Passthrough 的并行链
		  # 这条链接收一个字符串（问题）作为输入
		  # rag_prompt
		  chain = {
		              # "context" 分支：对输入运行检索器
		              "context": fake_retriever,
		              # "question" 分支：直接“透传”原始输入
		              "question": RunnablePassthrough()
		          } | rag_prompt | llm | StrOutputParser()
		  
		  # 4. 执行链
		  user_question = "LCEL"
		  result = chain.invoke(user_question)
		  
		  print(f"【输入】: '{user_question}'")
		  print(f"【最终输出】:\n{result}")
		  ```
		- 输出
		- ```python
		  ```
	- `RunnableLambda`   自定义
	  collapsed:: true
		- ```python
		  from langchain_core.prompts import ChatPromptTemplate
		  from langchain_core.output_parsers import StrOutputParser
		  from langchain_core.runnables import RunnableLambda
		  
		  print("\n--- 4. RunnableLambda 示例 ---")
		  
		  # 1. 定义一个普通的 Python 函数，它不是标准的 LangChain 组件
		  def add_comment(text: str) -> str:
		      """在一个句子的末尾加上一句俏皮的评论。"""
		      return text.strip() + "\n 关于更多课程，欢迎咨询：https://www.itcast.cn/"
		  
		  # 2. 使用 RunnableLambda 将其包装成一个“标准工位”
		  custom_processor = RunnableLambda(add_comment)
		  
		  # 3. 构建一条包含自定义工位的串行链
		  chain = (
		      ChatPromptTemplate.from_template("请解释一下“{concept}”是什么。")
		      | llm
		      | StrOutputParser()
		      | custom_processor # 在这里接入我们的自定义函数
		  )
		  
		  # 4. 执行链
		  result = chain.invoke({"concept": "大模型"})
		  
		  print("【最终输出】:")
		  print(result)
		  ```
		- 输出
		- ```python
		  --- 4. RunnableLambda 示例 ---
		  【最终输出】:
		  “大模型”通常指**大规模预训练语言模型**，是人工智能领域近年来最重要的技术突破之一。简单来说，它是一种基于深度学习的、拥有**海量参数**（通常达数十亿甚至万亿级别）的神经网络模型，通过在大规模文本数据上进行预训练，获得强大的语言理解和生成能力。
		  
		  ---
		  
		  ### **核心特征**
		  1. **参数规模巨大**  
		     参数量可达千亿级别（例如GPT-3有1750亿参数），模型容量极大，能捕捉极其复杂的语言规律。
		  
		  2. **预训练+微调范式**  
		     - **预训练**：在无标注的海量文本（如网页、书籍）上通过自监督学习（如预测下一个词
		   关于更多课程，欢迎咨询：https://www.itcast.cn/
		  ```
- Output Parsers
	- 解析器类型
	  collapsed:: true
		- ![image.png](../assets/image_1774875963008_0.png)
	- `JsonOutputParser`的使用
	  collapsed:: true
		- ```python
		  from langchain_core.prompts import ChatPromptTemplate
		  from langchain_core.output_parsers import JsonOutputParser
		  
		  print("--- 1. JsonOutputParser 示例 ---")
		  
		  # 1. 创建一个 JsonOutputParser 实例
		  json_parser = JsonOutputParser()
		  
		  # 2. 创建一个 Prompt 模板，并注入格式化指令
		  #    .get_format_instructions() 会自动生成告诉 LLM 如何输出 JSON 的指令
		  prompt = ChatPromptTemplate.from_template(
		      """从以下文本中提取用户的姓名和城市。
		  
		  {format_instructions}
		  
		  文本: {text}"""
		  )
		  
		  # 3. 构建 LCEL 链
		  chain = prompt | llm | json_parser
		  
		  # 4. 准备输入数据
		  unstructured_text = "张伟是一位居住在北京的软件工程师，他今年30岁。"
		  
		  # 5. 调用链并传入格式化指令和文本
		  result = chain.invoke({
		      "format_instructions": json_parser.get_format_instructions(),
		      "text": unstructured_text
		  })
		  
		  # 6. 验证输出
		  print(f"【输入文本】: {unstructured_text}")
		  print(f"【输出类型】: {type(result)}")
		  print(f"【解析结果】: {result}")
		  ```
		- 输出
		- ```python
		  {'name': '张伟', 'city': '北京'}
		  ```
	- `PydanticOutputParser`的使用
	  collapsed:: true
		- ```python
		  from langchain_core.output_parsers import PydanticOutputParser
		  from langchain_core.prompts import ChatPromptTemplate
		  from langchain_openai import ChatOpenAI
		  from pydantic import BaseModel, Field
		  
		  from config import config
		  
		  conf = config()
		  
		  llm = ChatOpenAI(
		      model=conf.MODEL,
		      api_key=conf.API_KEY,
		      base_url=conf.API_URL,
		      temperature=0.7,
		      max_tokens=150
		  )
		  # ----------------------------------------------------
		  #     使用 PydanticOutputParser 进行类型安全的解析
		  # ----------------------------------------------------
		  print("--- 2. PydanticOutputParser 示例 ---")
		  
		  # 步骤 1: 使用 Pydantic V2 的 BaseModel 定义你期望的数据结构
		  class UserInfo(BaseModel):
		      name: str = Field(description="用户的姓名")
		      city: str = Field(description="用户居住的城市")
		      age: int = Field(description="用户的年龄")
		  
		  # 步骤 2: 从 Pydantic 模型创建解析器
		  pydantic_parser = PydanticOutputParser(pydantic_object=UserInfo)
		  
		  # 步骤 3: 创建 Prompt 模板，并准备注入格式化指令
		  prompt = ChatPromptTemplate.from_template(
		      """从用户的文本中提取所需信息。
		  
		  {format_instructions}
		  
		  用户文本: {text}
		  """
		  )
		  
		  # 步骤 4: 构建 LCEL 链
		  chain = prompt | llm | pydantic_parser
		  
		  # 步骤 5: 准备输入文本
		  unstructured_text = "张伟是一位居住在北京的软件工程师，他今年30岁。"
		  
		  # 步骤 6: 调用链，并传入文本和由 Pydantic 解析器生成的、更丰富的指令
		  result_object = chain.invoke({
		      "text": unstructured_text,
		      "format_instructions": pydantic_parser.get_format_instructions()
		  })
		  
		  # ----------------------------------------------------
		  #               结果分析与验证
		  # ----------------------------------------------------
		  print(f"\n【输入文本】: {unstructured_text}")
		  print(f"【输出类型】: {type(result_object)}")
		  print(f"【解析出的对象】: {result_object}")
		  
		  print("\n--- 验证对象的属性和类型 ---")
		  # 可以像操作一个普通的 Python 对象一样访问其属性
		  print(f"姓名 (name): {result_object.name}")
		  print(f"城市 (city): {result_object.city}")
		  # 关键验证：age 字段的类型
		  print(f"年龄 (age): {result_object.age}")
		  print(f"年龄的数据类型: {type(result_object.age)}")
		  
		  """
		  __main__.UserInfo ：在当前运行的脚本中定义（而不是从外部库导入）的那个 UserInfo 类。
		  """
		  
		  ```
- Document Loaders
	- 常见文档加载器`Langchain_community.document_loaders`
	  collapsed:: true
		- ![image.png](../assets/image_1774876483484_0.png)
	- `TextLoader`
	  collapsed:: true
		- ```python
		  from langchain_community.document_loaders import TextLoader  # 使用新模块路径
		  from config import config
		  from langchain_openai import ChatOpenAI
		  from datetime import datetime
		  
		  # 初始化配置和模型
		  conf = config()
		  llm = ChatOpenAI(
		      model=conf.MODEL,  # 直接指定模型名称
		      api_key=conf.API_KEY,
		      base_url=conf.API_URL,
		      temperature=0.7,
		      max_tokens=150
		  )
		  
		  # Document Loaders 示例：加载文档并接入大模型总结
		  loader = TextLoader(r"./林青霞.txt", encoding="utf-8")
		  
		  documents = loader.load()
		  doc=documents[0]
		  
		  print("\n--- 1. 加载后的原始元信息 ---")
		  print(doc.metadata)
		  
		  # 1.2 像操作字典一样，为 Document 对象添加自定义元信息
		  print("\n--- 2. 添加自定义元信息 ---")
		  doc.metadata['author'] = 'DT.L'
		  doc.metadata['version'] = '1.1'
		  doc.metadata['processed_at'] = datetime.now().isoformat()
		  doc.metadata['tags'] = ['test', 'loader', 'metadata']
		  
		  print("更新后的元信息:")
		  print(doc.metadata)
		  
		  print("\n--- 3. 访问特定的元信息 ---")
		  print(f"Author: {doc.metadata.get('author', 'Unknown')}")
		  print(f"Tags: {doc.metadata.get('tags')}")
		  
		  print("\n--- 4. 删除元信息 ---")
		  del doc.metadata['version']
		  
		  print("更新后的元信息:")
		  print(doc.metadata)
		  print("\n--- 5. 获取文本信息 ---")
		  print(doc.page_content)
		  # --- 6. 清空文本信息 -不能采用del ---
		  print("\n--- 6. 清空文本信息 ---")
		  doc.page_content = "" # 正确做法：赋值为空字符串，而不是删除属性
		  print("更新后的信息:")
		  print(doc)
		  ```
	- `PyPDFLoader`
	  collapsed:: true
		- ```python
		  from langchain_community.document_loaders import TextLoader,PyPDFLoader  # 使用新模块路径
		  from config import config
		  from langchain_openai import ChatOpenAI
		  
		  # 初始化配置和模型
		  conf = config()
		  llm = ChatOpenAI(
		      model=conf.MODEL,  # 直接指定模型名称
		      api_key=conf.API_KEY,
		      base_url=conf.API_URL,
		      temperature=0.7,
		      max_tokens=150
		  )
		  # Document Loaders 示例：加载文档并接入大模型总结
		  loader = PyPDFLoader(r"D:\LLM_Codes\Chapter3_RAG\rag_base_frame\data\test_resume.pdf")
		  documents = loader.load()
		  content = documents[0].page_content
		  print("原始简历内容：",content)
		  
		  # 使用 LLM 总结
		  result = llm.invoke(f"总结以下内容：{content[:500]}")  # 取前500字符
		  print("Document Loaders 示例结果:", result.content)
		  ```
	- `DirectoryLoader`
	  collapsed:: true
		- ```python
		  from langchain_community.document_loaders import DirectoryLoader, TextLoader
		  
		  # 1. 指定包含多个 .txt 文件的目录路径
		  directory_path = r"D:\LLM_Codes\Chapter3_RAG\rag_base_frame\data"
		  
		  # 2. 创建一个 DirectoryLoader 实例
		  #    - 第一个参数是目录路径
		  #    - glob="**/*.txt" 参数告诉加载器只加载所有以 .txt 结尾的文件
		  #    - loader_cls=TextLoader 指定使用 TextLoader 来处理这些 .txt 文件
		  #    - loader_kwargs={'encoding': 'utf-8'} 将参数传递给 TextLoader，确保使用正确的编码
		  loader = DirectoryLoader(
		      directory_path,
		      glob="**/*.txt",
		      loader_cls=TextLoader,
		      loader_kwargs={'encoding': 'utf-8'}
		  )
		  
		  # 3. 调用 load() 方法，批量加载所有匹配的文档
		  documents = loader.load()
		  
		  print(f"成功批量加载了 {len(documents)} 个 .txt 文件。")
		  
		  # 您可以查看第一个加载的文档
		  if documents:
		      print("第一个文档的内容：")
		      print(documents[0].page_content)
		      print("第一个文档的元数据：")
		      print(documents[0].metadata)
		  ```
		- 支持多种格式
		- ```python
		  from langchain_community.document_loaders import DirectoryLoader, TextLoader, PyPDFLoader, Docx2txtLoader
		  import os
		  
		  # 1. 你的文件目录
		  directory_path = r"D:\LLM_Codes\Chapter3_RAG\rag_base_frame\data"
		  
		  # 2. 支持的文件格式
		  #    你可以自己增删：.txt, .md, .pdf, .docx, .csv 等
		  SUPPORTED_FORMATS = ["**/*.txt", "**/*.md", "**/*.pdf", "**/*.docx"]
		  
		  documents = []
		  
		  # 3. 遍历所有格式，自动加载对应文件
		  for fmt in SUPPORTED_FORMATS:
		      try:
		          # 根据后缀选择加载器
		          if fmt.endswith(".pdf"):
		              loader = DirectoryLoader(
		                  directory_path,
		                  glob=fmt,
		                  loader_cls=PyPDFLoader
		              )
		          elif fmt.endswith(".docx"):
		              loader = DirectoryLoader(
		                  directory_path,
		                  glob=fmt,
		                  loader_cls=Docx2txtLoader
		              )
		          else:
		              # 文本类：txt, md
		              loader = DirectoryLoader(
		                  directory_path,
		                  glob=fmt,
		                  loader_cls=TextLoader,
		                  loader_kwargs={'encoding': 'utf-8'}
		              )
		  
		          # 加载文档
		          docs = loader.load()
		          documents.extend(docs)
		          print(f"加载 {fmt:<10} → {len(docs)} 个文件")
		  
		      except Exception as e:
		          print(f"加载 {fmt} 失败: {e}")
		  
		  # 最终结果
		  print(f"\n✅ 总共成功加载 {len(documents)} 个文件（支持txt/md/pdf/docx）")
		  
		  if documents:
		      print("\n第一个文档内容预览：")
		      print(documents[0].page_content[:200], "...")
		      print("元数据：", documents[0].metadata)
		  ```
- Text Splitter
	- 常见文本分割器
	  collapsed:: true
		- ![image.png](../assets/image_1774914130434_0.png)
	- RecursiveCharacterTextSplitter(递归字符分割器)
	  collapsed:: true
		- **适用场景与数据特点：**
			- **场景**: 通用文本处理，如 PDF、TXT、网页内容、非结构化报告等。
			- **数据特点**: 这类数据通常是半结构化的，包含段落、换行和句子等自然边界，但没有像代码或 Markdown 那样严格的、可被机器解析的语法。该分割器的层级策略能很好地适应这种灵活性。
		- **优势：**
			- **通用性强**：对绝大多数文本类型都能取得良好效果。
			- **语义保持好**：尽可能地在段落和句子层面进行分割，避免破坏语义。
			- **灵活性高**：可以自定义分隔符列表以适应特定格式。
		- **劣势：**
			- 对于具有严格语法结构的数据（如代码、Markdown），效果可能不如专用的分割器。
	- CharacterTextSplitter   (字符分割器)
	  collapsed:: true
		- **适用场景与数据特点：**
			- **场景**: 简单字符串或以固定分隔符组织的数据，如 CSV 数据行、传感器日志。
			- **数据特点**: 数据格式高度统一，每一行或由特定字符分隔的部分本身就是一个独立的、完整的记录。例如，日志文件中的每一行都是一条独立的事件记录。
		- **优势：**
			- **速度极快**：算法简单，计算开销小。
			- **简单可控**：行为完全可预知。
		- **劣势：**
			- **破坏语义：**完全不关心文本的语义结构，可能在句子中间或单词中间进行切分。
			- **适用性差**：对于复杂的自然语言文本，效果通常很差。
	- TokenTextSplitter  (Token 分割器)
	  collapsed:: true
		- **适用场景与数据特点**
			- **场景**: 需要严格控制输入长度的 LLM 应用，如处理 API 响应、优化长查询。
			- **数据特点**: 任何文本都可以使用，但其核心优势在于处理那些长度接近模型极限的、需要精确控制成本和输入的场景。
		- **优势：**
			- **长度控制精确**：能确保每个块的 Token 数都在限制内。
			- **与模型对齐**：分割单位与模型的处理单位一致。
		- **劣势**:
			- **可能破坏语义**：与 `CharacterTextSplitter` 类似，它可能在句子中间为了满足 Token 数量而切分。
			- **依赖分词器**：需要额外的分词库（如 `tiktoken`），并且分词本身有一定计算开销。
	- 结构化文本分割器：`MarkdownTextSplitter` / `HTMLSplitter` / `LatexTextSplitter`
	  collapsed:: true
		- **适用场景与数据特点**
			- **场景**: 解析技术文档、API 手册、学术论文、网页抓取内容。
			- **数据特点**: 数据本身包含丰富的元结构信息，如 Markdown 的标题层级、HTML 的 DOM 树结构。这些结构本身就定义了内容的边界。
		- **优势：**
			- **语义块质量高**：分割出的块通常对应一个完整的小节或段落，逻辑性强。
			- **保留元信息**：可以从结构中提取有用的元数据（如标题）。
		- **劣势：专用性强：只能处理特定格式的文档。**
	- PythonCodeTextSplitter (代码分割器)
	  collapsed:: true
		- **适用场景与数据特点**
			- **场景**: 源代码分析、代码库问答、脚本调试。
			- **数据特点**: 具有严格、明确的编程语法，如 Python 的缩进和 `def`/`class` 关键字。
		- **优势：**
			- **代码块完整**：确保函数或类的定义不被切分。
			- **提升代码理解**：为 LLM 提供结构完整的代码上下文。
		- **劣势：**
			- **语言特定**：通常需要为不同编程语言选择对应的分割器。
	- NLP 语义分割器：`SentenceTextSplitter` / `SpacyTextSplitter` / `NLTKTextSplitter`
	  collapsed:: true
		- **适用场景与数据特点**
			- **场景**: 处理自然语言文章、对话记录、法律合同等对句子完整性要求高的文本。
			- **数据特点**: 文本由符合语法规则的句子构成。这类分割器对于处理复杂的长句或不规范的标点符号比简单的正则匹配更鲁棒。
		- **优势：**
			- **语义完整性高**：确保分割边界在句子层面。
			- **处理复杂句子**：NLP 库能更好地处理各种标点和句子结构。
		- **劣势：**
			- **计算开销大**：需要加载 NLP 模型，比简单的字符分割慢。
			- **依赖外部库**：需要安装和配置 NLTK, spaCy 等。
			- **句子长度不一**：可能产生非常短或非常长的块（单个句子）。
- Tools
	- **工具调用目的：** #面试背诵汇总/大模型
	  collapsed:: true
		- **突破知识限制**：语言模型的知识是静态的，截止于其训练数据的最后日期。工具调用使其能够访问实时数据，回答“今天天气怎么样？”或“最近有什么关于 AI 的新闻？”这类问题。
		- **执行实际动作**：模型本身无法改变世界，但工具可以。通过调用发送邮件的工具、操作数据库的工具，模型可以将它的“想法”转化为实际的行动。
		- **提升任务处理能力**：对于一些精确计算或逻辑性极强的任务（如复杂的数学运算），语言模型有时会出错（“幻觉”）。将这些任务交给专业的工具（如计算器），可以保证结果的准确性。
		- **构建更强大的应用**：工具调用是构建智能代理（Agent）和复杂应用（如自动化工作流）的核心。它让 LLM 从一个单纯的“聊天机器人”进化为可以解决实际问题的“智能助手”。
	- 基础调用
		- 定义工具
		  collapsed:: true
			- ```python
			  from langchain_core.tools import tool
			  
			  # 使用 @tool 装饰器来定义一个工具
			  # 任何函数都可以通过这个装饰器变成一个 LangChain 工具
			  # 函数的文档字符串（docstring）非常重要，它会成为工具的描述，模型将依据这个描述来决定何时使用该工具。
			  @tool
			  def multiply(a: int, b: int) -> int:
			      """用于计算两个整数的乘积。"""
			      return a * b
			  
			  @tool
			  def search_weather(city: str) -> str:
			      """用于查询指定城市的实时天气。"""
			      # 这里的实现是简化的，实际应用中你可能会调用一个真正的天气API
			      if "北京" in city:
			          return "北京今天是晴天，气温25摄氏度。"
			      elif "上海" in city:
			          return "上海今天是阴天，有小雨，气温22摄-氏度。"
			      else:
			          return f"抱歉，我没有'{city}'的天气信息。"
			  
			  # 将我们定义好的工具放入一个列表，以便后续使用
			  tools = [multiply, search_weather]
			  ```
		- 绑定工具并发起调用
		  collapsed:: true
			- ```python
			  # -*- coding: utf-8 -*-
			  from langchain_openai import ChatOpenAI
			  from langchain_core.tools import tool
			  from langchain_core.messages import HumanMessage, AIMessage
			  
			  # --- DeepSeek API 配置 ---
			  # 请替换为你的 DeepSeek API 密钥
			  API_KEY = "sk-52e226ac3cac46838cb282b45b1a648e"
			  API_URL = "https://api.deepseek.com/v1"
			  MODEL = "deepseek-chat"
			  
			  # --- 步骤1: 初始化 ChatOpenAI ---
			  # 虽然我们用的是DeepSeek，但它兼容OpenAI的API格式，所以可以使用ChatOpenAI类
			  llm = ChatOpenAI(
			      model=MODEL,
			      api_key=API_KEY,
			      base_url=API_URL,
			      temperature=0.8,
			      max_tokens=300
			  )
			  
			  
			  # --- 步骤2: 定义我们的工具 ---
			  @tool
			  def multiply(a: int, b: int) -> int:
			      """用于计算两个整数的乘积。"""
			      print(f"正在执行乘法: {a} * {b}")
			      return a * b
			  
			  
			  @tool
			  def search_weather(city: str) -> str:
			      """用于查询指定城市的实时天气。"""
			      print(f"正在查询天气: {city}")
			      if "北京" in city:
			          return "北京今天是晴天，气温25摄氏度。"
			      elif "上海" in city:
			          return "上海今天是阴天，有小雨，气温22摄氏度。"
			      else:
			          return f"抱歉，我没有'{city}'的天气信息。"
			  
			  
			  # 将工具列表放入一个变量
			  tools = [multiply, search_weather]
			  
			  # --- 步骤3: 将工具绑定到LLM ---
			  # .bind_tools() 方法会将工具的结构信息（名称、描述、参数）传递给模型
			  # 这样模型在推理时就知道自己有哪些"超能力"了
			  llm_with_tools = llm.bind_tools(tools)
			  
			  # --- 步骤4: 发起调用 ---
			  # 第一次调用：让模型决定是否以及如何调用工具
			  print("--- 第一次调用：模型生成工具调用指令 ---")
			  query = "北京今天天气怎么样？另外请帮我计算一下 12乘以8 等于多少？"
			  # invoke 方法会返回一个 AIMessage 对象
			  # 如果模型决定调用工具，相关信息会储存在 .tool_calls 属性中
			  ai_msg = llm_with_tools.invoke(query)
			  
			  print("模型返回的AIMessage:")
			  print(ai_msg)
			  print("\n解析出的工具调用请求:")
			  print(ai_msg.tool_calls)
			  
			  # --- 步骤5: 执行工具调用 ---
			  print("\n--- 执行工具调用 ---")
			  tool_results = []
			  for tool_call in ai_msg.tool_calls:
			      # 根据工具名称找到对应的工具函数
			      tool_name = tool_call["name"]
			      tool_args = tool_call["args"]
			  
			      # 查找对应的工具
			      selected_tool = None
			      for t in tools:
			          if t.name == tool_name:
			              selected_tool = t
			              break
			  
			      if selected_tool:
			          print(f"执行工具: {tool_name}, 参数: {tool_args}")
			          # 执行工具并获取结果
			          result = selected_tool.invoke(tool_args)
			          tool_results.append({
			              "tool_call_id": tool_call["id"],
			              "name": tool_name,
			              "result": result
			          })
			          print(f"工具执行结果: {result}")
			      else:
			          print(f"未找到工具: {tool_name}")
			  ```
	- agent调用：**自主规划**、**决定**是否需要调用工具、调用哪个工具、以及如何组织调用顺序，直到最终完成任务
	  collapsed:: true
		- ```python
		  # -*- coding: utf-8 -*-
		  from langchain_openai import ChatOpenAI
		  from langchain_core.tools import tool
		  from langchain.agents import create_tool_calling_agent, AgentExecutor
		  from langchain_core.prompts import ChatPromptTemplate
		  from langchain_core.messages import HumanMessage, AIMessage
		  
		  # --- 复用之前的API配置和LLM、工具定义 ---
		  API_KEY = "sk-52e226ac3cac46838cb282b45b1a648e"
		  API_URL = "https://api.deepseek.com/v1"
		  MODEL = "deepseek-chat"
		  llm = ChatOpenAI(model=MODEL, api_key=API_KEY, base_url=API_URL, temperature=0)
		  @tool
		  def multiply(a: int, b: int) -> int:
		      """用于计算两个整数的乘积。"""
		      return a * b
		  @tool
		  def search_weather(city: str) -> str:
		      """用于查询指定城市的实时天气。"""
		      if "北京" in city:
		          return "北京今天是晴天，气温25摄氏度。"
		      elif "上海" in city:
		          return "上海今天是阴天，有小雨，气温22摄氏度。"
		      else:
		          return f"抱歉，我没有'{city}'的天气信息。"
		  tools = [multiply, search_weather]
		  
		  # --- 1. 创建Agent的提示模板 (Prompt) ---
		  # 这是指导Agent如何思考和行动的“说明书”
		  # 包含了系统指令、历史消息、用户输入和 agent_scratchpad
		  # agent_scratchpad 是一个特殊占位符，用于存放Agent在思考过程中的中间步骤（工具调用和返回结果）
		  prompt = ChatPromptTemplate.from_messages([
		      ("system", "你是一个乐于助人的助手。"),
		      ("human", "{input}"),
		      # MessagesPlaceholder 会自动格式化和插入 agent_scratchpad 中的消息
		      ("placeholder", "{agent_scratchpad}"),
		  ])
		  
		  # --- 2. 创建工具调用Agent ---
		  # create_tool_calling_agent 是一个便捷的函数，用于创建一个遵循特定工具调用逻辑的Agent
		  # 它将LLM、工具和提示模板“组装”在一起
		  agent = create_tool_calling_agent(llm, tools, prompt)
		  
		  # --- 3. 创建Agent执行器 (AgentExecutor) ---
		  # AgentExecutor 是Agent的“执行引擎”，它负责循环运行Agent，直到得到最终答案
		  # 它处理了调用Agent -> 解析工具调用 -> 执行工具 -> 将结果返回给Agent 的完整循环
		  agent_executor = AgentExecutor(agent=agent, tools=tools, verbose=True)
		  # 设置 verbose=True 可以让我们看到Agent的完整思考过程，非常有助于调试
		  
		  # --- 4. 运行Agent ---
		  print("--- 运行Agent处理单步任务 ---")
		  response1 = agent_executor.invoke({"input": "上海今天天气怎么样?"})
		  print("\n最终回答:")
		  print(response1["output"])
		  
		  print("\n\n--- 运行Agent处理多步任务 ---")
		  response2 = agent_executor.invoke({
		      "input": "先帮我查一下北京的天气，然后计算 35 乘以 3 的结果是多少？"
		  })
		  print("\n最终回答:")
		  print(response2["output"])
		  ```
- 记忆模块
	- ConversationBufferMemory：全部记忆
	  collapsed:: true
		- `ConversationBufferMemory` 会将所有历史对话**原封不动地**完整保存下来。当进行新的对话时，它会将全部历史记录和新问题一起发送给 LLM。
		- **优点**:
			- **信息完整**: 保留了所有原始对话细节，没有任何信息丢失。
			- **简单直观**: 实现和理解都非常容易。
		- **缺点**:
			- **成本高/Token消耗大**: 随着对话轮次增加，历史记录会变得非常长，导致 API 请求的 Token 数量急剧增加，不仅提高成本，还可能超出模型的上下文窗口限制而报错。
		- **适用场景**:
			- 短时、简短的对话。
			- 用于学习和调试 LangChain 记忆功能的入门场景。
		- ```python
		  # -*- coding: utf-8 -*-
		  from langchain_openai import ChatOpenAI
		  from langchain.chains import ConversationChain
		  from langchain.memory import ConversationBufferMemory
		  
		  # --- DeepSeek API 配置 ---
		  # 请替换为你的 DeepSeek API 密钥
		  API_KEY = "sk-52e226ac3cac46838cb282b45b1a648e"
		  API_URL = "https://api.deepseek.com/v1"
		  MODEL = "deepseek-chat"
		  
		  # 1. 初始化 LLM
		  # 我们将使用 DeepSeek 模型作为对话的核心
		  llm = ChatOpenAI(
		      model=MODEL,
		      api_key=API_KEY,
		      base_url=API_URL,
		      temperature=0.7 # 设置温度参数，让回答带一些创造性
		  )
		  
		  # 2. 初始化 ConversationBufferMemory
		  # 这是最简单的记忆类型，它会存储所有对话历史。
		  # memory_key="history" 指定了在提示模板中，用 "history" 这个变量名来引用记忆内容。
		  memory = ConversationBufferMemory(memory_key="history")
		  
		  # 3. 创建 ConversationChain
		  # ConversationChain 是一个将 LLM 和 Memory 链接在一起的链。
		  # verbose=True 会在控制台打印出完整的提示(Prompt)和模型的思考过程，非常有助于理解和调试。
		  conversation_chain = ConversationChain(
		      llm=llm,
		      memory=memory,
		      verbose=True
		  )
		  
		  # --- 开始对话 ---
		  print("--- 开始使用 ConversationBufferMemory ---")
		  
		  # 第一次对话
		  response1 = conversation_chain.predict(input="你好，我叫小明。")
		  print("AI:", response1)
		  
		  # 第二次对话
		  # Memory 会自动将第一次的对话内容加入到 Prompt 中
		  response2 = conversation_chain.predict(input="你还记得我叫什么名字吗？")
		  print("AI:", response2)
		  ```
	- ConversationBufferWindowMemory：K轮部分记忆
	  collapsed:: true
		- `ConversationBufferWindowMemory` 只会保留**最近 K 轮**的对话历史。
		- **优点**:
			- **控制成本和Token**: 有效地将每次请求的 Token 数量限制在一个可控范围内，避免超出上下文限制。
			- **性能均衡**: 在保留上下文和控制资源消耗之间取得了很好的平衡。
		- **缺点**:
			- **丢失早期信息**: 如果关键信息出现在很早以前（超出了窗口大小），那么这部分记忆将会丢失。
		- **适用场景**:
			- 绝大多数通用的聊天机器人应用。
			- 对话的重点主要集中在最近的几次交互中。
-