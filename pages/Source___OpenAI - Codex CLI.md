type:: source
source-type:: official-docs
author:: OpenAI
url:: https://developers.openai.com/codex/cli
accessed:: 2026-05-03
created:: 2026-05-03
updated:: 2026-05-03
status:: compiled

- **原始信息**
	- OpenAI Codex CLI 官方文档，说明 Codex CLI 的定位、安装、运行、升级和常见能力入口。

- **核心观点**
	- Codex CLI 是本地终端里的 coding agent，可以在选定目录读取、修改和运行代码。
	- 官方安装方式包括 npm，全局安装命令是 `npm i -g @openai/codex`。
	- 运行 `codex` 后会进入交互式终端界面，首次运行需要登录 ChatGPT 账号或使用 API key。
	- CLI 支持本地代码审查、模型和推理等级切换、图片输入、Web 搜索、云端任务、MCP、审批模式和脚本化执行。
	- 新版本会持续发布，npm 升级命令是 `npm i -g @openai/codex@latest`。

- **可沉淀的概念**
	- [[Concept/Codex使用指南]]
	- [[Concept/Agent]]

- **已更新页面**
	- [[Concept/Codex使用指南]]
	- [[Question/如何高效使用 Codex 维护代码和知识库]]
	- [[MOC/大模型应用工程]]
	- [[Review/大模型应用工程面试]]

- **待追问问题**
	- Codex CLI 的审批模式应该如何选择？
	- 什么任务应该留在本地 CLI，什么任务应该委派到 Codex cloud？
