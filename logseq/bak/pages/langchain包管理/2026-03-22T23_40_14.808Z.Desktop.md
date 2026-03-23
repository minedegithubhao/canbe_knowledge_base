- ```cmd
   # torch 版本
   torch 2.2.2
   # 卸载其它版本
   pip uninstall -y langchain langchain-core langchain-community langchain-openai
   # 重新安装，langchain>=0.2.0,<0.4.0，langchain会自动进行包管理，避免冲突
   pip install "langchain>=0.2.0,<0.4.0" "langchain-core>=0.2.36,<0.3.0" "langchain-community>=0.2.0,<0.4.0" "langchain-ollama>=0.1.0,<0.2.0" "langchain-openai>=0.1.0,<0.2.0"
   
   # 创建评估环境，避免污染环境，确定包无冲突后，可切回开发环境重新安装
   conda activate python311_ragas
   # 安装ragas依赖
   pip install ragas==0.1.7 datasets==2.18.0 pydantic==2.5.2 chromadb
  ```