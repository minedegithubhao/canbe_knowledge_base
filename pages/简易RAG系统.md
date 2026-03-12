alias:: 纯文本RAG代码
tags:: 项目实战, 代码
type:: 概念
status:: 草稿

- 旨在构建可运行的简易纯文本RAG 系统
- 简易[[纯文本RAG]]系统， [[纯文本RAG流程图]]
	- 导包
		- ```python
		  # 1. 导入最基础的包
		  from langchain_community.document_loaders import TextLoader
		  from langchain_text_splitters import RecursiveCharacterTextSplitter  # 拆分器独立包
		  from langchain_community.vectorstores import Chroma
		  from langchain_community.embeddings import HuggingFaceEmbeddings
		  from langchain_ollama import ChatOllama  # Ollama模型
		  ```
	- 构建知识库， [[图文知识库流程图]]
		- 加载并切分文档（核心步骤不变）
			- ```python
			  def load_and_split_doc():
			      # 加载test.txt
			      loader = TextLoader("test.txt", encoding="utf-8")
			      docs = loader.load()
			      # 切分chunk
			      splitter = RecursiveCharacterTextSplitter(chunk_size=300, chunk_overlap=50)
			      split_docs = splitter.split_documents(docs)
			      return split_docs
			  ```
		- 文本嵌入 & 持久化
		  collapsed:: true
			- ```python
			  # 加载本地嵌入模型
			      embeddings = HuggingFaceEmbeddings(
			          model_name=MODEL_PATH,
			          model_kwargs={"device": "cpu"},
			          encode_kwargs={"normalize_embeddings": True}
			      )
			      # 构建向量库
			      db = Chroma.from_documents(docs, embeddings, persist_directory="./chroma_db")
			      db.persist()
			  ```
	- RAG检索， [[纯文本RAG流程图]]
		- 基础配置
		  collapsed:: true
			- ```python
			  # 基础配置
			  MODEL_PATH = "../modules/m3e-base"  # 你的本地m3e路径
			  OLLAMA_MODEL = "qwen2:0.5b"  # 你的Ollama模型名
			  OLLAMA_URL = "http://localhost:11434"
			  ```
		- [[向量检索]]相似 [[chunk]]
		  collapsed:: true
			- ```python
			  # 检索Top3相似chunk
			  similar_docs = db.similarity_search(query, k=3)
			  # 拼接检索结果为上下文
			  context = "\n\n".join([doc.page_content for doc in similar_docs])
			  return context, similar_docs
			  ```
		- 调用本地大模型生成回答
		  collapsed:: true
			- ```python
			  def generate_answer(query, context):
			      # 初始化本地Ollama模型
			      llm = ChatOllama(
			          model=OLLAMA_MODEL,
			          base_url=OLLAMA_URL,
			          temperature=0.1
			      )
			      # 构建RAG Prompt（核心！把上下文和问题传给大模型）
			      prompt = f"""请严格根据下面的参考文档回答问题，不要编造任何信息：
			  参考文档：
			  {context}
			  
			  问题：{query}
			  回答："""
			      # 调用大模型
			      response = llm.invoke(prompt)
			      return response.content
			  ```
		- 主函数（串联所有步骤）
			- ```python
			  if __name__ == "__main__":
			      # 前置检查：确保Ollama服务已启动（终端运行 ollama run qwen2:0.5b）
			      print("📌 请确保Ollama服务已启动（终端运行：ollama run qwen2:0.5b）")
			      
			      # 步骤1：加载并切分文档
			      docs = load_and_split_doc()
			      print("✅ 文档加载并切分完成")
			      
			      # 步骤2：用户提问
			      query = input("\n💡 请输入你的问题：")
			      
			      # 步骤3：检索相似文档
			      context, similar_docs = retrieve_similar_docs(query, docs)
			      print("\n📚 检索到的参考文档：")
			      for idx, doc in enumerate(similar_docs, 1):
			          print(f"{idx}. {doc.page_content[:200]}...")
			      
			      # 步骤4：生成回答
			      answer = generate_answer(query, context)
			      print("\n✅ 最终回答：")
			      print(answer)
			  ```
	- RAG评估：[[PAGAS]]
		- 核心代码：准备评估用例，根据`评估用例`、`大模型生成的内容`、`RAG检索到的Chunk`、`评估用例的标准答案`交给PAGAS进行评估
		- ```python
		  if __name__ == "__main__":
		      print("📌 请确保Ollama服务已启动（终端运行：ollama run qwen2:0.5b）")
		  
		      # 第一步：初始化（只执行一次，耗时一次）
		      init_rag("01图解大模型：生成式AI原理与实战.pdf")  # 替换成你的文档路径
		  
		      # 2. 准备评估用例（问题+标准答案）
		      eval_cases = [
		          {
		              "query": "如何通过提示词减少大模型幻觉？",
		              "ground_truth": "1. 明确要求模型只基于参考文档回答；2. 限定回答范围；3. 要求标注信息来源；4. 提供少样本示例。"
		          }
		      ]
		  
		      # 3. 运行评估
		      for case in eval_cases:
		          query = case["query"]
		          ground_truth = case["ground_truth"]
		  
		          # 检索+生成回答
		          context, retrieved_docs = retrieve_similar_docs(query)
		          prompt = f"""请严格根据参考文档回答问题，不要编造：
		      {context}
		      问题：{query}
		      回答："""
		          answer = llm.invoke(prompt).content
		  
		          # 执行PAGAS评估
		          pagas_scores = evaluate_rag_pagas(query, ground_truth, retrieved_docs, answer)
		  
		          # 输出评估结果
		          print("=" * 50)
		          print(f"问题：{query}")
		          print(f"回答：{answer}")
		          print("\nPAGAS评估得分：")
		          for key, value in pagas_scores.items():
		              print(f"{key}：{value:.2f}")
		  ```
