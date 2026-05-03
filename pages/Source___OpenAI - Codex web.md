type:: source
source-type:: official-docs
author:: OpenAI
url:: https://developers.openai.com/codex/cloud
accessed:: 2026-05-03
created:: 2026-05-03
updated:: 2026-05-03
status:: compiled

- **原始信息**
	- OpenAI Codex web 官方文档，说明 Codex cloud 的定位、入口和云端任务工作方式。

- **核心观点**
	- Codex 是 OpenAI 的 coding agent，可以读取、修改和运行代码。
	- Codex web 通过云端环境执行任务，适合后台处理代码理解、修复、审查和生成 PR。
	- 使用前需要连接 GitHub，让 Codex 能访问仓库并从任务结果创建 pull request。
	- 云端任务适合并行委派多个明确任务，而不是让一个任务无限扩张。

- **可沉淀的概念**
	- [[Concept/Codex使用指南]]
	- [[Concept/Agent]]

- **已更新页面**
	- [[Concept/Codex使用指南]]
	- [[Question/如何高效使用 Codex 维护代码和知识库]]
	- [[MOC/大模型应用工程]]
	- [[Review/大模型应用工程面试]]

- **待追问问题**
	- Codex web、Codex CLI 和 IDE 扩展分别适合什么工作流？
	- Codex cloud 环境应该如何配置依赖、权限和网络访问？
