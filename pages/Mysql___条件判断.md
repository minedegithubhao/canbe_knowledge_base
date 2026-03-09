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