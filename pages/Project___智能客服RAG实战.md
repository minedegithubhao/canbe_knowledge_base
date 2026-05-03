alias:: 智能客服RAG实战, FAQ RAG, 电商客服RAG
type:: project
domain:: [[MOC/RAG]]
status:: active
created:: 2026-05-02
updated:: 2026-05-03

- **项目目标**
	- 面向电商客服 FAQ 构建 RAG 评估集和问答系统，让答案严格来自 FAQ，并能覆盖真实用户提问方式。

- **背景资料**
	- 原始项目笔记保留在 [[智能客服RAG实战]]。
	- FAQ 天然有问题、答案、类别和 ID。
	- 用户问题常见口语化、抱怨式、省略式表达。
	- 业务风险来自答错规则、编造不存在政策、错误拒答或漏答关键条件。

- **系统架构**
	- 数据层：FAQ、category、faq_id、标准答案。
	- 评估层：评估 case、source_faq_ids、reference_answer、key_points、forbidden_points、must_refuse。
	- 检索层：Query Rewriting、混合检索、FAQ metadata。
	- 排序层：Rerank 控制 Top K 证据纯度。
	- 生成层：基于 FAQ 回答，不支持时拒答。

- **核心流程**
	- 基于真实 FAQ 构造评估 case。
	- 用户问题经过 [[Concept/Query Rewriting]]，但不能引入 FAQ 中不存在的事实。
	- 用 [[Concept/混合检索]] 提升口语问题和精确业务词的召回稳定性。
	- 用 [[Concept/重排序]] 控制 Top K 证据纯度。
	- Prompt 要明确要求基于 FAQ 回答，不支持时拒答。

- **关键模块**
	- 评估集字段
		- source_faq_ids。
		- reference_answer。
		- key_points。
		- forbidden_points。
		- must_refuse。
		- expected_route_category。
	- 覆盖场景
		- 单 FAQ 语义等价。
		- 条件约束。
		- 类别混淆。
		- 否定约束。
		- 跨 FAQ 聚合。
		- 拒答类问题。

- **问题记录**
	- 编造政策：回答中出现 FAQ 不支持的业务规则。
	- 漏掉关键条件：答案看似正确，但没有覆盖 key_points。
	- 错误拒答：FAQ 能回答却拒答。
	- 类别混淆：召回或路由到了相近但错误的 FAQ 类别。

- **指标和验收**
	- FAQ 命中率：正确 FAQ 是否进入候选证据。
	- 关键点覆盖率：回答是否覆盖 key_points。
	- 禁止错误命中率：回答是否触发 forbidden_points。
	- 拒答准确率：must_refuse 样本是否正确拒答，非拒答样本是否避免误拒。
	- 类别路由准确率：问题是否进入正确 FAQ 类别。
	- 来源可追溯性：回答是否能回到 source_faq_ids。

- **经验沉淀**
	- 客服 RAG 的评估不能只看答案相似度，要看关键点和禁止错误点。
	- 评估 case 必须能追溯到真实 FAQ。
	- 拒答样本很重要，能防止模型凭常识编造。
	- FAQ 入库时要保留 faq_id、category、question、answer 和业务标签。

- **面试表达**
	- 智能客服 RAG 评估集怎么做？ #card
		- 我会基于真实 FAQ 生成或整理评估 case，每条 case 都保留 source_faq_ids、reference_answer、key_points、forbidden_points 和 must_refuse，覆盖单 FAQ、条件约束、类别混淆、否定约束、跨 FAQ 聚合和拒答场景。
	- 客服 RAG 最怕什么问题？ #card
		- 最怕编造政策、漏掉关键条件、错误拒答和类别混淆。因此评估集必须包含禁止错误点和拒答样本，生成阶段也要要求答案可追溯到 FAQ。
	- 为什么客服 RAG 要有拒答样本？ #card
		- 因为知识库不支持的问题必须拒答，否则模型会凭常识编造政策。拒答样本能专门评估系统是否守住业务边界。

- **项目追问**
	- [[Question/RAG 如何构造智能客服评估集]]
	- [[Question/RAG 项目如何做评估驱动优化]]
	- [[Review/RAG项目面试]]

- **相关概念**
	- [[Concept/RAG]]
	- [[Concept/Query Rewriting]]
	- [[Concept/混合检索]]
	- [[Concept/重排序]]
	- [[Concept/检索后过滤]]
	- [[Concept/RAGAS]]
	- [[Concept/PAGAS]]

- **来源**
	- [[智能客服RAG实战]]
