type:: source
source-type:: official-docs
author:: OpenAI
url:: https://developers.openai.com/api/docs/guides/code-generation
accessed:: 2026-05-03
created:: 2026-05-03
updated:: 2026-05-03
status:: compiled

- **原始信息**
	- OpenAI Code generation 官方文档，说明 Codex 与代码生成模型、Responses API、IDE、CLI、Web、移动端和 CI/CD 场景之间的关系。

- **核心观点**
	- Codex 是面向软件工程的 coding agent，可用于写代码、审查代码、调试代码和理解代码库。
	- Codex 有多种使用入口，包括 IDE、CLI、Web、移动端以及 CI/CD 中的 SDK。
	- 对 API 内部集成型代码生成，可以使用 OpenAI 的代码能力模型；对现成工程代理工作流，优先使用 Codex。
	- 使用 coding agent 时，提示词应给出代码上下文、目标、约束、验收标准和测试方式。

- **可沉淀的概念**
	- [[Concept/Codex使用指南]]
	- [[Concept/Agent]]

- **已更新页面**
	- [[Concept/Codex使用指南]]
	- [[Question/如何高效使用 Codex 维护代码和知识库]]
	- [[MOC/大模型应用工程]]
	- [[Review/大模型应用工程面试]]

- **待追问问题**
	- 什么时候用 Codex，什么时候直接在 API 中调用 coding model？
	- Codex 在 CI/CD 中应该承担哪些自动化任务？
