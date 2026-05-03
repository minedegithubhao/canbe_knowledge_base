alias:: Milvus旧笔记
type:: concept
status:: archived
updated:: 2026-05-03

- **迁移说明**
	- 本页面内容已整理到 [[Concept/Milvus]]、[[Concept/向量库]]、[[Concept/向量检索]]、[[Concept/HNSW]] 和 [[Concept/IVF_FLAT]]。
	- 相关面试题已整理到 [[Review/向量检索面试]]。
	- 原页面中的本地 file 图片引用没有迁移；后续如需保留图片，应放入 assets 后再引用。
	- 原页面中的示例连接地址和凭据已脱敏，避免发布到 GitHub Pages 时暴露环境信息。
	- 后续请维护新页面；本页保留旧代码和课程笔记。

- 数据模型
	- | 概念名称  | 核心定义 | 类比 SQL | 关键作用 / 特性 |
	  | ---- | ---- | ---- |
	  | **集合(Collection)**  | 向量数据与标量元数据的**逻辑分组**，是 Milvus 中数据管理的基本单位 | **表 (Table)** | 用于组织同一类业务数据，必须包含主键和向量字段 |
	  | **分区(Partition)** | 集合内部的**物理级逻辑划分**，将数据隔离存储 | **索引 / 分表** | 搜索时指定分区查询，**缩小搜索范围**，显著提升检索性能 |
	  | **实体(Entity)** | 被向量化的业务对象，是数据插入 / 查询的**最小单位** | **行 (Row)** | 包含主键、向量字段及各类标量元数据，对应一条完整数据 |
	  | **字段(Field)** | 数据的**最小组成单元** | **列 (Column)** | 定义数据类型，分为**主键字段**、**向量字段**、**标量字段**三类 |
	  | **主键字段(Primary Key) **| 用于**唯一标识**一个实体的字段 | **主键 (Primary Key)** | 必须唯一且非空，支持 INT64 或 VARCHAR 类型，用于定位单条数据 |
	  | **向量字段(Vector Field) **| 存储向量化后的文本 / 图像特征数据的字段 | - | 核心检索字段，支持**稠密向量 (FLOAT_VECTOR)** 或**稀疏向量 (SPARSE_FLOAT_VECTOR)** |
	  | **标量字段(Scalar Field) **| 存储元数据（如类别、时间戳、ID 等）的字段 | **普通列 (Column)** | 用于**过滤查询**，支持 INT32/64、FLOAT、BOOL、VARCHAR 等类型 |
	- 原笔记曾引用本地课程图片，因路径不可发布，已不保留图片引用。
- 向量相似度度量
	- [[欧氏距离]] (Euclidean Distance, L2)，Milvus 对应度量类型：`metric_type="L2"`
	- [[内积]] (Inner Product, IP)，Milvus 对应度量类型：`metric_type="COSINE"`
		- `metric_type="COSINE"`和`metric_type="IP"`的主要区别 #面试背诵汇总/重点 #card
- 检索算法
	- [[近似最近邻]]  (ANN)搜索
- 索引
	- 两种搜索方式：精确搜索和 [[ANN]] 近似搜索
	- **FLAT**， 精确搜索，100% 准确,暴力穷举，无压缩
	- **[[IVF_FLAT]]**，ANN 近似搜索，聚类 + 倒排文件，分桶检索。
	- **[[HNSW]]**，ANN 近似搜索，多层有向图（高速公路 + 普通公路）
	- **SPARSE_INVERTED_INDEX** ，ANN 近似搜索，稀疏向量专用倒排索引
	- | 索引类型 | 核心思想 | 搜索类型 | 核心特点 | 优点 | 缺点 | 适用场景 | 关键参数 |
	  | ---- | ---- | ---- |
	  | **FLAT** 精确搜索（100% 准确,暴力穷举，无压缩） | 本质是 Brute-force，查询向量与库中所有向量逐一计算距离 | 100% 召回率，无精度损失，无需训练 | 性能极差，计算量随数据量线性增长，百万级数据查询极慢 | 小数据集（几万以内）、对准确率有绝对要求的场景、作为其他索引的评估基准 | 无 |
	  | **[[IVF_FLAT]]**（ANN 近似搜索，聚类 + 倒排文件，分桶检索）| 先通过 k-means 将向量聚类成 nlist 个簇，查询时仅在最近的 nprobe 个簇内做精确搜索 | 性能与准确率平衡好，是经典 ANN 索引，支持海量数据 | 需训练聚类模型，nprobe 参数需调优，动态数据插入性能一般 | 亿级以上海量向量库、对召回率有要求的通用检索场景 | `nlist`（聚类数）、`nprobe`（查询簇数） |
	  | **[[HNSW]]**（ANN 近似搜索，多层有向图（高速公路 + 普通公路）） | 构建多层网络图，高层为快速跳转的 “高速路”，底层为精细检索的 “普通路” | 召回率极高、查询速度极快，支持动态数据，无需调参 | 构建索引慢、内存占用大，存储成本高 | RAG 文本检索、推荐系统等对性能和召回率要求高的企业级场景（Milvus 默认首选） | `M`（每层邻居数）、`efConstruction`（构建阶段探索数）、`efSearch`（查询阶段探索数） |
	  | **SPARSE_INVERTED_INDEX** （ANN 近似搜索，稀疏向量专用倒排索引）| 仅关注向量非零维度，基于倒排表快速匹配 | 专为稀疏向量优化，检索效率极高，内存占用小 | 仅适用于稀疏向量，不支持稠密向量 | 稀疏向量检索场景（如 BM25 关键词检索、高维稀疏特征） | 无 |
	-
