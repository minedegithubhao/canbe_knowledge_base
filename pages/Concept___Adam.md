alias:: Adam Optimizer, Adaptive Moment Estimation, Adam
type:: concept
domain:: [[MOC/机器学习]]
status:: growing
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- Adam 是一种自适应学习率优化器，结合梯度的一阶动量和二阶动量，为不同参数自动调整更新步长。

- **核心理解**
	- 一阶动量
		- 类似 Momentum，记录梯度方向的移动平均。
	- 二阶动量
		- 记录梯度平方的移动平均，用来估计不同参数梯度尺度。
	- 自适应学习率
		- 对不同参数使用不同的有效步长。

- **优点**
	- 收敛通常快。
	- 对学习率相对不那么敏感。
	- 稀疏特征和神经网络训练中常用。

- **注意点**
	- Adam 方便但不是所有任务都最优。
	- 有些场景 SGD 加动量在最终泛化上可能更好。
	- 仍然需要学习率、权重衰减和早停等配合。

- **面试表达**
	- Adam 为什么常用？ #card
		- Adam 结合一阶动量和二阶动量，可以为不同参数自适应调整学习率，通常收敛快、调参成本低，所以神经网络训练中常作为默认起点。

- **相关概念**
	- [[Concept/优化器]]
	- [[Concept/SGD]]
	- [[Concept/Momentum]]
	- [[Concept/梯度下降]]
	- [[Question/SGD、Momentum、Adam 有什么区别]]

- **来源**
	- [[机器学习]]
	- [[Concept/优化器]]
