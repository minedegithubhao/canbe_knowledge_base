alias:: Bagging Boosting 区别, 并行集成和串行集成区别
type:: question
domain:: [[MOC/机器学习]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Bagging 和 Boosting 有什么区别？

- **标准回答**
	- Bagging 是并行集成，多个模型相互独立训练，再投票或平均，核心作用是降低方差，典型代表是随机森林。
	- Boosting 是串行集成，后一个模型重点修正前面模型的错误，多个弱模型逐步叠加成强模型，核心作用是降低偏差，典型代表是 AdaBoost、GBDT、XGBoost。
	- 简单说，Bagging 是并行训练、减少不稳定；Boosting 是串行修错、逐步变强。

- **回答结构**
	- 训练方式：并行 vs 串行。
	- 关注问题：降方差 vs 降偏差。
	- 样本关系：独立采样 vs 关注前一轮错误。
	- 代表算法：随机森林 vs GBDT/XGBoost。
	- 项目取舍：稳定性 vs 效果和调参复杂度。

- **项目追问**
	- 为什么 Boosting 更容易过拟合？
		- 它不断拟合前一轮错误，如果树太深、学习率过大或迭代太多，可能把噪声也拟合进去。
	- Stacking 和它们有什么区别？
		- Stacking 是训练多个基模型，再用二层模型学习如何组合它们的输出。

- **关联知识**
	- [[Concept/集成学习]]
	- [[Concept/随机森林]]
	- [[Concept/GBDT]]
	- [[Concept/XGBoost]]

- **我的易错点**
	- 不要把 Bagging 和 Boosting 都说成“多模型投票”。
	- 要明确并行/串行、方差/偏差、代表算法。

- **来源**
	- [[Concept/集成学习]]
	- [[并行集成]]
	- [[串行集成]]
	- [[堆叠集成]]