- 选型速记
	- **通用 RAG 首选**：`HNSW` + `COSINE`（内积），兼顾召回率和速度，企业级标准方案
	- **超大规模数据**：`IVF_FLAT` + `COSINE`，平衡性能与存储
	- **小数据集 / 精度要求**：`FLAT`，100% 准确
	- **稀疏向量检索**：`SPARSE_INVERTED_INDEX`，专门适配稀疏场景
- 代码实战
	- 数据库连接与创建
		- ```python
		  from pymilvus import MilvusClient
		  # 连接数据库
		  client = MilvusClient(
		      uri="<milvus-endpoint>",
		    	db_name="milvus_demo"
		  )
		  # 查看所有数据库
		  databases = client.list_databases()
		  #创建名称为milvus_demo的数据库
		  if "milvus_demo" not in databases:
		      client.create_database(db_name="milvus_demo")
		      print("创建数据库成功")
		  else:
		      client.using_database(db_name="milvus_demo")
		      print("数据库已存在")
		  ```
	- Collections操作
		- ```python
		  # enhanced_milvus_example.py
		  import numpy as np
		  from pymilvus import MilvusClient, DataType
		  
		  # --- 1. 配置信息 ---
		  MILVUS_ENDPOINT = "<milvus-endpoint>"  # Milvus 服务器地址
		  COLLECTION_NAME = "chinese_movie"  # 集合名称
		  DIMENSION = 8  # 假设电影嵌入向量的维度为8
		  
		  # --- 2. 连接 Milvus ---
		  print("正在连接 Milvus...")
		  client = MilvusClient(uri=MILVUS_ENDPOINT,db_name="milvus_demo")  # 初始化 Milvus 客户端
		  print("Milvus 连接成功！")
		  
		  # --- 3. 清理并创建集合 ---
		  # 检查集合是否存在，若存在则删除，确保脚本可重复运行
		  if client.has_collection(collection_name=COLLECTION_NAME):
		      print(f"发现旧集合 '{COLLECTION_NAME}'，正在删除...")
		      client.drop_collection(collection_name=COLLECTION_NAME)
		  
		  # 定义集合的 Schema（数据结构）
		  print(f"正在定义集合 '{COLLECTION_NAME}' 的 Schema...")
		  schema = MilvusClient.create_schema(
		      auto_id=False,  # 不使用自动生成 ID
		      enable_dynamic_field=False  # 关闭动态字段，确保数据结构固定
		  )
		  
		  # 添加字段到 Schema
		  schema.add_field(field_name="id", datatype=DataType.INT64, is_primary=True)  # 主键：电影 ID
		  schema.add_field(field_name="title", datatype=DataType.VARCHAR, max_length=200)  # 电影标题
		  schema.add_field(field_name="release_year", datatype=DataType.INT32)  # 上映年份
		  schema.add_field(field_name="genre", datatype=DataType.VARCHAR, max_length=50)  # 电影类型
		  schema.add_field(field_name="duration_minutes", datatype=DataType.INT32)  # 电影时长（分钟）
		  schema.add_field(field_name="embedding", datatype=DataType.FLOAT_VECTOR, dim=DIMENSION)  # 嵌入向量
		  
		  # 定义索引参数
		  print("正在准备索引参数...")
		  index_params = client.prepare_index_params()
		  index_params.add_index(
		      field_name="embedding",  # 为嵌入向量字段创建索引
		      index_type="IVF_FLAT",  # 索引类型：倒排文件（适合小规模数据）
		      metric_type="IP",  # 距离度量：欧氏距离
		      params={"nlist": 128}  # 索引参数：聚类数量
		  )
		  
		  # 创建集合并应用索引
		  print("正在创建集合和索引...")
		  client.create_collection(
		      collection_name=COLLECTION_NAME,
		      schema=schema,
		      index_params=index_params
		  )
		  print("集合和索引创建成功！")
		  
		  # --- 4. 准备并插入数据 ---
		  print("\n--- 步骤 4: 准备并插入数据 ---")
		  movies_data = [
		      {"id": 1, "title": "霸王别姬", "release_year": 1993, "genre": "剧情", "duration_minutes": 171, "embedding": np.random.rand(DIMENSION).tolist()},
		      {"id": 2, "title": "卧虎藏龙", "release_year": 2000, "genre": "武侠", "duration_minutes": 120, "embedding": np.random.rand(DIMENSION).tolist()},
		      {"id": 3, "title": "英雄", "release_year": 2002, "genre": "武侠", "duration_minutes": 107, "embedding": np.random.rand(DIMENSION).tolist()},
		      {"id": 4, "title": "让子弹飞", "release_year": 2010, "genre": "动作", "duration_minutes": 132, "embedding": np.random.rand(DIMENSION).tolist()},
		      {"id": 5, "title": "疯狂的石头", "release_year": 2006, "genre": "喜剧", "duration_minutes": 98, "embedding": np.random.rand(DIMENSION).tolist()},
		      {"id": 6, "title": "流浪地球", "release_year": 2019, "genre": "科幻", "duration_minutes": 125, "embedding": np.random.rand(DIMENSION).tolist()},
		  ]
		  
		  # 插入数据到集合
		  res = client.insert(collection_name=COLLECTION_NAME, data=movies_data)
		  print(f"成功插入 {res['insert_count']} 条数据。")
		  
		  # --- 5. 加载集合并执行搜索 ---
		  print("\n--- 步骤 5: 加载集合并执行搜索 ---")
		  client.load_collection(collection_name=COLLECTION_NAME)  # 加载集合到内存
		  print("集合已加载到内存，准备搜索！")
		  
		  # 假设我们想找和《英雄》风格类似的电影
		  query_vector = movies_data[2]["embedding"]
		  print(f"\n查询目标: 和 '{movies_data[2]['title']}' 风格类似的电影")
		  
		  # **案例一：纯向量搜索**
		  print("\n【案例一: 纯向量搜索】")
		  results_pure = client.search(
		      collection_name=COLLECTION_NAME,
		      data=[query_vector],  # 查询向量
		      limit=3,  # 返回前3个结果
		      output_fields=["title", "release_year", "genre"]  # 返回的字段
		  )
		  print("搜索结果:")
		  for hit in results_pure[0]:
		      entity = hit['entity']
		      print(f" - 标题: {entity['title']}, 类型: {entity['genre']}, 上映年份: {entity['release_year']}, 距离: {hit['distance']:.4f}")
		  
		  # **案例二：带过滤条件的混合搜索**
		  # 需求：寻找和《英雄》风格类似，但必须是2005年以后上映的电影
		  print("\n【案例二: 向量搜索 + 过滤 (上映年份 > 2005)】")
		  filter_expression = "release_year > 2005"  # 过滤条件
		  results_filtered = client.search(
		      collection_name=COLLECTION_NAME,
		      data=[query_vector],
		      limit=3,
		      filter=filter_expression,  # 应用过滤器
		      output_fields=["title", "release_year", "genre"]
		  )
		  print(f"应用过滤器: '{filter_expression}'")
		  print("搜索结果:")
		  if not results_filtered[0]:
		      print(" - 未找到符合条件的电影。")
		  else:
		      for hit in results_filtered[0]:
		          entity = hit['entity']
		          print(f" - 标题: {entity['title']}, 类型: {entity['genre']}, 上映年份: {entity['release_year']}, 距离: {hit['distance']:.4f}")
		  
		  # --- 6. 清理 ---
		  print("\n--- 演示结束，清理环境 ---")
		  client.drop_collection(collection_name=COLLECTION_NAME)  # 删除集合
		  print("集合已删除。")
		  ```
