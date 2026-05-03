alias:: Python方法类型区别, Python classmethod staticmethod 区别
type:: question
domain:: [[MOC/Python]]
difficulty:: 中等
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Python 实例方法、类方法、静态方法有什么区别？

- **标准回答**
	- 实例方法默认接收 self，用来访问或修改实例状态；类方法使用 classmethod，默认接收 cls，用来访问或修改类状态，也常用于替代构造器；静态方法使用 staticmethod，不自动接收 self 或 cls，只是放在类命名空间下的普通函数。
	- 判断方法类型时，核心看它是否需要实例状态、类状态，还是只是和类语义相关的工具逻辑。

- **回答结构**
	- 先分别说明 self、cls 和无自动参数。
	- 再说明适用场景。
	- 补充类属性和实例属性的访问差异。
	- 最后说静态方法不适合操作类状态。

- **项目追问**
	- 什么场景适合类方法？
		- 需要访问类属性，或根据配置、字典、环境变量等创建对象时，可以用类方法做替代构造器。
	- 静态方法一定比模块函数好吗？
		- 不一定。如果逻辑和类关系不强，模块函数更简单。

- **关联知识**
	- [[Concept/Python方法类型]]
	- [[Concept/Python类]]
	- [[Concept/Python装饰器]]

- **我的易错点**
	- 不要说静态方法用于操作类属性。
	- 不要混淆实例属性遮蔽类属性的行为。

- **来源**
	- [[Concept/Python方法类型]]
	- [[Python/类]]
	- [[面向对象编程]]
