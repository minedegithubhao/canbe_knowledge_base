alias:: GBDT XGBoost 区别, GBDT vs XGBoost
type:: question
domain:: [[MOC/机器学习]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- GBDT 和 XGBoost 有什么区别？

- **标准回答**
	- GBDT 是梯度提升决策树，核心是串行训练多棵树，每一轮拟合前一轮模型的残差或负梯度，让整体损失逐步下降。
	- XGBoost 可以看作对 GBDT 的增强版本。它在目标函数中加入正则化约束树复杂度，使用一阶和二阶梯度信息，支持列采样、缺失值默认方向、并行寻找分裂点和更成熟的工程优化。
	- 所以 XGBoost 通常比普通 GBDT 更稳、更快，也更容易控制过拟合，但最终效果仍取决于数据、特征和调参。

- **回答结构**
	- 先说 GBDT 是 Boosting 树模型。
	- 再说 XGBoost 是 GBDT 的增强实现。
	- 区别一：目标函数加正则化。
	- 区别二：使用二阶梯度。
	- 区别三：工程优化，如列采样、缺失值处理、并行。
	- 最后说项目上要看验证集效果。

- **项目追问**
	- XGBoost 还会过拟合吗？
		- 会。需要控制树深、学习率、树数量、采样比例、正则化，并使用验证集早停。
	- 为什么 XGBoost 不太需要特征缩放？
		- 它是树模型，按特征阈值切分，对单调缩放不敏感。

- **关联知识**
	- [[Concept/GBDT]]
	- [[Concept/XGBoost]]
	- [[Concept/集成学习]]
	- [[Concept/决策树]]
	- [[Concept/过拟合]]

- **我的易错点**
	- 不要只说“XGBoost 更快”。
	- 要讲正则化、二阶梯度、缺失值处理、并行优化和采样。

- **来源**
	- [[Concept/GBDT]]
	- [[Concept/XGBoost]]
	- [[串行集成]]
	- [[集成学习]]
