alias:: KNN
type:: concept
status:: archived

- **迁移说明**
	- 本页面内容已整理到 [[Concept/KNN]] 和 [[Question/KNN 为什么需要特征缩放]]。
	- 后续请维护新页面；本页仅保留旧笔记和反向链接。

- 算法思想
	- 样本的 k 个最相似的样本属于某一类别，该样本也属于这个类别
- API调用
	- K近邻回归API
		- ```python
		  # 创建模型
		  model = KNeighborsRegressor(n_neighbors=3)
		  # 训练
		  model.fit(X_train, y_train)
		  ```
	- K近邻分类API
		- ```python
		  # 创建模型对象
		  estimator = KNeighborsClassifier(n_neighbors=3)
		  # 训练模型
		  estimator.fit(x_train, y_train) 
		  # 模型预测
		  y_pre = estimator.predict(x_test)
		  ```
