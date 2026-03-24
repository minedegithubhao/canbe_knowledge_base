- alias::
  tags::
  type:: 概念
  status:: 草稿
- 提示词
  id:: 69c1fbff-f191-402f-9be5-5948810524dc
	- ```text
	  角色设定(Role)：
	  你是一位资深的 RAG (检索增强生成) 系统测评专家，擅长通过构建高质量、具有压力测试性质的黄金数据集 (Golden Dataset) 来探测系统在检索、重排及生成阶段的性能瓶颈。
	  
	  任务(Task):
	  请深度分析提供的【附件 Markdown 文档】，提取高质量的评估案例。这些案例必须能够覆盖 RAG 架构中从数据处理到最终生成的全链路技术要点。
	  
	  Json输出格式(JSON Output Structure):
	  请以 JSON 列表格式输出，每个案例包含以下字段：
	  - id: 案例编号（如 case_001）。
	  - question: 自然、口语化的用户提问，模拟真实应用场景。
	  - context_gold: 支撑答案的原文精确片段。若涉及多跳推理，需包含所有必要的原文片段。
	  - ground_truth: 严谨、准确的参考标准答案。
	  - question_type: [直接事实 | 多跳推理 | 总结概括 | 边界抗扰]。
	  - target_component: 该题专门测试的 RAG 技术组件 [ChunkSize | Hybrid Search | Query Rewrite | Rerank | Circuit Break | Top-K Sensitivity | Context Compression]。
	  - eval_logic: 简述为什么要用这道题测该组件。例如：“通过语义重叠但逻辑相反的描述，测试 Reranker 是否能识别 break/else 的否定逻辑”。
	  - eval_advice：评估建议，简述该案例在什么场景下能说明什么问题。例如：“如果你的系统只能答出前 5-6 个方法，说明你的 ChunkSize 严重偏小 或者 Top-K 召回深度不足。”
	  
	  关注点细化要求(Requirements & Constraints):
	  1. 关注点覆盖：
	      - ChunkSize: 设计需要跨越多个段落或列表才能完整回答的总结题。
	      - Hybrid Search: 设计包含特定方法名（如 `list.pop`）或特定数值（如 `79个字符`）的题目。
	      - Query Rewrite: 使用模糊的、口语化的描述（如“安全排序”、“先进先出”）来测试重写器还原专业术语的能力。
	      - Rerank: 利用语义高度相似但结论不同的片段（如 `break` 后的 `else` 执行情况）测试排序模型的区分度。
	      - Circuit Break (熔断): 设计文档中完全不存在、但看起来相关的“陷阱题”，要求标准答案必须为“文档未提及”。
	      - Multi-hop: 确保答案必须结合 Markdown 中至少两个不同标题/章节下的内容。
	  
	  2. 质量标准：
	      - 禁止幻觉: 答案必须严格基于文档内容，严禁包含文档之外的常识（例如文档没提 Python 3.12，答案就不能写 3.12 的特性）。
	      - 最简片段: context_gold必须是能够完全覆盖答案的最精简原文，避免无关干扰。
	      - 语言一致性: 提问和答案均需使用中文，且语气自然，避免学术教条。
	  
	  资料(Input Files):
	  【请根据附件 Markdown 内容开始生成】
	  ```
