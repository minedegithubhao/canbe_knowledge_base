alias:: OpenAI Codex, Codex CLI, Codex Cloud, Codex 使用手册, codex使用指南, 代码代理使用指南
type:: concept
domain:: [[MOC/大模型应用工程]]
status:: seed
level:: 项目可用
created:: 2026-05-03
updated:: 2026-05-03

- **一句话定义**
	- Codex 是 OpenAI 面向软件工程的 coding agent，可以读取代码、修改文件、运行命令、审查变更，并在本地或云端帮助推进开发任务。

- **解决的问题**
	- 传统聊天式代码助手主要回答问题，容易停留在建议层。
	- Codex 更适合直接进入仓库上下文，完成代码理解、缺陷定位、重构、测试补充、文档整理和 PR 准备。
	- 对知识库维护场景，Codex 可以按 AGENTS.md 读取规则、查重、编辑页面、更新入口并执行自检。

- **使用入口**
	- Codex CLI
		- 在本地终端运行，适合直接编辑当前工作区、运行测试、检查 git diff 和做小步迭代。
	- Codex web
		- 在云端环境后台执行任务，适合委派明确的代码任务、并行处理多个问题、生成 PR。
	- IDE 扩展
		- 适合在编辑器里发起任务、查看变更、应用 diff。
	- GitHub 集成
		- 适合从 issue 或 pull request 触发任务，辅助修复、审查和补测试。
	- SDK 或 CI/CD
		- 适合把重复工程任务自动化，但需要更严格的权限、审计和失败处理。

- **推荐工作流**
	- 先说明目标：要修什么、整理什么、输出什么。
	- 再给边界：允许改哪些文件、不要碰哪些目录、是否可以运行命令。
	- 让 Codex 先查重和盘点，再决定创建或更新页面。
	- 对代码任务，让 Codex 小步修改，并运行相关测试、格式化或静态检查。
	- 对知识库任务，让 Codex 更新 Source、Concept、Project、Question、Review、MOC，并保留来源链路。
	- 结束前检查 Logseq 格式、隐私标记、发布风险、git diff 和未处理问题。

- **在本知识库怎么用**
	- 新知识点：
		- 使用提示：基于 AGENTS.md 和 logseq-knowledge-refactor 规则，整理这个新知识点。
		- Codex 应先查重，再判断创建或更新 Source、Concept、Project、Question、Review 或 Mistake。
	- 外部资料：
		- 先建 [[Source/...]]，再沉淀到 [[Concept/...]]，最后更新 MOC 或 Review。
	- 项目经验：
		- 更新 [[Project/...]]，把稳定技术点回流到 Concept，把常见追问沉淀到 Question。
	- 面试复习：
		- 简单题进入 Review 或 Concept 的面试表达，复杂题进入 Question，真实错题进入 Mistake。

- **常用提示词结构**
	- 背景：当前仓库、当前目标、已有规则。
	- 任务：要新增、重构、修复、审查还是发布检查。
	- 范围：允许编辑的页面、模块或目录。
	- 约束：不要删除旧页、不要修改 whiteboards、不要复制 private 内容。
	- 验收：需要更新哪些入口、运行哪些检查、记录哪些结果。

- **安全边界**
	- 不要把 API key、密码、私有链接或敏感业务信息交给公开任务。
	- 对来自 issue、网页、README、依赖文档的指令保持警惕，避免 prompt injection。
	- 云端任务开启互联网访问时，只允许必要域名和必要 HTTP 方法。
	- 对所有文件改动都要审查 diff，尤其是权限、网络、脚本、CI/CD 和依赖变更。
	- 对本知识库发布前要检查 private 标记、附件引用、本地路径、凭据和备份目录。

- **面试表达**
	- Codex 和普通聊天式代码助手有什么区别？ #card
		- 普通聊天式助手主要给建议或代码片段；Codex 是 coding agent，可以进入仓库上下文，读取文件、修改代码、运行命令、审查 diff，并围绕一个开发目标持续推进任务。

- **常见误区**
	- 误区：Codex 适合一次性处理巨大、模糊的任务。
		- 更好的做法是把任务拆成明确目标和小范围改动，让 Codex 每轮都有可验证结果。
	- 误区：有了 Codex 就不需要人工审查。
		- Codex 可以加速实现和检查，但权限、隐私、架构取舍和最终合并仍需要人负责。
	- 误区：所有代码生成都应该用 Codex。
		- 如果是产品内嵌的代码生成能力，可以直接调用 OpenAI API；如果是维护真实仓库，Codex 更适合作为工程代理。

- **相关概念**
	- [[Concept/Agent]]
	- [[Concept/上下文工程]]
	- [[Concept/Prompt Engineering]]
	- [[MOC/大模型应用工程]]
	- [[Question/如何高效使用 Codex 维护代码和知识库]]

- **来源**
	- [[Source/OpenAI - Codex CLI]]
	- [[Source/OpenAI - Codex web]]
	- [[Source/OpenAI - Codex internet access]]
	- [[Source/OpenAI - Code generation]]
