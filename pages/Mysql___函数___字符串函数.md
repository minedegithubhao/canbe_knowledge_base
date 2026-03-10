- `LOWER()`：转换为小写
  collapsed:: true
	- > SELECT LOWER('Hello World!');
- `UPPER()`：转换为大写
	- ```sql
	  SELECT UPPER('Hello World!');
	  ```
- `REVERSE()`：字符串反转
	- ```sql
	   SELECT REVERSE('123456'); --'654321'
	  ```
- `REPEAT()`：多个相同字符串拼接
	- ```sql
	  SELECT REPEAT('象飞田', 3);  --象飞田象飞田象飞田
	  ```
- `CONCAT()`：字符串拼接
	- ```sql
	  SELECT CONCAT('马走日', '象飞田'); -- 输出：马走日象飞田
	  SELECT CONCAT(10.15, '%'); -- 输出：10.15%
	  ```
- `CONCAT_WS()`：指定分隔符拼接字符串
	- ```sql
	  SELECT CONCAT_WS('^_^', '马走日', '象飞田'); -- 输出：马走日^_^象飞田
	  ```
- `REPLACE()`：字符串替换
	- ```sql
	  SELECT REPLACE('赢赢赢士角炮巡河车赢', '赢', '输') -- 输出：输输输士角炮巡河车输
	  ```
- `SUBSTR(str, n, m)`：从 str 字符串的第 n 个字符(注意：n不是下标)往后截取 m 个字符，返回子串；m可省略，表示截取到末尾。
	- ```sql
	  SELECT SUBSTR('五七炮屏风马', 3, 1); -- 输出：炮
	  ```
- `SUBSTRING()`：等同`SUBSTR()`
- `LEFT()`：从左截取n个字符
	- ```sql
	  SELECT LEFT('仙人指路，急进中兵', 4); -- 输出：仙人指路
	  ```
- `RIGHT()`：从右截取n个字符
	- ```sql
	  SELECT RIGHT('仙人指路，急进中兵', 4);  -- 输出： 急进中兵
	  ```
- `CHAR_LENGTH()`： 字符串长度
	- ```sql
	  SELECT CHAR_LENGTH('仙人指路，急进中兵'); -- 输出：9
	  ```
- `LENGTH()`：存储长度，utf8编码格式一个中文占3个字节
	- ```sql
	  SELECT LENGTH('仙人指路，急进中兵'); -- 输出：27
	  SELECT LENGTH('仙人指路,急进中兵'); -- 输出：25，英文逗号和中文长度不一样
	  ```