alias:: HNSW旧笔记
type:: concept
status:: archived
updated:: 2026-05-03

- **迁移说明**
	- 本页面内容已整理到 [[Concept/HNSW]] 和 [[Question/HNSW 的核心思想是什么]]。
	- 后续请维护新页面；本页保留旧参数笔记。

- HNSW 和 IVF_FLAT 的对比已整理到 [[Question/IVF_FLAT 和 HNSW 有什么区别]]。
- 参数
	- ````
	  params={"M": 16, "efConstruction": 256}
	  ````
	- M=16 → 每个城市连 16 条高速，企业标准值：16
	- efConstruction = 256 → 建图越认真、路修得越好、**检索越准**，企业标准值：256
-
