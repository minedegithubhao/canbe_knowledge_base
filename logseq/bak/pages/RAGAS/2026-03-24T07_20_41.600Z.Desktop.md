alias::
tags:: RAG评估
type:: 概念
status:: 草稿

	- ## 🧠 一句话说清楚（费曼）
		- ```text
		  Faithfulness（事实一致性）：召回 → 回答
		  Context Precision（上下文精确率）：问题 → 召回
		  Context Recall（上下文召回率）：召回 → 回答（覆盖率）
		  Answer Relevancy（答案相关性）：问题 → 回答
		  ```
		- 企业最佳实践：RAGAS + [[PAGAS]] 融合方案，如下：
			- ```python
			  # RAGAS 评估返回的 scores 示例（0-1 分制）
			  scores = {
			      "faithfulness": 0.95,        # RAGAS 事实一致性分数
			      "context_precision": 0.88,    # RAGAS 检索精准度分数
			      "context_recall": 0.82,       # RAGAS 上下文召回率分数
			      "answer_relevancy": 0.90,     # RAGAS 答案相关性分数
			      "ragas_score": 0.8875         # RAGAS 内置的默认平均分（可选）
			  }
			  
			  # 企业自定义的业务权重（PAGAS 思路）
			  business_weights = {
			      "faithfulness": 0.4,
			      "context_precision": 0.3,
			      "context_recall": 0.2,
			      "answer_relevancy": 0.1
			  }
			  
			  # 计算业务总分（PAGAS 总分）
			  total_score = sum(scores[key] * business_weights[key] for key in business_weights)
			  # 计算过程：0.95*0.4 + 0.88*0.3 + 0.82*0.2 + 0.90*0.1 = 0.906
			  ```
	- ## 💘企业开发场景
	  collapsed:: true
		- {{实际企业开发当中的场景，按常见度由高往低排序，低于10%的场景不记录}}
		- {{场景一： xxxxxxxx}}
		- {{企业实现：xxxxxxxx}}
	- ## 📝 面试题（自问自答）
	  collapsed:: true
		- {{问题一：XXX }}