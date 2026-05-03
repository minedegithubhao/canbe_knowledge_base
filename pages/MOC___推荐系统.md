alias:: 推荐系统地图, 推荐学习路径, 推荐算法地图
type:: moc
status:: growing
updated:: 2026-05-03

- **这个地图解决什么问题**
	- 把推荐系统从零散的机器学习、向量检索和排序概念整理成一条可学习、可复习、可面试的主线。
	- 本页只做导航和学习顺序，具体解释放到 Concept 页面，复杂题放到 Question 页面，刷题入口放到 [[Review/推荐系统面试]]。

- **学习路径**
	- 总览
		- [[Concept/推荐系统]]
		- [[Concept/推荐召回]]
		- [[Concept/推荐排序]]
		- [[Concept/冷启动]]
	- 召回层
		- [[Concept/协同过滤]]
		- [[Concept/Embedding召回]]
		- [[Concept/双塔模型]]
		- [[Concept/向量]]
		- [[Concept/距离度量]]
		- [[Concept/向量库]]
	- 排序层
		- [[Concept/CTR预估]]
		- [[Concept/逻辑回归]]
		- [[Concept/XGBoost]]
		- [[Concept/模型评估]]
		- [[Concept/ROC-AUC]]
	- 工程和评估
		- [[Concept/数据集划分]]
		- [[Concept/数据泄漏]]
		- [[Concept/特征工程]]
		- [[Concept/模型上线]]
		- [[Concept/模型监控]]
		- [[Concept/A_B测试]]

- **面试重点**
	- [[Review/推荐系统面试]]
	- [[Question/推荐系统完整链路是什么]]
	- [[Question/召回和排序有什么区别]]
	- [[Question/协同过滤的核心思想是什么]]
	- [[Question/双塔模型为什么适合召回]]
	- [[Question/Embedding 召回怎么训练和评估]]
	- [[Question/CTR 预估为什么要用曝光日志]]
	- [[Question/推荐排序为什么离线 AUC 高线上不一定好]]
	- [[Question/推荐系统特征工程要注意什么]]
	- [[Question/推荐系统如何做 A_B 测试]]
	- [[Question/推荐系统冷启动怎么处理]]

- **旧页面迁移索引**
	- 已归档旧页面
	- 暂无需要归档的推荐系统第二批旧页；本批主要是在已有推荐系统主线中补强 Concept 和 Question。

- **最近更新**
	- 2026-05-03
		- 建立推荐系统主线，先整理召回、排序、协同过滤、Embedding 召回、双塔模型、CTR 预估和冷启动。
	- 2026-05-03
		- 恢复推荐系统第二批，补强 CTR 样本构造、Embedding 召回训练评估、排序离线线上差异、A/B 测试和推荐特征工程面试入口。
