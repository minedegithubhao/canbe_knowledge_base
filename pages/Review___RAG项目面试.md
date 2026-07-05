alias:: RAG项目面试, RAG项目刷题, RAG项目复盘
type:: review
domain:: [[MOC/RAG]]
status:: active
updated:: 2026-05-26

- **怎么刷**
	- 第一轮只练“项目总览”：能在 2 分钟内讲清楚做过哪些 RAG 项目，各自解决什么问题。
	- 第二轮按项目练“问题、定位、方案、指标、取舍”五段式表达。
	- 第三轮刷复杂追问：评估驱动优化、拒答、熔断、检索污染、重写漂移、图文证据融合。
	- 每个项目都要能回到相关 Concept，避免只背项目故事。

- **项目总览**
	- 你做过哪些 RAG 项目？ #card
		- 可以按复杂度讲：先用 [[Project/简易RAG系统]] 跑通加载、切分、embedding、向量库、检索、生成和评估；再用 [[Project/手册类RAG实战]] 做评估驱动优化；再用 [[Project/智能客服RAG实战]] 做 FAQ 评估集和业务约束；最后用 [[Project/小说RAG实战]] 和 [[Project/图文知识库]] 处理长文本、图文和多模态问题。
	- RAG 项目面试怎么讲才不像背概念？ #card
		- 先讲业务场景，再讲遇到的具体问题，然后说如何用日志和评估定位，再讲采取的技术方案，最后讲指标变化、负面影响和取舍。
	- RAG 项目中最能体现工程能力的点是什么？ #card
		- 不是会调用向量库，而是能定位答案错误来自清洗、切分、召回、融合、Rerank、Prompt 还是模型，并能用评估集验证每次改动的收益和副作用。

- **项目讲法**
	- 简易 RAG 系统怎么讲？ #card
		- 这是最小闭环项目，重点是把文档加载、切分、embedding、向量库、检索、Prompt、生成和评估串起来。它适合说明我理解 RAG 全流程，但还不是生产级系统。
	- 手册类 RAG 项目怎么讲？ #card
		- 重点讲评估驱动优化：召回率高但准确率低时先看检索日志，引入 Rerank 控制上下文纯度，再调整 chunk size、metadata/self-query、Top K 和阈值。
	- 智能客服 RAG 项目怎么讲？ #card
		- 重点讲评估集和业务约束：每条 case 要能追溯到 FAQ，包含 key_points、forbidden_points、must_refuse，生成阶段必须基于 FAQ，不能编造政策。
	- 小说 RAG 项目怎么讲？ #card
		- 重点讲长文本和时序：小说不是只因为文本长，还因为角色关系、剧情阶段、专有名词和描写噪声，需要章节 metadata、摘要索引、混合检索、Rerank 和必要的角色档案。
	- 图文知识库项目怎么讲？ #card
		- 重点讲图文证据融合：图中的信息可能不在正文里，所以要处理 OCR、caption、图片 metadata、文本检索、图片检索和融合重排，回答时保留来源。

- **复杂追问**
	- [[Question/RAG 项目如何做评估驱动优化]]
	- [[Question/检索后过滤如何降低幻觉]]
	- [[Question/图文知识库 RAG 项目怎么讲]]
	- [[Question/小说 RAG 为什么会出现检索污染和重写漂移]]
	- [[Question/简易 RAG 系统如何升级为生产可用]]
	- [[Question/RAG 如何讲手册类 RAG 项目]]
	- [[Question/RAG 如何构造智能客服评估集]]
	- [[Question/长篇小说 RAG 和普通文档 RAG 有什么不同]]

- **项目易错点**
	- 项目讲法只讲用了向量库，为什么不够？ #card
		- 因为向量库只是召回基础设施。项目面试更看重如何定义评估集、如何定位错误、如何在切分、召回、融合、Rerank、Prompt 和拒答之间做取舍。
	- 为什么不能只报一个最终准确率？ #card
		- RAG 错误可能发生在检索或生成不同阶段。只报最终准确率无法解释问题来源，应该同时看证据命中、Top K 纯度、关键点覆盖、真实性、拒答准确率和来源可追溯性。
	- 项目优化为什么要讲副作用？ #card
		- 因为 RAG 参数经常互相牵制。提高 Top K 可能提升召回但增加噪声，提高 Rerank 阈值可能提升纯度但误删必要证据，增大 chunk 可能保留语义但稀释关键词。

- **项目入口**
	- [[Project/简易RAG系统]]
	- [[Project/手册类RAG实战]]
	- [[Project/智能客服RAG实战]]
	- [[Project/小说RAG实战]]
	- [[Project/图文知识库]]

- **关联概念**
	- [[Concept/RAG]]
	- [[Concept/文档清洗]]
	- [[Concept/文档切分]]
	- [[Concept/混合检索]]
	- [[Concept/重排序]]
	- [[Concept/检索后过滤]]
	- [[Concept/Query Rewriting]]
	- [[Concept/RAGAS]]
	- [[Concept/PAGAS]]
