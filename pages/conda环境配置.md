- ```cmd
  # 创建环境（python=3.11 最稳定）
  # 创建评估环境，避免污染环境，确定包无冲突后，可切回开发环境重新安装
  conda create -n llm_env python=3.11 -y
  conda activate llm_env
  
  # 安装依赖，确认torch==2.2.2，pip show torch
  pip install torch==2.2.2 torchvision==0.17.2 torchaudio==2.2.2
  
   # 卸载其它版本
   pip uninstall -y langchain langchain-core langchain-community langchain-openai
   # 重新安装，langchain>=0.2.0,<0.4.0，langchain会自动进行包管理，避免冲突
   pip install "langchain>=0.2.0,<0.4.0" "langchain-core>=0.2.36,<0.3.0" "langchain-community>=0.2.0,<0.4.0" "langchain-ollama>=0.1.0,<0.2.0" "langchain-openai>=0.1.0,<0.2.0"
   
   # 安装ragas依赖
   pip install ragas==0.1.7 datasets==2.18.0 pydantic==2.5.2 chromadb
   # pip uninstall -y  ragas datasets pydantic chromadb
   # 如果提示pydantic版本不够则使用如下命令
   # pip install ragas==0.1.7 datasets==2.18.0 pydantic==2.9 chromadb
   
   pip install jieba rank_bm25 transformers
  ```
-
- 删除沙箱
	- ```bash
	  conda remove -n python311 --all
	  ```
- 检查包版本
	- ```bash
	  pip show streamlit
	  ```
- 查看conda环境列表
	- ```bash
	  conda info --envs
	  ```
-