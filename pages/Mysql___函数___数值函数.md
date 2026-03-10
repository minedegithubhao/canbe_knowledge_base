- `ROUND(X, n)`：对 X 进行四舍五入，保留 n 位小数，默认n为0
	- ```sql
	  SELECT ROUND(1.333, 2);
	  ```
- `FORMAT(X, n)`：对 X 进行四舍五入，保留 n 位小数，输出格式:##,###,###.###
	- ```sql
	  SELECT FORMAT(1123456.333, 2);
	  ```
- `FLOOR(x)`：向下取整
	- ```sql
	  SELECT FLOOR(1.5)
	  ```
- `CEIL(X)`：向上取整
	- ```sql
	  SELECT CEIL(2.1);
	  ```
- `MOD(X, Y)`：求 X 除以 Y 的余数
	- ```sql
	  SELECT MOD(5, 3);
	  ```
- `POW(X, Y)`：X的Y次方
	- ```sql
	  SELECT POW(10, 2);
	  ```
- `RAND()`：返回一个0-1之间的随机数，包含0，不包含1
	- ```sql
	  SELECT RAND();
	  SELECT RAND(5); -- 5是随机数种子，有了种子 → 随机数固定不变
	  ```