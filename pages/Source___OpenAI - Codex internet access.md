type:: source
source-type:: official-docs
author:: OpenAI
url:: https://developers.openai.com/codex/cloud/internet-access
accessed:: 2026-05-03
created:: 2026-05-03
updated:: 2026-05-03
status:: compiled

- **原始信息**
	- OpenAI Codex cloud 网络访问官方文档，说明云端任务中 agent 阶段的网络访问默认策略和安全风险。

- **核心观点**
	- Codex cloud 的 setup 脚本可以联网安装依赖，但 agent 阶段默认关闭互联网访问。
	- 开启 agent 互联网访问会增加 prompt injection、代码或敏感凭据外泄、恶意依赖、许可证风险等安全问题。
	- 降低风险的做法是只允许必要域名和必要 HTTP 方法，并审查 Codex 的输出和工作日志。
	- 对不可信网页、issue、README 或依赖文档要保持警惕，因为其中可能包含隐藏指令。

- **可沉淀的概念**
	- [[Concept/Codex使用指南]]
	- [[Concept/Agent]]

- **已更新页面**
	- [[Concept/Codex使用指南]]
	- [[Question/如何高效使用 Codex 维护代码和知识库]]
	- [[MOC/大模型应用工程]]
	- [[Review/大模型应用工程面试]]

- **待追问问题**
	- Codex 处理外部 issue、网页和依赖文档时如何防 prompt injection？
	- Codex cloud 环境的网络 allowlist 应该如何设计？
