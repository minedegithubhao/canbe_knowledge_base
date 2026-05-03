alias:: Streamlit 面试, Streamlit 使用场景
type:: question
domain:: [[MOC/大模型应用工程]]
difficulty:: 低
status:: practicing
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- Streamlit 适合什么场景？

- **标准回答**
	- Streamlit 适合快速构建 Python 数据应用、模型 Demo、RAG 问答页面、评估结果看板和内部工具。它让后端或算法同学不用写复杂前端，也能快速做可交互原型。
	- 它不一定适合复杂生产前端。涉及复杂权限、多页面大型交互、细粒度前端状态管理和高定制 UI 时，通常需要更完整的前端工程方案。

- **回答结构**
	- 先讲定位：Python 交互式应用框架。
	- 再讲适合：Demo、内部工具、数据看板、模型调试。
	- 再讲限制：复杂前端、权限、工程化。
	- 最后结合 LLM 项目：RAG 原型和评估看板。

- **项目追问**
	- Streamlit 在 RAG 项目里怎么用？
		- 可做上传文档、提问、展示检索结果、展示生成答案、对比评估指标的调试页面。

- **关联知识**
	- [[Concept/Streamlit]]
	- [[Concept/LangChain]]
	- [[Concept/RAG]]

- **我的易错点**
	- 不要把 Streamlit 说成通用生产前端替代品。
	- 要讲清楚它的优势是快，限制是复杂工程能力。

- **来源**
	- [[Concept/Streamlit]]
	- [[Streamlit]]
	- [[Source/Streamlit Docs - streamlit run]]
