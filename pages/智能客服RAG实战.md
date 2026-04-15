alias::
tags:: 项目实战
type:: 概念
status:: 草稿

- 评估案例Prompt
  collapsed:: true
	- ```text
	  请为文档块生成 100 条评测案例，每条评测案例必须是合法 JSON 对象，最终输出一个 JSON 数组，每条数据之间用逗号分隔，最后一条不要加逗号。
	  
	  【JSON 格式示例】:
	  {
	    "case_id":"category_order_001_paraphrase_01",
	    "question": "我买完的订单在哪看",
	    "standard_question":"如何查看我的订单？",
	    "standard_answer":{
	      "id":"FAQ_订单相关_001",
	      "context":"进入 “我的”→“我的订单”，可查看全部、待付款、待发货、待收货、售后订单。"
	    },
	    "expected_ids":["FAQ_订单相关_001"],
	    "category":"订单相关",
	    "expected_category":"订单相关",
	    "must_include":["我的订单"],
	    "should_include":["待付款", "待发货", "待收货", "售后订单"],
	    "must_not_include":["编造路径", "文档外功能"],
	    "expected_behavior": "answer_from_context",
	    "reject_answer_allowed": false,
	    "difficulty": "easy",
	    "case_type": "paraphrase",
	    "tags": ["retrieval", "rerank", "generation", "paraphrase"],
	    "priority": "high"
	  }
	  
	  【字段要求】:
	  1. case_id: 唯一编号，自动生成，格式：faq_{category}_{数字}_{case_type}_{序号}
	  2. question: 用户实际提出的问题
	  3. standard_question: 原始 FAQ 问题，保证系统答对的底线
	  4. standard_answer: 原始答案，包括 id 和 context
	  5. expected_ids: 期望召回的 FAQ id
	  6. category / expected_category: 样本所属类别和期望类别
	  7. must_include: 核心必答点，严格必须包含
	  8. should_include: 可选关键词，缺失影响完整性但不算错误
	  9. must_not_include: 禁止出现的内容，严格检查
	  10. expected_behavior: answer_from_context → 必须从文档回答，不允许编造
	  11. reject_answer_allowed: false → 必须回答；true → 可拒答
	  12. difficulty: 样本难度层次，easy / medium / hard
	  13. case_type: golden / paraphrase / scene_based / incomplete / ambiguous / out_of_scope / safety / policy_boundary
	  14. tags: 对应 case_type 的能力标签
	      - golden → ["retrieval", "rerank", "generation"]
	      - paraphrase → ["retrieval", "rerank", "generation", "paraphrase"]
	      - scene_based → ["retrieval", "generation", "scene_based"]
	      - incomplete → ["retrieval", "generation", "incomplete"]
	      - ambiguous → ["retrieval", "generation", "ambiguous"]
	      - out_of_scope → ["reject", "out_of_scope"]
	      - safety / policy_boundary → ["safety", "policy_boundary"]
	  15. priority: high / medium / low
	  
	  【生成比例建议】:
	  - case_type 分布：
	    - golden 10%
	    - paraphrase 30%
	    - scene_based 20%
	    - incomplete 10%
	    - ambiguous / contrastive 10%
	    - out_of_scope 15%
	    - safety / policy_boundary 5%
	  - difficulty 分布：
	    - easy 50%
	    - medium 30%
	    - hard 20%
	  - 负样本和边界样本必须生成，out_of_scope + safety + policy_boundary 总量约占总样本 20%左右
	  
	  【约束】:
	  1. paraphrase 问题必须口语化、同义改写或短句形式，避免与 standard_question 完全一致
	  2. must_include / must_not_include 必须严格遵守，否则判为违规
	  3. JSON 必须合法，可直接解析，不允许缺逗号、缺引号或语法错误
	  
	  【输出】:
	  生成 100 条 JSON 样本，保证：
	  - case_id 唯一
	  - 包含所有指定字段
	  - 遵守比例、难度、tags 和禁答规则
	  - 最终输出 JSON 数组格式
	  ```
-