- 完整代码
	- ```python
	  # 1. 导入最基础的包
	  from langchain_community.document_loaders import TextLoader
	  from langchain_text_splitters import RecursiveCharacterTextSplitter  # 拆分器独立包
	  from langchain_community.vectorstores import Chroma
	  from langchain_community.embeddings import HuggingFaceEmbeddings
	  from langchain_ollama import ChatOllama  # Ollama模型
	  
	  # 2、基础配置
	  MODEL_PATH = "../modules/m3e-base"  # 你的本地m3e路径
	  OLLAMA_MODEL = "qwen2:0.5b"  # 你的Ollama模型名
	  OLLAMA_URL = "http://localhost:11434"
	  
	  # 3、加载文档并切分（你自己建一个 test.txt，随便写几句话）
	  def load_and_split_doc():
	      # 加载test.txt
	      loader = TextLoader("test.txt", encoding="utf-8")
	      docs = loader.load()
	  
	      # 切分chunk
	      splitter = RecursiveCharacterTextSplitter(chunk_size=300, chunk_overlap=50)
	      split_docs = splitter.split_documents(docs)
	      return split_docs
	  
	  
	  
	  # 4、初始化向量库并检索相似文档
	  def retrieve_similar_docs(query, docs):
	  
	      # 加载嵌入模型（m3e，企业最常用）
	      embeddings = HuggingFaceEmbeddings(
	          model_name="../modules/m3e-base",
	          model_kwargs={"device": "cpu"},
	          encode_kwargs={"normalize_embeddings": True}
	      )
	  
	      # 构建向量库
	      db = Chroma.from_documents(docs, embeddings, persist_directory="./chroma_db")
	      db.persist()
	  
	      # 检索Top3相似chunk
	      similar_docs = db.similarity_search(query, k=3)
	  
	      # 拼接检索结果为上下文
	      context = "\n\n".join([doc.page_content for doc in similar_docs])
	      return context, similar_docs
	  
	  
	  # 5. 调用本地大模型生成回答
	  def generate_answer(query, context):
	      # 初始化本地Ollama模型
	      llm = ChatOllama(
	          model=OLLAMA_MODEL,
	          base_url=OLLAMA_URL,
	          temperature=0.1
	      )
	      # 构建RAG Prompt（核心！把上下文和问题传给大模型）
	      prompt = f"""请严格根据下面的参考文档回答问题，不要编造任何信息：
	  参考文档：
	  {context}
	  
	  问题：{query}
	  回答："""
	      # 调用大模型
	      response = llm.invoke(prompt)
	      return response.content
	  
	  
	  # 6. 主函数（串联所有步骤）
	  if __name__ == "__main__":
	      # 前置检查：确保Ollama服务已启动（终端运行 ollama run qwen2:0.5b）
	      print("📌 请确保Ollama服务已启动（终端运行：ollama run qwen2:0.5b）")
	  
	      # 步骤1：加载并切分文档
	      docs = load_and_split_doc()
	      print("✅ 文档加载并切分完成")
	  
	      # 步骤2：用户提问
	      query = input("\n💡 请输入你的问题：")
	  
	      # 步骤3：检索相似文档
	      context, similar_docs = retrieve_similar_docs(query, docs)
	      print("\n📚 检索到的参考文档：")
	      for idx, doc in enumerate(similar_docs, 1):
	          print(f"{idx}. {doc.page_content[:200]}...")
	  
	      # 步骤4：生成回答
	      answer = generate_answer(query, context)
	      print("\n✅ 最终回答：")
	      print(answer)
	  ```