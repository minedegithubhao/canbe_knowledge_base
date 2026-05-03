alias:: 客服RAG评估集, FAQ RAG评估集
type:: question
domain:: [[MOC/RAG]]
difficulty:: 中等
status:: practicing
created:: 2026-05-02
updated:: 2026-05-02

- **题目**
	- 智能客服 RAG 的评估集应该怎么构造？

- **标准回答**
	- 智能客服 RAG 的评估集必须来自真实 FAQ 或真实业务规则，不能让模型编造业务事实。每个 case 都要能回溯到 source_faq_ids，并包含 reference_answer、key_points、forbidden_points 和 must_refuse。评估集要覆盖真实用户问法，比如口语化、抱怨式、省略式，同时覆盖单 FAQ、条件约束、类别混淆、否定约束、跨 FAQ 聚合和拒答问题。
	- 这样设计的目的，是同时检查召回是否命中正确 FAQ、生成是否覆盖关键业务点、是否说出了禁止错误点，以及知识库无法支持时能否拒答。

- **回答结构**
	- 来源：只基于真实 FAQ，不引入不存在的事实。
	- 字段：source_faq_ids、reference_answer、key_points、forbidden_points、must_refuse。
	- 覆盖：单 FAQ、条件约束、类别混淆、否定约束、跨 FAQ 聚合、拒答。
	- 评估：检索命中、关键点覆盖、错误断言、拒答准确性。

- **项目追问**
	- 为什么要有 forbidden_points？
		- 客服场景最怕编造政策或说错业务条件，禁止点能专门评估这类风险。
	- 为什么要有 must_refuse？
		- 知识库不支持的问题应该拒答，否则会让模型凭常识编造。
	- 为什么要保留 source_faq_ids？
		- 方便追溯评估样本、检查召回是否命中正确 FAQ，也方便人工复核。

- **关联知识**
	- [[Project/智能客服RAG实战]]
	- [[Concept/RAGAS]]
	- [[Concept/PAGAS]]
	- [[Concept/Query Rewriting]]
	- [[Concept/混合检索]]

- **我的易错点**
	- 不要只生成“标准问法”，要覆盖真实用户表达。
	- 不要让评估集引入 FAQ 之外的业务事实。
	- 不要只看答案相似度，要检查关键点和禁止错误点。

- **来源**
	- [[Project/智能客服RAG实战]]
	- [[智能客服RAG实战]]
