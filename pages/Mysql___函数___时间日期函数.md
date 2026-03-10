- `NOW()`：获取当前datetime类型的时间
	- ```sql
	  SELECT NOW(); -- 输出：2026-03-09 08:50:37
	  ```
- `CURRENT_DATE()`：获取当前date类型的时间
	- ```sql
	  SELECT CURRENT_DATE(); -- 输出：2026-03-09
	  ```
- `CURRENT_TIME()`：获取当前time类型的时间
	- ```sql
	  SELECT CURRENT_TIME(); -- 输出：08:50:37
	  ```
- `DATE_ADD()`，`DATE_SUB()`计算指定间隔的时间日期
	- ```sql
	  SELECT DATE_ADD('2024-9-27', INTERVAL 90 DAY); -- 2024-12-26
	  SELECT DATE_ADD('2024-9-27', INTERVAL -90 DAY); -- 2024-06-29
	  SELECT DATE_SUB('2024-9-27', INTERVAL 90 DAY);-- 2024-06-29
	  ```
- `DATEDIFF()`计算两个时间日期之间的天数差
	- ```sql
	  SELECT DATEDIFF('2024-03-22 09:00:00', '2018-03-20 07:00:00'); -- 2194
	  ```
- `TIMESTAMPDIFF()`：计算两个时间日期之间的时间差(自定义时间单位)
	- ```sql
	  SELECT TIMESTAMPDIFF(MONTH, '2024-03-22 09:00:00', '2018-03-20 07:00:00'); -- -72
	  SELECT TIMESTAMPDIFF(DAY, '1988-10-24', NOW());
	  ```
- `YEAR()`：获取当前日期中的年份
	- ```sql
	  SELECT YEAR(NOW()); --2026
	  ```
- `MONTH()`：获时间日期中的月份
	- ```sql
	  SELECT MONTH('2024-10-02 09:00'); -- 10
	  ```
- `DAY()`： 获取时间日期中的日
	- ```sql
	  SELECT DAY('2024-10-02 09:00'); -- 2
	  ```
- `HOUR()`：获取时间日期中的时
	- ```sql
	  SELECT HOUR('2024-10-02 09:01:30');--9
	  ```
- `MINUTE()`：获取时间日期中的分
	- ```sql
	  SELECT MINUTE('2024-10-02 09:01:30'); -- 1
	  ```
- `SECOND()`：获取时间日期中的秒
	- ```sql
	  SELECT SECOND('2024-10-02 09:01:30'); -- 30
	  ```
- `WEEKDAY()`：计算时间日期是星期几(0是周一，1是周二，依次类推)'
	- ```sql
	  SELECT WEEKDAY('2024-10-18'); -- 4
	  ```
- `DATE_FORMAT()`：时间格式化，DATE_FORMAT(时间, '转换格式')
	- ```sql
	  SELECT DATE_FORMAT(NOW(),'%Y年%m月%d日 %H时%i分%s秒'); -- 2026年03月09日 09时04分29秒
	  ```
- `STR_TO_DATE()`：字符串转时间
	- ```sql
	  SELECT STR_TO_DATE('2024-10-20 16:01:45', '%Y-%m-%d %H:%i:%s'); -- 2024-10-20 16:01:45
	  ```
- `UNIX_TIMESTAMP()`：时间或字符串转时间戳，以秒为单位
	- ```sql
	  SELECT UNIX_TIMESTAMP(NOW()); 
	  SELECT UNIX_TIMESTAMP('2024-10-20 00:00:00'); -- 1729353600
	  ```
- `FROM_UNIXTIME()`：时间戳转字符串
	- ```sql
	  select FROM_UNIXTIME(1729353600, '%Y-%m-%d %H:%i:%s'); -- 2024-10-20 00:00:00
	  select FROM_UNIXTIME(0, '%Y-%m-%d %H:%i:%s'); -- 东八区「北京时间」
	  ```