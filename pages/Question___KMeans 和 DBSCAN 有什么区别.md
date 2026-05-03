alias:: KMeans DBSCAN 区别, KMeans vs DBSCAN
type:: question
domain:: [[MOC/机器学习]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- KMeans 和 DBSCAN 有什么区别？

- **标准回答**
	- KMeans 是基于中心点的聚类算法，需要预先指定 K，速度快，适合大规模、簇形状接近球形、数据尺度比较均衡的场景；它会把每个样本都分到某个簇，对异常值敏感。DBSCAN 是基于密度的聚类算法，不需要指定簇数量，可以识别噪声点和不规则形状的簇，但对 eps、min_samples 参数敏感，高维数据和密度不均数据效果可能不好。

- **回答结构**
	- 是否需要指定簇数：KMeans 需要，DBSCAN 不需要。
	- 聚类依据：中心点距离 vs 密度连通。
	- 噪声处理：KMeans 强行归类，DBSCAN 可标记噪声。
	- 簇形状：KMeans 适合球形，DBSCAN 支持不规则形状。
	- 工程选择：KMeans 更快更稳，DBSCAN 更适合小规模探索和噪声识别。

- **项目追问**
	- RAG 文档聚类更常用哪个？
		- 通常优先 KMeans，因为文档量可能较大，速度和稳定性更重要；DBSCAN 更适合小规模、未知簇数、需要过滤噪声的探索场景。
	- DBSCAN 为什么不适合高维 embedding？
		- 高维空间中距离区分度下降，密度估计不稳定，eps 很难选。

- **关联知识**
	- [[Concept/KMeans]]
	- [[Concept/DBSCAN]]
	- [[Concept/聚类]]
	- [[Concept/聚类评估]]
	- [[Concept/距离度量]]

- **我的易错点**
	- 不要说 DBSCAN 一定更高级。
	- 要讲参数敏感和高维距离问题。

- **来源**
	- [[DBSCAN]]
	- [[Concept/KMeans]]
	- [[Concept/DBSCAN]]
