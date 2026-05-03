alias:: Python for循环旧笔记, Python迭代旧笔记
type:: concept
status:: archived
updated:: 2026-05-03

- **迁移说明**
	- 本页面内容已整理到 [[Concept/Python迭代器]] 和 [[Concept/Python生成器]]。
	- 相关面试题已整理到 [[Question/Python 迭代器和生成器有什么区别]]。
	- 后续请维护新页面；本页保留旧 for 循环和推导式示例。

- 字符串遍历
	- ```python
	  # 需求: 遍历一个字符串 :  itheima 
	  for e in "itheima":
	      print(e)
	  ```
- 遍历`range(1,101)`左闭右开，即：不包含101
- `[表达式 for 变量 in 可迭代对象 if 条件]`
- for循环中的else结构，其实就是**循环外判断标记变量的语法糖**
	- ```python
	  nums = [1, 2, 3, 4]
	  for num in nums:
	      if num == 5:
	          print("找到数字 5 了！")
	          break  # 找到后中断循环，else 不会执行
	  else:
	      # 只有循环完整执行（没触发break），才会执行这里
	      print("未找到数字 5")  # 最终输出这行
	  ```
	- ```java
	  public class Main {
	      public static void main(String[] args) {
	          int[] nums = {1, 2, 3, 4};
	          boolean found = false; // 标记：是否找到目标
	          
	          for (int num : nums) {
	              if (num == 5) {
	                  System.out.println("找到数字 5 了！");
	                  found = true;
	                  break; // 中断循环
	              }
	          }
	          
	          // 等价于 Python for...else 中的 else 块
	          if (!found) {
	              System.out.println("未找到数字 5"); // 最终输出这行
	          }
	      }
	  }
	  ```
-
