alias:: Tensor,PyTorch Tensor, 张量
tags::
type:: 概念
status:: 草稿

	- ## 🧠 一句话说清楚（费曼）
		- Tensor 是[[深度学习]]的**核心数据载体**，所有大模型的输入、输出、模型参数都是 Tensor
			- PyTorch 里的高级数组，是大模型的核心数据格式，支持 GPU 加速和设备迁移
			- 能在 GPU 上加速计算（普通列表 / 数组只能在 CPU 跑）；
			- 支持自动求导（训练模型必备）；
			- 支持设备迁移支持 GPU 加速和设备迁移。
			- ```python
			  import torch
			  
			  # 0维张量（标量）
			  t0 = torch.tensor(5)
			  # 1维张量（向量，比如单个token的id）
			  t1 = torch.tensor([101, 2003, 102])
			  # 2维张量（矩阵，比如batch=2的输入id）
			  t2 = torch.tensor([[101, 2003, 102], [101, 3004, 102]])
			  
			  print(t2.shape)  # 输出 torch.Size([2, 3]) → 2行3列
			  ```
			- 1维张量就是[[向量]]
	- ## 💘企业开发场景
	  collapsed:: true
		- {{实际企业开发当中的场景，按常见度由高往低排序，低于10%的场景不记录}}
		- {{场景一： xxxxxxxx}}
		- {{企业实现：xxxxxxxx}}
	- ## 📝 面试题（自问自答）
	  collapsed:: true
		- {{问题一：XXX }}