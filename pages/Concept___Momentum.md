alias:: Momentum, 动量法, SGD with Momentum
type:: concept
domain:: [[MOC/机器学习]]
status:: growing
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- Momentum 是在梯度更新中加入历史方向的惯性，让参数在稳定方向上更快前进、在震荡方向上更平滑。

- **核心理解**
	- 普通 SGD 只看当前梯度。
	- Momentum 会累计过去梯度的方向。
	- 如果多个 batch 的梯度方向一致，更新会加速。
	- 如果某些方向来回震荡，动量会平滑这种震荡。

- **解决的问题**
	- SGD 更新噪声大。
	- 狭长损失曲面中收敛慢。
	- 学习过程容易来回摆动。

- **项目中怎么用**
	- 常用于神经网络训练。
	- 需要和学习率一起调。
	- 动量太大时也可能越过较优区域。

- **面试表达**
	- Momentum 相比 SGD 改进了什么？ #card
		- Momentum 引入历史梯度方向，相当于给参数更新加惯性，在稳定下降方向上加速，在来回震荡方向上平滑更新。

- **相关概念**
	- [[Concept/优化器]]
	- [[Concept/SGD]]
	- [[Concept/Adam]]
	- [[Concept/梯度下降]]
	- [[Question/SGD、Momentum、Adam 有什么区别]]

- **来源**
	- [[机器学习]]
	- [[Concept/优化器]]
