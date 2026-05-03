alias:: Streamlit应用, Streamlit 原型
type:: concept
domain:: [[MOC/大模型应用工程]]
status:: seed
level:: 入门
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- Streamlit 是面向 Python 的交互式 Web 应用框架，常用于快速构建数据应用、模型 Demo 和 LLM 原型界面。

- **解决的问题**
	- 不写复杂前端代码，也能快速做输入框、按钮、文件上传、图表和结果展示。
	- 让算法、RAG、Agent、数据分析原型可以被非开发同事试用。

- **核心机制**
	- Python 脚本按页面状态重新执行。
	- 用 Streamlit 组件声明 UI。
	- 用 session state 保存必要交互状态。
	- 用 `streamlit run` 启动本地应用。

- **典型流程**
	- 新建应用脚本。
	- 编写输入组件和展示组件。
	- 调用后端函数、模型链或 RAG 服务。
	- 用 `streamlit run` 启动并调试。

- **项目中怎么用**
	- LLM 学习阶段可用 Streamlit 做聊天机器人、RAG 问答、评估集检查和结果对比界面。
	- 面试表达中要说明它适合原型、调试和内部工具，不一定适合复杂前端产品。

- **面试表达**
	- Streamlit 适合什么场景？ #card
		- Streamlit 适合快速做 Python 数据应用和 LLM Demo，比如 RAG 问答页面、评估结果看板和模型对比工具。它优势是开发快，限制是复杂交互、多人权限和大型前端工程能力较弱。

- **常见误区**
	- 误区：Streamlit 等于生产前端框架。
		- 它更适合原型、内部工具和数据应用；复杂产品前端通常仍需要专门的前端工程。
	- 误区：只要能跑页面就算工程完成。
		- LLM 应用还要考虑配置、鉴权、日志、异常、成本和评估。

- **相关概念**
	- [[Concept/LangChain]]
	- [[Concept/LCEL]]
	- [[Concept/RAG]]
	- [[Concept/Agent]]

- **来源**
	- [[Streamlit]]
	- [[简易聊天机器人]]
	- [[Source/Streamlit Docs - streamlit run]]
