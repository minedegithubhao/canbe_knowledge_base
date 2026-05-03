alias:: Mysql/条件判断
type:: concept
status:: archived
updated:: 2026-05-03

- **迁移说明**
	- 本页是旧 MySQL 条件判断笔记，稳定内容已整理到 [[Concept/MySQL 常用函数]]。
	- 后续学习和复习优先维护新页面；本页保留为原始资料和历史上下文。

- 条件判断
	- case ... when
		- ```sql
		  SELECT *,
		  CASE
		       WHEN score >= 90 THEN '优秀'
		       WHEN score >= 80 THEN '良好'
		       WHEN score >= 70 THEN '中等'
		       WHEN score >= 60 THEN '及格'
		   ELSE '不及格'
		   END AS grade
		  FROM
		  tb_score;
		  ```
	- IF(条件, 值1, 值2)：条件成立，IF的结果就是值1，否则结果就是值2
		- ```sql
		  UPDATE product SET price = IF(Price>=3000,Price*0.9,Price*1.2);
		  ```
