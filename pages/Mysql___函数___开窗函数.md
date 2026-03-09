- 基本语法
	- ```text
	  基本语法：<ranking function> OVER (ORDER BY 列名, ...)
	  OVER(...)的作用就是设置每一行数据关联的一组数据范围，OVER()时，每行关联的数据范围都是整张表的数据。
	  <window function>表示使用的窗口函数，窗口函数可以使用之前已经学过的聚合函数，比如COUNT、SUM、AVG、MAX、MIN等，也可以ROW_NUMBER、RANK、DENSE_RANK等，后面会依次介绍。
	  
	  常用排序函数:
	  
	  **RANK()**：产生的排名序号 ，有并列的情况出现时序号不连续
	  **DENSE_RANK()** ：产生的排序序号是连续的，有并列的情况出现时序号会重复
	  **ROW_NUMBER()** ：返回连续唯一的行号，排名序号不会重复
	  
	  其他函数:
	  
	  **NTILE(X)**：将每个分区的数据均匀的分成X组，返回每行对应的组号
	  **LAG(字段, [N], [M])**：返回分区中当前行前第N行的指定字段的内容，如果没有，默认返回M
	  ```
- 开窗函数：
	- ```text
	  #----------------------------------案例1:窗口函数(M有SQL8.X新特性)---------------------------------
	  /*
	  窗口函数解释：
	      概述： 它是MySQL8.x的新特性， 主要用于给表新增一列，至于新增的是什么，取决于你用什么窗口函数
	      格式:
	           窗口函数 over([partition by 分组字段 order by  排序字段 asc | desc] )
	      常用的窗口函数:
	      row_number():         行号编辑, 即: 1,2,3,4...
	      rank():               做稀疏排名的. 1,2,2,4
	      dense_rank():         做密集排名的, 1,2,2,3
	      细节: 
	      1. 窗口函数= 给表新增1列, 至于新增的是什么,取决于和什么函数一起用
	      2. 如果不写partition by , 则统计的是全表的数据，如果写了，则统计的是组内数据
	      3. 如果不写order by, 则统计的是组内所有数据, 如果写了，则统计的是组内从第一行，截至到当前行的数据。
	      4. 如果感兴趣，你可以尝试一下其他窗口函数结合over()一起用
	         例如: count(), max(), min(),sum(),avg(),ntile(n),lag(),lead(),first_value(),last_value()
	         
	     总结：关于窗口函数, 我只希望大家掌握两点
	     1. 分组排名
	     2. 分组排名求TopN
	  */
	  ```
	- ```text
	  开窗函数控制范围: rows between
	                      - x preceding:往前x行
	                      - x following:往后x行
	                      - current row:当前行
	                      - unbounded: 起点
	                      - unbounded preceding :表示从前面的起点  第一行
	                      - unbounded following :表示到后面的终点  最后一行    
	                      
	                      默认第一行到当前行: unbounded preceding and current row
	  ```
	- ```sql
	  CREATE TABLE `students` (
	    `ID` int(11) NOT NULL AUTO_INCREMENT,
	    `Name` varchar(24) NOT NULL,
	    `Gender` varchar(8) NOT NULL,
	    `Score` decimal(5,2) NOT NULL,
	    PRIMARY KEY (`ID`)
	  ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8
	  
	  INSERT INTO bookstore.students (Name,Gender,Score) VALUES
	  	 ('smart','Male',90.00),
	  	 ('linda','Female',81.00),
	  	 ('lucy','Female',83.00),
	  	 ('david','Male',94.00),
	  	 ('Tom','Male',92.00),
	  	 ('Jack','Male',88.00);
	  
	  -- bookstore.tb_score definition
	  
	  CREATE TABLE `tb_score` (
	    `name` varchar(24) NOT NULL,
	    `course` varchar(24) NOT NULL,
	    `score` decimal(5,2) NOT NULL
	  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	  
	  INSERT INTO bookstore.tb_score (name,course,score) VALUES
	  	 ('张三','语文',81.00),
	  	 ('张三','数学',75.00),
	  	 ('李四','语文',76.00),
	  	 ('李四','数学',90.00),
	  	 ('王五','语文',81.00),
	  	 ('王五','数学',100.00);
	  
	  
	  -- 窗口函数的作用是在处理每行数据时，针对每一行关联的一组数据进行处理。
	  
	  -- 基础语法：<window function> OVER(...)
	  -- <window function> 表示使用的窗口函数，窗口函数可以使用之前已经学过的聚合函数，比如COUNT()、SUM()、AVG()等，也可以是其他函数，比如 ranking 排序函数等，后面的课程中会介绍
	  -- OVER(...)的作用就是设置每行数据关联的窗口数据范围，OVER()时，每行关联的数据范围都是整张表的数据。
	  SELECT
	  id,
	  name,
	  gender,
	  score,
	  -- OVER()：表示每行关联的窗口数据范围都是整张表的数据
	  -- AVG(Score)：表示处理每行数据时，应用 AVG 对每行关联的窗口数据中的 Score 求平均
	  AVG(score) OVER () AS `AVG_Score`
	  FROM
	  students;
	  
	  # 需求：计算每个学生的 Score 分数和所有学生整体平均分的差值。
	  # 查询结果字段：
	  #   ID、Name、Gender、Score、AVG_Score(学生整体平均分)、difference(每位学生分数和整体平均分的差值)
	  SELECT *,
	  AVG(score) OVER ()         AS avg_score,
	  score - AVG(score) OVER () AS diff
	  FROM
	  students;
	  
	  # 需求：计算每个学生的Score分数占所有学生分数之和的百分比
	  # 查询结果字段：
	  #   ID、Name、Gender、Score、sum(所有学生分数之和)、ratio(每位学生分数占所有学生分数之和的百分比)
	  SELECT *,
	  SUM(score) OVER () AS sum_score,
	  score / SUM(score) OVER () * 100
	  FROM
	  students;
	  
	  -- 基本语法：<window function> OVER(PARTITION BY 列名, ...)
	  -- PARTITION BY 列名, ...的作用是按照指定的列对整张表的数据进行分区
	  -- 分区之后，在处理每行数据时，<window function>是作用在该行数据关联的分区上，不再是整张表上
	  SELECT
	  id,
	  name,
	  gender,
	  score,
	  -- PARTITION BY Gender：按性别对所有数据进行分区，此处会分成2个区
	  -- AVG(Score)：对每个分区的数据求平均值
	  AVG(score) OVER (PARTITION BY gender) AS `Avg`
	  FROM
	  students;
	  
	  -- 需求：计算每个学生的 Score 分数和同性别学生平均分的差值
	  -- 查询结果字段：
	  --  ID、Name、Gender、Score、Avg(同性别学生的平均分)、difference(每位学生分数和同性别学生平均分的差值)
	  SELECT *,
	  AVG(score) OVER (PARTITION BY gender)         AS gender_score,
	  score - AVG(score) OVER (PARTITION BY gender) AS diff
	  FROM
	  students;
	  
	  -- 需求：计算每人各科分数与对应科目最高分的占比
	  -- 查询结果字段：
	  --  name、course、score、max(对应科目最高分数)、ratio(每人各科分数与对应科目最高分的占比)
	  SELECT *,
	  MAX(score) OVER (PARTITION BY course) AS max_score,
	  score / MAX(score) OVER (PARTITION BY course) * 100 as ratio
	  FROM
	  tb_score;
	  
	  -- 补充：PARTITION BY 和 GROUP BY的区别
	  -- 使用场景不同
	  -- PARTITION BY用在窗口函数中，结果是：一进一出
	  -- GROUP BY用在分组聚合中，结果是：多进一出
	  -- 分组聚合：统计每个科目的最高分
	  SELECT
	  course,
	  MAX(score) AS `max`
	  FROM
	  tb_score
	  GROUP BY
	  course;
	  
	  -- 窗口函数：查询每行数据时，都对这行所属科目求了一个最高分
	  SELECT
	  name,
	  course,
	  score,
	  MAX(score) OVER (PARTITION BY course) AS `max`
	  FROM
	  tb_score;
	  
	  -- 基本语法：<ranking function> OVER (ORDER BY 列名, ...)
	  -- OVER() 中可以指定 ORDER BY 按照指定列对每一行关联的分区数据进行排序，然后使用排序函数对分区内的每行数据产生一个排名序号
	  SELECT
	  name,
	  course,
	  score,
	  -- 此处 OVER() 中没有 PARTITION BY，所以整张表就是一个分区
	  -- ORDER BY score DESC：按照 score 对每个分区内的数据降序排序
	  -- RANK() 窗口函数的作用是对每个分区内的每一行产生一个排名序号
	  RANK() OVER (ORDER BY score DESC) AS `rank`
	  FROM
	  tb_score;
	  
	  
	  -- 排名函数
	  -- RANK()：产生的排名序号 ，有并列的情况出现时序号不连续
	  -- DENSE_RANK() ：产生的排序序号是连续的，有并列的情况出现时序号会重复
	  -- ROW_NUMBER() ：返回连续唯一的行号，排名序号不会重复
	  
	  
	  -- PARTITION BY和排序函数配合
	  
	  -- 示例1：
	  -- 需求：按照不同科目，对学生的分数从高到低进行排名(要求：连续可重复)
	  -- 查询结果字段：
	  --  name、course、score、dense_rank(排名序号)
	  SELECT *,
	  DENSE_RANK() OVER (PARTITION BY course ORDER BY score DESC) as dr
	  FROM
	  tb_score;
	  
	  -- 示例2
	  -- 需求：获取每个科目，排名第二的学生信息
	  -- 查询结果字段：
	  --  name、course、score
	  SELECT *
	  FROM
	      (SELECT *,
	      DENSE_RANK() OVER (PARTITION BY course ORDER BY score DESC) AS dr
	      FROM tb_score) t
	  WHERE
	  dr = 2;
	  
	  -- CTE(公用表表达式)
	  -- CTE(公用表表达式)：Common Table Expresssion，类似于子查询，相当于一张临时表，可以在 CTE 结果的基础上，进行进一步的查询操作。
	  -- 基础语法
	  /*
	  WITH tmp1 AS (
	  -- 查询语句
	  ), tmp2 AS (
	  -- 查询语句
	  ), tmp3 AS (
	  -- 查询语句
	  )
	  SELECT
	  字段名
	  FROM 表名;
	  */
	  
	  -- 示例1
	  -- 需求：获取每个科目，排名第二的学生信息
	  -- 查询结果字段：
	  --  name、course、score
	  WITH
	  temp AS (SELECT *,
	  DENSE_RANK() OVER (PARTITION BY course ORDER BY score DESC) AS dr
	  FROM tb_score
	  )
	  
	  SELECT *
	  FROM
	  temp
	  WHERE
	  dr = 2;
	  
	  
	  -- NTILE(X)窗口函数：将每个分区的数据均匀的分成X组，返回每行对应的组号
	  
	  -- 示例1：将所有的拍卖信息按照浏览次数排序，并均匀分成4组，添加组号
	  -- 查询结果字段：
	  --  id、views(浏览次数)、quartile(分组序号)
	  -- 数据准备
	  CREATE TABLE `auction` (
	  `id` int(11) NOT NULL,
	  `category_id` int(11) DEFAULT NULL,
	  `asking_price` decimal(10,2) DEFAULT NULL,
	  `final_price` decimal(10,2) DEFAULT NULL,
	  `views` int(11) DEFAULT NULL,
	  `participants` int(11) DEFAULT NULL,
	  `country` varchar(50) DEFAULT NULL,
	  `ended` date DEFAULT NULL,
	  PRIMARY KEY (`id`) USING BTREE
	  ) ;
	  
	  
	  INSERT INTO `auction` VALUES (1,1,190.07,219.66,93,16,'Spain','2017-01-05'),(2,4,34.70,54.70,187,31,'Spain','2017-01-05'),
	        (3,5,124.85,155.95,237,59,'Spain','2017-01-05'),(4,3,141.42,205.73,289,58,'Spain','2017-01-06'),
	        (5,2,31.11,66.45,165,83,'Spain','2017-01-09'),(6,3,106.18,125.07,27,3,'Spain','2017-01-06'),
	        (7,2,124.83,150.93,266,53,'Spain','2017-01-06'),(8,1,151.71,164.54,158,53,'Spain','2017-01-08'),
	        (9,4,51.44,87.02,235,59,'France','2017-01-05'),(10,2,118.97,178.21,191,38,'France','2017-01-05'),
	        (11,5,38.50,69.61,44,7,'France','2017-01-06'),(12,4,20.87,35.57,298,37,'France','2017-01-08'),
	        (13,2,56.45,112.42,267,45,'Germany','2017-01-05'),(14,3,189.20,242.16,234,33,'Germany','2017-01-06'),
	             (15,2,43.15,88.01,92,12,'Germany','2017-01-06'),(16,5,158.92,179.18,17,2,'Germany','2017-01-06'),
	             (17,1,64.55,129.46,155,78,'UK','2017-01-05'),(18,4,196.07,237.86,63,21,'UK','2017-01-05'),
	               (19,2,171.26,190.57,194,39,'UK','2017-01-06'),(20,3,157.81,206.63,218,31,'Italy','2017-01-05'),
	               (21,2,135.16,197.43,47,12,'Italy','2017-01-07'),(22,4,172.98,197.07,297,42,'Italy','2017-01-06'),
	               (23,5,163.89,218.99,90,18,'Italy','2017-01-09'),(24,3,115.76,137.49,136,19,'Italy','2017-01-06'),
	               (25,3,149.89,208.09,25,3,'Italy','2017-01-07');
	  
	  
	  -- 查询
	  SELECT
	  id,
	  views,
	  -- 按照浏览量降序，然后把分区数据划分为4组，产生每一行对应的组序号
	  NTILE(4) OVER (ORDER BY views DESC) AS `quartile`
	  FROM
	  auction;
	  
	  
	  -- 示例2：获取浏览次数前四份之一的拍卖信息。
	  -- 查询结果字段
	  --  id、views(浏览次数)
	  WITH
	  temp AS (
	  SELECT
	  id,
	  views,
	  -- 按照浏览量降序，然后把分区数据划分为4组，产生每一行对应的组序号
	  NTILE(4) OVER (ORDER BY views DESC) AS `quartile`
	  FROM
	  auction
	  )
	  SELECT id,views
	  FROM
	  temp
	  WHERE
	  quartile = 1;
	  
	  -- LAG(字段, [N], [M])：返回分区中当前行前第N行的指定字段的内容，如果没有，默认返回M
	  -- 注意：M和N可以省略，N默认为1，M默认为NULL。
	  SELECT *,
	  -- 等效于：LAG(sales) OVER(ORDER BY month) AS `next_sales`
	  LAG(sales) OVER (ORDER BY month) AS `pre_sales`
	  FROM
	  tb_sales;
	  
	  
	  -- LEAD(字段, [N], [M])：返回分区中当前行后第N行的指定字段的内容，如果没有，默认返回M
	  SELECT *,
	  -- 等效于：LEAD(sales) OVER(ORDER BY month) AS `next_sales`
	  LEAD(sales, 1, NULL) OVER (ORDER BY month) AS `next_sales`
	  FROM
	  tb_sales;
	  
	  -- 示例1：计算每个月销量和上个月销量的差值
	  -- month、sales(当前销量)、pre_sales(上月销量)、difference(当月销量和上月销量的差值）
	  SELECT *,
	  #     lag(sales,1,null) OVER (order by month) as pre_sales,
	  LAG(sales) OVER (ORDER BY month) AS      pre_sales,
	  sales - LAG(sales) OVER (ORDER BY month) diff
	  FROM
	  tb_sales;
	  
	  -- 示例2：计算每个月销量和下一个月销量的差值
	  -- month、sales(当前销量)、next_sales(下月销量)、difference(当月销量和下月销量的差值）
	  SELECT *,
	  #     lead(sales,1,null) OVER (order by month) as pre_sales,
	  LEAD(sales) OVER (ORDER BY month) AS      pre_sales,
	  sales - LEAD(sales) OVER (ORDER BY month) diff
	  FROM
	  tb_sales;
	  ```
	-