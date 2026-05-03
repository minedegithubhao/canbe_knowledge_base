alias:: BatchNorm Dropout 区别, BN和Dropout作用
type:: question
domain:: [[MOC/机器学习]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- BatchNorm 和 Dropout 有什么作用？

- **标准回答**
	- BatchNorm 主要用于稳定训练。它对 mini-batch 的中间激活做标准化，再用可学习参数恢复表达能力，通常能加快收敛、缓解梯度不稳定，并带来一定正则化效果。Dropout 主要用于缓解过拟合。它在训练时随机丢弃部分神经元或连接，让模型不要过度依赖固定特征组合，类似训练多个子网络的集成。两者都可能提升泛化，但机制不同，训练和推理行为也不同。

- **回答结构**
	- BatchNorm：标准化中间激活，稳定训练。
	- Dropout：随机丢弃神经元，缓解过拟合。
	- 训练推理差异：BN 用不同统计量，Dropout 推理时关闭。
	- 使用取舍：小 batch 下 BN 要谨慎，Dropout 过大会欠拟合。

- **项目追问**
	- BatchNorm 训练和推理有什么不同？
		- 训练时使用当前 batch 的均值和方差，推理时通常使用训练阶段累计的移动均值和方差。
	- Dropout 为什么推理时要关闭？
		- 推理需要稳定输出，不能随机丢弃；训练时的随机性是为了正则化。

- **关联知识**
	- [[Concept/BatchNorm]]
	- [[Concept/Dropout]]
	- [[Concept/神经网络]]
	- [[Concept/正则化]]
	- [[Concept/过拟合]]
	- [[Concept/梯度消失]]
	- [[Concept/梯度爆炸]]

- **我的易错点**
	- 不要把 BatchNorm 只说成防过拟合，它更核心是稳定训练。
	- 要说明 Dropout 训练时开、推理时关。

- **来源**
	- [[Concept/BatchNorm]]
	- [[Concept/Dropout]]
	- [[Concept/正则化]]
