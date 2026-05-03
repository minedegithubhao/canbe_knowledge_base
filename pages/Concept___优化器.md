alias:: Optimizer, Optimization Algorithm, 参数优化器
type:: concept
domain:: [[MOC/机器学习]]
status:: growing
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- 优化器是根据损失函数和梯度更新模型参数的方法，决定参数如何一步步靠近更好的解。

- **解决的问题**
	- 如何根据梯度更新参数。
	- 如何控制学习率、收敛速度和震荡。
	- 如何在复杂损失曲面中更稳定训练。

- **常见优化器**
	- [[Concept/SGD]]
		- 基础随机梯度下降，简单、泛化常较好，但收敛可能慢且震荡。
	- [[Concept/Momentum]]
		- 在 SGD 基础上加入惯性，减少震荡，加速稳定方向上的收敛。
	- [[Concept/Adam]]
		- 自适应学习率优化器，结合一阶动量和二阶动量，训练神经网络常用。

- **项目中怎么用**
	- 简单模型先理解损失函数和学习率，再考虑优化器。
	- 神经网络常从 Adam 开始，效果稳定后再根据任务考虑 SGD 或学习率调度。
	- 优化器不能替代数据清洗、特征工程和正则化。

- **面试表达**
	- 优化器和梯度下降是什么关系？ #card
		- 梯度下降是一类用梯度更新参数的基本思想，优化器是在这个思想上定义具体更新策略，例如 SGD、Momentum 和 Adam。

- **相关概念**
	- [[Concept/梯度下降]]
	- [[Concept/损失函数]]
	- [[Concept/SGD]]
	- [[Concept/Momentum]]
	- [[Concept/Adam]]
	- [[Question/SGD、Momentum、Adam 有什么区别]]

- **来源**
	- [[机器学习]]
	- [[Concept/梯度下降]]
