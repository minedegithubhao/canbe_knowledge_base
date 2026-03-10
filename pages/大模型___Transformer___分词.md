alias:: 分词
tags:: 
type:: 概念
status:: 整理中

	- ## 🧠 一句话说清楚（费曼）
		- 分词 = 文字 → 切成 [[Token]] → 再转成 [[Token ID]] 的过程
			- ((69af63aa-ec9b-4e1c-8670-b458372bff9f))
		- 标准分词过程：文本 → **分词** → [[Token序列]] → 查[[词表]] → [[Token ID序列]]
	- ## 💘企业开发场景
	  collapsed:: true
		- {{实际企业开发当中的场景，按常见度由高往低排序，低于10%的场景不记录}}
		- {{场景一： xxxxxxxx}}
		- {{企业实现：xxxxxxxx}}
	- ## ⚠️易错/易混点（复习必看）
	  collapsed:: true
		- {{相近概念易混的点}}
	- ## 🔁核心原理/流程（极简版）
		- 分词代码示例
		  id:: 69af63aa-ec9b-4e1c-8670-b458372bff9f
			- ```python
			  from transformers import AutoTokenizer
			  
			  # 加载分词器（企业里常用的m3e-base）
			  tokenizer = AutoTokenizer.from_pretrained("m3e-base")
			  
			  # 处理输入文本 → 生成enc字典
			  texts = ["大模型RAG检索", "ES关键字检索"]
			  enc = tokenizer(
			      texts,                # 输入文本
			      padding=True,         # 补全长度
			      truncation=True,      # 截断超长文本
			      return_tensors="pt"   # 返回PyTorch张量（关键！）
			  )
			  
			  # 打印enc的结构（企业里看到的真实样子）
			  print(enc)
			  ```
			- 输出结果
			- ```json
			  {
			    'input_ids': tensor([[101, 3726, 3952, 1744, 826, 656, 102, 0],  # 第1个文本的token id
			                         [101, 5678, 4567, 826, 656, 102, 0, 0]]), # 第2个文本的token id
			    'attention_mask': tensor([[1, 1, 1, 1, 1, 1, 1, 0],            # 注意力掩码：1=有效token，0=补全的padding
			                              [1, 1, 1, 1, 1, 1, 0, 0]]),
			    'token_type_ids': tensor([[0, 0, 0, 0, 0, 0, 0, 0],            # 分句标识（单句文本全为0）
			                              [0, 0, 0, 0, 0, 0, 0, 0]])
			  }
			  ```
			- 当`return_tensors="pt"`返回[[PyTorch张量]]，如果不指定返回的就是普通 [[列表]]。
			- [[注意力掩码]]
			- [101, 5678, 4567, 826, 656, 102, 0, 0]就是 [[Token ID序列]]
			- 分词器返回结果（字典）：`enc`
			  id:: 69b01727-de90-45fb-9c9d-359e12e04e8a
				- | 字段名 | 类型 | 作用（企业实战） | 是不是张量？ |
				  | ---- | ---- | ---- |
				  | `input_ids` | Tensor | token 的数字编号（模型核心输入） | 是 |
				  | `attention_mask` | Tensor | 标记有效 token（1）和补全 padding（0） | 是 |
				  | `token_type_ids` | Tensor | 区分多句文本（单句全为 0） | 是 |
				  | `overflow_to_sample_mapping` | List | 超长文本截断后的映射（可选） | 否 |
				  | `offset_mapping` | List | token 对应原文的位置（可选） | 否 |
			-
			- <!--EndFragment-->
	- ##  📘 核心概念（官方）
		- {{官方说法}}
	- ## 🔍 核心作用（解决什么问题）
	  collapsed:: true
		- {{能解决企业开发当中的什么问题}}
	- ## 🪡关键特点（优缺点）
	  collapsed:: true
		- ### 优点
			- {{捡重要的说，最多3条，多了记不住}}
			- {{1、 xxxx}}
			- {{2、 xxxx}}
			- {{3、 xxxx}}
		- ### 缺点
			- {{捡重要的说，最多3条，多了记不住}}
			- {{1、 xxxx}}
			- {{2、 xxxx}}
			- {{3、 xxxx}}
	- ## 📝 面试题（自问自答）
		- {{问题一：XXX }}
	- ## ✅ 掌握程度
		- [ ] 认识
		- [ ] 理解
		- [ ] 能画图
		- [ ] 能背诵