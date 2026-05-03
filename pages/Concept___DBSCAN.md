alias:: Density-Based Spatial Clustering of Applications with Noise, 密度聚类, DBSCAN, 大模型/RAG/文本聚类/算法/DBSCAN
type:: concept
domain:: [[MOC/机器学习]]
status:: growing
level:: 面试可讲
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- DBSCAN 是一种基于密度的聚类算法，不需要预先指定簇数量，可以把低密度区域的点标记为噪声。

- **解决的问题**
	- 不知道应该分成多少簇。
	- 希望识别噪声点或异常点。
	- 数据簇不是规则球形，而是可能存在不规则形状。

- **核心机制**
	- 设置半径 eps 和最小样本数 min_samples。
	- 如果一个点的 eps 邻域内样本数足够多，它就是核心点。
	- 从核心点出发，把密度相连的点扩展成同一个簇。
	- 不能被任何簇吸收的点标记为噪声。

- **和 KMeans 的区别**
	- KMeans 需要预先指定 K，DBSCAN 不需要指定簇数量。
	- KMeans 强行把所有点分到某个簇，DBSCAN 可以识别噪声点。
	- KMeans 适合近似球形簇，DBSCAN 能处理不规则形状。
	- KMeans 更适合大规模数据，DBSCAN 对参数和维度更敏感。

- **项目中怎么用**
	- 小规模探索性聚类、异常点识别、未知簇数量时可以尝试 DBSCAN。
	- 高维文本 embedding 中距离会变得不稳定，DBSCAN 通常不如 KMeans 稳。
	- RAG 文档聚类如果数据量大、追求稳定速度，通常优先 KMeans；如果样本少且想过滤噪声，可以考虑 DBSCAN。

- **面试表达**
	- KMeans 和 DBSCAN 有什么区别？ #card
		- KMeans 需要指定 K，速度快，适合大规模和近似球形簇；DBSCAN 基于密度，不需要指定簇数，可以识别噪声和不规则簇，但对 eps、min_samples 和高维距离很敏感。

- **常见误区**
	- 误区：DBSCAN 一定比 KMeans 智能。
		- 它只是适用假设不同，高维、大规模、密度不均时效果可能很差。
	- 误区：DBSCAN 不需要调参。
		- eps 和 min_samples 对结果影响很大。

- **相关概念**
	- [[Concept/无监督学习]]
	- [[Concept/聚类]]
	- [[Concept/KMeans]]
	- [[Concept/聚类评估]]
	- [[Concept/异常检测]]
	- [[Question/KMeans 和 DBSCAN 有什么区别]]

- **来源**
	- [[DBSCAN]]
	- [[Concept/聚类]]
	- [[Concept/KMeans]]
