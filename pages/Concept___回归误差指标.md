alias:: Regression Metrics, 回归评估指标, MAE, MSE, RMSE, 平均绝对误差, 均方误差, 均方根误差
type:: concept
domain:: [[MOC/机器学习]]
status:: growing
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- 回归误差指标衡量预测值和真实值之间差多少，常用 MAE、MSE、RMSE 从不同角度表达误差大小。

- **MAE**
	- $MAE = \frac{1}{n}\sum_{i=1}^{n} |y_i - \hat{y}_i|$
	- 平均绝对误差，单位和目标值一致。
	- 对异常值相对稳健，业务解释直观。

- **MSE**
	- $MSE = \frac{1}{n}\sum_{i=1}^{n} (y_i - \hat{y}_i)^2$
	- 均方误差，对大误差惩罚更重。
	- 单位是目标值单位的平方，业务解释不如 MAE 和 RMSE 直观。

- **RMSE**
	- $RMSE = \sqrt{\frac{1}{n}\sum_{i=1}^{n} (y_i - \hat{y}_i)^2}$
	- MSE 开方，单位回到目标值本身。
	- 保留对大误差的惩罚，同时比 MSE 更容易解释。

- **怎么选择**
	- 想要直观表达平均偏差，优先看 MAE。
	- 对大误差特别敏感，优先看 MSE 或 RMSE。
	- 给业务汇报时，通常 MAE 和 RMSE 更容易解释。
	- 指标选择要匹配业务损失函数，而不是只看数学定义。

- **面试表达**
	- MAE、MSE、RMSE 有什么区别？ #card
		- MAE 是绝对误差平均，直观且对异常值更稳；MSE 是平方误差平均，会强烈惩罚大误差；RMSE 是 MSE 开方，保留大误差惩罚且单位和原目标一致，更适合业务解释。

- **相关概念**
	- [[Concept/回归]]
	- [[Concept/模型评估]]
	- [[Concept/线性回归]]
	- [[Question/MAE、MSE、RMSE 有什么区别]]

- **来源**
	- [[平均绝对误差]]
	- [[均方误差]]
	- [[均方根误差]]
	- [[Concept/模型评估]]
