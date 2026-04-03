alias:: KNN
tags::
type:: 概念
status:: 草稿

- 算法思想
  collapsed:: true
	- 样本的 k 个最相似的样本属于某一类别，该样本也属于这个类别
- API调用
  collapsed:: true
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