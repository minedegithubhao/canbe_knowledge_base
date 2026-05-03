alias:: Stochastic Gradient Descent, 随机梯度下降, SGD
type:: concept
domain:: [[MOC/机器学习]]
status:: growing
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- SGD 是每次用一个样本或小批量样本估计梯度并更新参数的优化方法。

- **核心机制**
	- 从训练数据中取一个样本或 mini-batch。
	- 计算当前 mini-batch 上的损失和梯度。
	- 按学习率沿梯度下降方向更新参数。
	- 重复多轮直到收敛或达到停止条件。

- **优点**
	- 实现简单。
	- 单次更新成本低。
	- 梯度噪声有时能帮助跳出差的局部区域。

- **缺点**
	- 更新方向噪声大，训练曲线可能震荡。
	- 学习率敏感。
	- 在狭长峡谷形损失曲面中收敛慢。

- **面试表达**
	- SGD 的特点是什么？ #card
		- SGD 用样本或小批量样本估计梯度，单步成本低但噪声大，可能震荡，需要合适学习率和学习率调度。

- **相关概念**
	- [[Concept/优化器]]
	- [[Concept/梯度下降]]
	- [[Concept/Momentum]]
	- [[Concept/Adam]]
	- [[Question/SGD、Momentum、Adam 有什么区别]]

- **来源**
	- [[机器学习]]
	- [[Concept/优化器]]
