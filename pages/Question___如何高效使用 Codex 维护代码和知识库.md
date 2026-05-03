alias:: Codex 使用方法, Codex 工作流, 如何使用 Codex, Codex 维护知识库
type:: question
domain:: [[MOC/大模型应用工程]]
difficulty:: 中等
status:: seed
created:: 2026-05-03
updated:: 2026-05-03

- **题目**
	- 如何高效使用 Codex 维护代码库和 Logseq 知识库？

- **标准回答**
	- 把 Codex 当作能读写文件、运行命令、检查结果的 coding agent，而不是只会聊天的代码问答工具。
	- 使用时要给出目标、上下文、边界、约束和验收标准。
	- 对代码库，Codex 应先读相关文件，再小步修改，最后运行测试、格式化或静态检查，并说明剩余风险。
	- 对 Logseq 知识库，Codex 应先读取 AGENTS.md，查重并判断页面类型，再更新 Source、Concept、Project、Question、Review、MOC 或 Mistake，最后做格式和发布风险检查。
	- 人仍要负责审查 diff、确认隐私边界、决定是否合并和发布。

- **回答结构**
	- 定位：Codex 是 coding agent，不只是聊天助手。
	- 输入：给目标、范围、约束、来源和验收标准。
	- 执行：先查重和盘点，再编辑文件或页面。
	- 验证：运行测试、格式检查、发布风险检查。
	- 收口：更新记录、说明变更、列出风险。

- **项目追问**
	- 如果让 Codex 维护当前 Logseq 知识库，应该怎么提要求？
		- 使用固定提示：基于 AGENTS.md 和 logseq-knowledge-refactor 规则，整理目标知识点，先查重，再判断页面类型，保留来源链路，更新相关 MOC 和 Review，最后做格式与发布风险检查。
	- 如果 Codex 要访问外部网页或 issue，有什么风险？
		- 外部内容可能包含隐藏指令或恶意依赖信息；需要限制网络访问、只允许可信来源，并审查输出和工作日志。
	- Codex CLI 和 Codex cloud 怎么选？
		- 本地小步修改、测试和知识库维护优先 CLI；明确的后台代码任务、并行任务和 PR 草稿可以用 cloud。

- **关联知识**
	- [[Concept/Codex使用指南]]
	- [[Concept/Agent]]
	- [[Concept/Prompt Engineering]]
	- [[MOC/大模型应用工程]]

- **我的易错点**
	- 不要只写“帮我整理一下”，要给出范围、规则和验收标准。
	- 不要让 Codex 在没有确认来源和隐私边界时复制 private 内容到公开页面。
	- 不要把所有任务都交给一个巨大 prompt，复杂任务应该拆成小批次。

- **来源**
	- [[Source/OpenAI - Codex CLI]]
	- [[Source/OpenAI - Codex web]]
	- [[Source/OpenAI - Codex internet access]]
	- [[Source/OpenAI - Code generation]]