- 评估案例
  id:: 69c1fa16-8e0c-42f1-9dfa-dbdcb1efafd8
	- id:: 69c1fa25-f2bc-401c-bb2a-2ef8f5fad694
	  ```json
	  [
	    {
	      "id": "case_001",
	      "question": "在 Python 列表中，如果我用 pop 方法时不传任何参数，它默认会删掉哪一个？这和 append 的操作位置有什么关系吗？",
	      "context_gold": "list.append(x)\n\n在列表末尾添加一项。\n\nlist.pop([i])\n\n移除列表中给定位置上的条目，并返回该条目。 如果未指定索引号，则 a.pop() 将移除并返回列表中的最后一个条目。",
	      "ground_truth": "如果 pop 方法不指定索引，它会移除并返回列表中的最后一个条目。这与 append 操作的位置相对应，因为 append 也是在列表末尾添加一项。",
	      "question_type": "直接事实",
	      "target_component": "Hybrid Search",
	      "eval_logic": "通过特定的方法名（pop, append）测试词法搜索与向量搜索的结合，验证系统能否精准定位到方法定义字段。"
	    },
	    {
	      "id": "case_002",
	      "question": "请帮我汇总一下，Python 的列表对象一共有多少种方法？分别叫什么名字？",
	      "context_gold": "下面是列表对象的所有方法：\nlist.append(x)\nlist.extend(iterable)\nlist.insert(i, x)\nlist.remove(x)\nlist.pop([i])\nlist.clear()\nlist.index(x[, start[, end]])\nlist.count(x)\nlist.sort(*, key=None, reverse=False)\nlist.reverse()\nlist.copy()",
	      "ground_truth": "列表对象共有 11 种方法，分别是：append, extend, insert, remove, pop, clear, index, count, sort, reverse, copy。",
	      "question_type": "总结概括",
	      "target_component": "ChunkSize",
	      "eval_logic": "该题要求列出所有方法，测试分片大小是否能完整覆盖 5.1 章节的所有方法定义。如果分片太小且检索 Top-K 不足，答案会缺失部分方法。"
	    },
	    {
	      "id": "case_003",
	      "question": "我想实现那种‘排队买票，先到先得’的逻辑，直接用 Python 的列表效果好吗？有没有更好的推荐？",
	      "context_gold": "列表也可以用作队列，最先加入的元素，最先取出（“先进先出”）；然而，列表作为队列的效率很低。因为，在列表末尾添加和删除元素非常快，但在列表开头插入或移除元素却很慢（因为所有元素都必须移动一位）。实现队列最好用 collections.deque",
	      "ground_truth": "直接用列表效率不高，因为在开头删除元素很慢（需移动所有元素）。更好的推荐是使用 collections.deque，它专为两端快速添加和弹出而设计。",
	      "question_type": "直接事实",
	      "target_component": "Query Rewrite",
	      "eval_logic": "用户使用了口语化的“排队买票，先到先得”，测试重写器能否将其转化为语义上的“FIFO/队列/先进先出”并检索到关于队列效率的内容。"
	    },
	    {
	      "id": "case_004",
	      "question": "如果在循环里遇到了 break，那么循环后面带的那个 else 块还会执行吗？这和正常循环结束有什么区别？",
	      "context_gold": "循环语句还可以有一个 else 子句...它在循环迭代完整个序列（对于 for）或执行条件变为假（对于 while）时执行，但在循环被 break 语句终止时不会执行。",
	      "ground_truth": "如果循环被 break 终止，else 子句不会执行。只有当循环正常迭代完整个序列或条件变假而结束时，else 才会执行。",
	      "question_type": "直接事实",
	      "target_component": "Rerank",
	      "eval_logic": "“break”和“else”在文档中靠得很近且经常成对出现，测试重排模型能否识别出“终止不执行”这一关键逻辑，而非仅仅因为两个词同时出现就给高分。"
	    },
	    {
	      "id": "case_005",
	      "question": "我看文档里提到了代码风格，具体关于缩进和每一行的长度是怎么规定的？",
	      "context_gold": "使用 4 空格缩进，不使用制表符。\n每行不超过 79 个字符，这有助于在小显示器上阅读",
	      "ground_truth": "规定使用 4 空格缩进（不使用制表符），且每行不超过 79 个字符。",
	      "question_type": "直接事实",
	      "target_component": "Hybrid Search",
	      "eval_logic": "包含明确的数值（4，79），测试 Hybrid Search 中的 BM25 是否能通过数字特征快速召回编码风格章节。"
	    },
	    {
	      "id": "case_006",
	      "question": "在 Python 里定义一个类时，如果我希望它支持类似 a + b 这样的算术运算，文档里提到该怎么做吗？",
	      "context_gold": "此外，与 C++ 一样，具有特殊语法的内置运算符（算术运算符、下标等）都可以为类实例重新定义。",
	      "ground_truth": "文档提到可以为类实例重新定义具有特殊语法的内置运算符（如算术运算符）。",
	      "question_type": "直接事实",
	      "target_component": "Query Rewrite",
	      "eval_logic": "用户问“a + b”，测试系统能否联想到“算术运算符重新定义”这一专业概念。"
	    },
	    {
	      "id": "case_007",
	      "question": "生成器（Generator）和普通的类迭代器相比，在写代码的时候能省掉哪些步骤？为什么说它更紧凑？",
	      "context_gold": "但生成器的写法更为紧凑，因为它会自动创建 __iter__() 和 __next__() 方法。\n另一个关键特性在于局部变量和执行状态会在每次调用之间自动保存。这使得该函数相比使用 self.index 和 self.data 这种实例变量的方式更易编写且更为清晰。",
	      "ground_truth": "生成器会自动创建 __iter__() 和 __next__() 方法，且能自动保存局部变量和执行状态，无需手动维护 self.xxx 这种实例变量。",
	      "question_type": "总结概括",
	      "target_component": "Context Compression",
	      "eval_logic": "答案分布在“写法紧凑”和“状态保存”两个要点，测试压缩模块是否会为了节省空间而漏掉其中一个关键优势。"
	    },
	    {
	      "id": "case_008",
	      "question": "文档里说 Python 的类支持 OOP 的标准特性，具体包括哪些？",
	      "context_gold": "支持面向对象编程（OOP）的所有标准特性：类的继承机制支持多个基类、派生的类能覆盖基类的方法、类的方法能调用基类中的同名方法。",
	      "ground_truth": "具体包括：支持多重继承、派生类可以覆盖基类方法、类方法可以调用基类中的同名方法。",
	      "question_type": "直接事实",
	      "target_component": "Top-K Sensitivity",
	      "eval_logic": "该问题对应的内容位于“类”章节的开头。测试在召回多个片段时，系统是否能从第一段中提取完整特性清单。"
	    },
	    {
	      "id": "case_009",
	      "question": "关于 Python 3.11 版本中引入的异步推导式性能提升，文档里是怎么说的？",
	      "context_gold": "（文档内容仅涉及基础控制流、数据结构及类，无 3.11 异步推导式内容）",
	      "ground_truth": "文档未提及关于 Python 3.11 异步推导式的内容。",
	      "question_type": "边界抗扰",
	      "target_component": "Circuit Break",
	      "eval_logic": "这是一个文档外的问题，但包含“推导式”等文档内关键词。测试系统在检索不到对应版本信息时是否会触发熔断拒绝回答，还是会产生幻觉。"
	    },
	    {
	      "id": "case_010",
	      "question": "如果我要在类里面定义一个私有变量，文档里建议的命名方式是什么？这种方式能完全防止别人从外面改我的变量吗？",
	      "context_gold": "（这种做法称为 名称改写）: _classname__spam... 这并不是为了绝对防止未经授权的访问，而是为了避免名称冲突。",
	      "ground_truth": "建议使用双下划线开头的名称改写机制（如 _classname__spam）。但这并不能完全防止外部访问，其初衷是为了避免名称冲突。",
	      "question_type": "多跳推理",
	      "target_component": "Rerank",
	      "eval_logic": "问题包含“定义方式”和“安全性性质”，测试重排模型是否能将两个相关的属性片段排在一起供 LLM 总结。"
	    },
	    {
	      "id": "case_011",
	      "question": "我想知道 match 语句里的那个下划线 _ 到底起什么作用？它会报错吗？",
	      "context_gold": "最后一个代码块：变量名 _ 被作为 通配符 并必定会匹配成功。",
	      "ground_truth": "下划线 _ 在 match 语句中充当通配符，它必定会匹配成功，不会报错。",
	      "question_type": "直接事实",
	      "target_component": "Hybrid Search",
	      "eval_logic": "测试系统对特殊字符（下划线）的索引和检索能力。"
	    },
	    {
	      "id": "case_012",
	      "question": "在 Python 里，布尔运算符 and、or、not 的先后执行顺序是怎样的？最好给我举个例子说明。",
	      "context_gold": "这些操作符的优先级低于比较操作符；not 的优先级最高， or 的优先级最低，因此，A and not B or C 等价于 (A and (not B)) or C。",
	      "ground_truth": "优先级从高到低依次为：not、and、or。例如 A and not B or C 会先计算 not B，然后计算 and，最后计算 or。",
	      "question_type": "多跳推理",
	      "target_component": "Context Compression",
	      "eval_logic": "需要从优先级描述推理出运算顺序示例，测试压缩后是否保留了优先级对比的完整逻辑链。"
	    },
	    {
	      "id": "case_013",
	      "question": "如果我想把一个列表像‘倒垃圾’一样一次性全清空，最简单的方法是什么？文档里提到了类似 del 的用法吗？",
	      "context_gold": "list.clear()\n\n移除列表中的所有项。 类似于 del a[:]",
	      "ground_truth": "最简单的方法是使用 list.clear()，它类似于执行 del a[:]",
	      "question_type": "直接事实",
	      "target_component": "Query Rewrite",
	      "eval_logic": "用户使用了“倒垃圾”这种极端口语化的表达，测试重写器能否映射到“清空列表”的语义。"
	    },
	    {
	      "id": "case_014",
	      "question": "文档里有没有提到如何使用 Python 原生类实现多线程的数据同步锁？",
	      "context_gold": "（文档主要讲解类定义、继承、动态特性，未涉及多线程或锁逻辑）",
	      "ground_truth": "文档未提及。",
	      "question_type": "边界抗扰",
	      "target_component": "Circuit Break",
	      "eval_logic": "多线程是类应用的高频场景，但文档中未提及。测试系统是否能坚守“严禁包含文档之外常识”的原则进行熔断。"
	    },
	    {
	      "id": "case_015",
	      "question": "如果我要写一个函数，既有普通的必选参数，又有带默认值的可选参数，还要返回一个字符串，你能结合文档给个正确的带注解的例子吗？",
	      "context_gold": "下面的示例具有加了标注的一个必需参数、一个可选参数以及返回值:\n\n    >>> def f(ham: str, eggs: str = 'eggs') -> str:\n    ...     print(\"Annotations:\", f.__annotations__)\n    ...     print(\"Arguments:\", ham, eggs)\n    ...     return ham + ' and ' + eggs",
	      "ground_truth": "示例代码：def f(ham: str, eggs: str = 'eggs') -> str: ... return ham + ' and ' + eggs。该函数包含必需参数 ham，带默认值的参数 eggs，并返回字符串。",
	      "question_type": "多跳推理",
	      "target_component": "Muti-hop Retrieval",
	      "eval_logic": "需要结合“函数注解”、“默认参数值”两个小节的内容，测试系统能否跨小节召回完整的代码示例和逻辑。"
	    }
	  ]
	  ```
- 如果 target_component 是 "ChunkSize" 的题目得分低：说明你的文本切分太碎了，或者重排后给 LLM 的上下文窗口太小。
- 如果 target_component 是 "Hybrid Search" 的题目得分低：说明你的向量检索和关键词检索的权重（RRF系数）分配不合理。
- 如果 target_component 是 "Circuit Break" 的题目得分低：说明你的系统“太自信”，阈值（Threshold）设得太低，导致它在胡说八道。