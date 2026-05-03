# Logseq 知识库维护规则

本仓库是一个 Logseq 知识库。维护时采用 Karpathy LLM-Wiki 思路：原始资料保持可追溯，LLM 将资料持续整理成结构化、可阅读、可复习的 Logseq Wiki。

## 核心原则

- 保留原始资料，不要把 source 内容直接混进 concept 页面。
- 先有 `Source`，再沉淀到 `Concept`，最后更新 `MOC` 或 `Review`。
- 知识页优先服务人类阅读，其次服务 LLM 维护。
- 使用 Logseq block 语法，不使用传统 Markdown 文档结构。
- 不使用 `- ## 标题` 作为区块标题，统一使用 `- **区块名**`。
- 使用双链和属性表达关系，不依赖过深 namespace。
- 普通属性单值、`alias` 多值、多关系放正文区块。
- 避免删除旧内容；重构时优先迁移、合并、标记归档。
- `AGENTS.md` 是 LLM 执行时的唯一标准；`pages/知识库维护规则.md` 是人类阅读摘要。修改核心规则时，必须同步更新这两个文件。

## 页面类型

统一使用以下 `type::` 值：

- `home`：知识库首页。
- `moc`：主题地图，用于导航某个领域。
- `concept`：稳定概念页，用于综合理解。
- `source`：原始资料页，包括文章、论文、视频、课程、图片、项目材料等。
- `project`：项目页，用于项目背景、方案、问题、沉淀。
- `question`：复杂面试题或项目追问题。
- `review`：复习页或刷题题单。
- `mistake`：错题或易错点。

## 命名规则

页面 namespace 使用英文标准分类；页面正文、解释和 alias 使用中文友好表达。页面名使用人最自然会点击的名字，`alias` 用来补齐中英文、全称、简称、常见别名和旧页面名。

统一使用以下英文 namespace：

- `[[MOC/...]]`：主题地图，对应 `type:: moc`。
- `[[Concept/...]]`：稳定概念，对应 `type:: concept`。
- `[[Source/...]]`：原始资料，对应 `type:: source`。
- `[[Project/...]]`：项目沉淀，对应 `type:: project`。
- `[[Question/...]]`：复杂问题或面试追问，对应 `type:: question`。
- `[[Review/...]]`：复习题单，对应 `type:: review`。
- `[[Mistake/...]]`：错题或易错点，对应 `type:: mistake`。

`[[首页]]` 是唯一命名例外，对应 `type:: home`。不要创建 `[[Home/首页]]` 或其他 Home namespace 页面。

命名原则：

- `MOC` 页面中文主题名为主，例如 `[[MOC/大模型]]`、`[[MOC/面试复习]]`。
- `Concept` 页面使用术语自然名称。RAG、LLM、Transformer、Prompt、Token、Embedding 等常用英文术语保留英文；混合检索、文档切分、向量检索等中文更自然的概念使用中文。
- `Source` 页面使用资料标题或可识别的短标题。
- `Source` 命名优先使用 `[[Source/作者或机构 - 短标题]]`，必要时加年份，避免同名资料冲突。
- `Project` 页面使用项目中文名或实际项目名。
- `Question` 页面使用中文问题句。
- `Review` 页面使用中文题单名。

推荐命名：

- `[[首页]]`
- `[[MOC/RAG]]`
- `[[MOC/大模型]]`
- `[[Concept/RAG]]`
- `[[Concept/混合检索]]`
- `[[Source/Karpathy LLM Wiki]]`
- `[[Project/图文知识库]]`
- `[[Question/RAG 为什么还会幻觉]]`
- `[[Review/RAG面试]]`

避免新建过深 namespace，例如：

- `[[大模型/RAG/文本聚类/算法/无监督聚类算法]]`

不要新建中文分类 namespace 页面，例如 `[[地图/RAG]]`、`[[概念/RAG]]`。如果需要承接这些旧名称，放入新页面的 `alias`。

`alias` 使用规则：

- 每个重要 `Concept` 页面尽量补充中文名、英文名、缩写和常见别名。
- 如果旧页面迁移到新页面，将旧页面名加入新页面的 `alias`，方便搜索和去重。
- 不要为同一概念同时创建中文页和英文页；选择一个主页面，其他名称放入 `alias`。
- `alias` 是为了搜索和去重，不是词典；不要塞入大量低频别名。
- 普通属性保持单值；`alias` 是允许多值的例外。
- `related`、`sources`、`questions` 这类多关系不要放属性，放入 `- **相关概念**`、`- **来源**`、`- **关联问题**` 等正文区块。
- `alias` 优先使用 Logseq 页面名和自然语言别名，例如 `大模型/RAG`，不要优先使用文件名形态 `大模型___RAG`。

创建新页面前必须查重：

1. 搜索目标页面名。
2. 搜索中文名、英文名、缩写和常见别名。
3. 搜索现有页面的 `alias`。
4. 搜索旧 namespace，例如 `大模型___RAG`、`大模型/RAG`。
5. 如果已有同义页面，优先更新、迁移或合并，不新建重复页面。

示例：

```markdown
alias:: Retrieval-Augmented Generation, 检索增强生成, 大模型/RAG
type:: concept
```

```markdown
alias:: Hybrid Search, Hybrid Retrieval, 混合召回
type:: concept
```

已有旧页面不要立即删除。若迁移到新结构，旧页面可以保留跳转说明：

```markdown
alias:: 旧页面名

- **迁移说明**
	- 本页面内容已迁移到 [[Concept/新页面名]]。
	- 后续请维护 [[Concept/新页面名]]。
```

不要依赖 `redirect::` 实现自动跳转。Logseq 不会把它当作内置重定向机制；迁移页应使用清晰的 `- **迁移说明**` block 和双链承接。

## 页面属性规则

属性写在页面顶部。普通属性只写一个值；`alias` 允许多个别名。

只有在真正创建或修改页面属性时，才使用 `xxx::` 语法。不要在 Logseq 页面正文中用反引号、列表项或代码块展示 `xxx::` 属性示例，因为 Logseq 仍可能把它解析为属性并报 `Invalid property names`。

如果需要在 Logseq 正文里说明属性写法，使用全角冒号或文字说明，例如：

- `type ：concept`
- `status ：seed`
- `source-type ：article`

不要在 Logseq 正文说明区写成：

- `` `type:: concept` ``
- `` `status:: seed` ``

推荐属性：

```markdown
alias::
type::
domain::
status::
level::
created::
updated::
published::
accessed::
source-type::
author::
url::
```

日期统一使用 `YYYY-MM-DD`。`created` 表示页面创建日期，`updated` 表示页面最后整理日期。`Source` 页面可额外使用 `published` 表示资料发布日期，`accessed` 表示访问日期。

按页面类型使用不同 `status::` 值：

`Source` status：

- `raw`：原始资料未消化。
- `summarized`：已经总结，但尚未沉淀到相关页面。
- `compiled`：已经沉淀到相关 `Concept`、`Project`、`Question` 或 `MOC` 页面。
- `archived`：已归档。

`Source` 状态流转：

- `raw`：只有原始链接、附件、摘录或截图。
- `summarized`：已经完成 `Source` 页面的核心观点总结。
- `compiled`：已经更新相关 `Concept`、`MOC`、`Question` 或 `Project`，并在 `- **已更新页面**` 中记录。
- `archived`：资料不再主动维护，但保留引用。

`Concept` status：

- `seed`：只有初始内容。
- `growing`：正在补充。
- `stable`：结构稳定。
- `review`：需要复习或复查。
- `archived`：已归档。

`Question` status：

- `seed`：题目初建。
- `practicing`：正在练习。
- `weak`：容易答错。
- `mastered`：已掌握。
- `archived`：已归档。

`Review` status：

- `growing`：正在补充题单。
- `active`：当前复习中。
- `paused`：暂时停止。
- `archived`：已归档。

`Project` status：

- `planning`：规划中。
- `active`：进行中。
- `done`：已完成。
- `archived`：已归档。

`Home` status：

- `active`：当前首页。
- `archived`：已归档。

`Mistake` status：

- `weak`：当前薄弱点。
- `practicing`：正在复盘。
- `mastered`：已掌握。
- `archived`：已归档。

推荐 `level::` 值：

- `入门`
- `项目可用`
- `面试可讲`
- `熟练`

## Logseq 格式规则

- 页面正文使用列表 block。
- 区块标题使用 `- **区块名**`。
- 不使用 `#`、`##`、`###` 作为页面内部标题。
- 不使用 `- ## 区块名`。
- 页面正文说明属性时，不直接写 `xxx::`，改用 `xxx ：value` 或文字描述。
- 缩进用 tab 或 Logseq 自动缩进，保持 block 层级清晰。
- 需要链接概念、项目、来源、复习页时使用 `[[wikilink]]`。
- 面试卡片继续使用 Logseq 的 `#card`。

## 隐私和发布规则

- 默认页面可以发布。
- `journals/` 下的日报、日记默认不发布。
- 页面包含 `tags:: private`、`private:: true` 或 `public:: false` 时，不发布。
- 私有内容统一优先使用 `tags:: private`。
- LLM 不主动移除隐私标记。
- LLM 不应把包含隐私标记的内容复制到公开页面，除非用户明确要求并确认可公开。
- 公开页面不要链接 private 页面，因为页面名本身也可能泄露信息。
- 如果公开页面必须引用 private 页面，应将公开页面也标记为 private，或改成不暴露敏感名称的普通描述。
- 发布到 GitHub Pages 前会运行 `scripts/prepare-publish-graph.ps1` 生成 `.publish-graph`。
- 发布脚本默认不包含 `journals/` 和 `whiteboards/`。
- 发布脚本只复制必要的 Logseq 配置，不复制 `logseq/bak`、`logseq/.recycle` 等历史备份或回收站内容。
- 发布脚本会删除 private Markdown 页面，并移除未被公开页面引用的 `assets/` 文件。
- 不要在公开页面引用私有附件；页面从公开改成 private 后，应检查其附件是否仍被其他公开页面引用。

## 图片和图示规则

- 不要把图片、截图、PDF 或附件放进 `pages/`。
- 所有二进制资料统一放入 `assets/`，页面中只保留引用链接。
- 普通来源截图、文章配图、PDF 附件放入 `assets/sources/`。
- 项目相关图片放入 `assets/projects/`。
- 导出的架构图、流程图、概念图放入 `assets/diagrams/`。
- Logseq 白板文件保留在 `whiteboards/`。
- 默认不要创建或修改 `whiteboards/` 下的 `.edn` 文件。
- LLM 可以阅读白板作为参考，但不主动维护白板。
- 只有用户明确要求编辑白板时，才修改 `whiteboards/`。
- Mermaid 图是文本图，直接保留在页面正文中，不需要放入 `assets/`。
- 只有当图能显著降低理解成本时才画图，不为了装饰画图。
- `Concept` 页面可以放核心机制图或结构图。
- `Project` 页面可以放架构图、流程图、模块关系图。
- `MOC` 页面可以放学习路径图。
- `Question` 页面一般不画图，除非题目是复杂项目追问。
- `Source` 页面一般保留资料原图或截图，不主动重画。
- 每张图前后应有文字说明，图不能替代概念解释。

## 证据和冲突处理规则

- `Concept` 页面写综合结论，但重要结论必须能追溯到 `Source`。
- 页面底部 `- **来源**` 保留来源列表。
- 对关键判断、项目经验、易过期信息，应在相关 block 中直接链接来源。
- 不要用新资料直接覆盖旧结论。若不同资料存在冲突，新增 `- **不同说法**` 或 `- **争议点**` 区块说明差异。
- 当前结论需要明确是综合判断，并链接支撑它的来源。
- 对 AI 模型、框架、库版本、价格、政策、法规等容易过期的信息，必须记录资料发布日期或访问日期。
- 不确定、不完整、未验证的信息不要写成确定结论；放入 `- **待验证**` 区块。
- 涉及最新模型、价格、API、法规、政策、版本变化的信息，必须链接来源并记录 `accessed` 日期。

冲突处理示例：

```markdown
- **不同说法**
	- [[Source/A]] 认为主要瓶颈在召回质量。
	- [[Source/B]] 认为主要瓶颈在生成约束。
	- 当前结论：排查 RAG 幻觉时先看召回，再看生成约束。
```

推荐目录：

```text
assets/
  sources/
  projects/
  diagrams/
whiteboards/
```

推荐引用方式：

```markdown
- **资料截图**
	- ![karpathy-llm-wiki](../assets/sources/karpathy-llm-wiki/original-screenshot-01.png)
```

Mermaid 示例：

````markdown
- **流程图**
	- ```mermaid
	  flowchart LR
	    Query[用户问题] --> Retrieve[检索]
	    Retrieve --> Rerank[重排序]
	    Rerank --> Prompt[构建 Prompt]
	    Prompt --> LLM[大模型生成]
	  ```
````

正确格式：

```markdown
- **一句话定义**
	- RAG 是一种检索增强生成架构。

- **面试表达**
	- 什么是 RAG？ #card
		- RAG 是一种先检索、再生成的大模型应用架构。
```

避免格式：

```markdown
- ## 一句话定义
	- RAG 是一种检索增强生成架构。
```

## 日常维护流程

- 新增外部资料时，先建或更新 `Source` 页面，记录资料来源、访问日期、核心观点和已更新页面。
- 从资料中抽取稳定知识时，更新对应 `Concept` 页面，并在 `- **来源**` 中保留来源链路。
- 从项目实践中得到的背景、流程、问题、指标和取舍，更新到 `Project` 页面，不塞进 `Concept` 的正文。
- 面试复习新增内容时，先判断是短卡片还是复杂题。
- 短定义题放入对应 `Review` 或 `Concept` 的 `- **面试表达**`。
- 复杂追问、项目题、容易混淆的题，创建或更新 `Question` 页面。
- 真实答错、反复混淆或复盘过的问题，创建或更新 `Mistake` 页面，并链接对应 `Question` 和 `Concept`。
- 每次维护结束，至少更新相关 `MOC`、`Review` 和 `updated` 日期。
- 每周或每个主题批次结束后，检查 [[首页]]、[[MOC/面试复习]] 和相关主题 MOC 是否仍然好扫。
- 发布到 GitHub Pages 前，检查 private 标记、公开页面是否链接 private 页面、本地路径、内网地址、凭据、未引用附件和 `pages/` 下二进制文件。
- 不把维护流程变成大重构。能小步更新时，优先小步更新；只有同一主题出现大量重复、旧 namespace 或面试链路断裂时，才启动主题重构。

## Concept 页面模板

```markdown
alias::
type:: concept
domain::
status:: seed
level::
created::
updated::

- **一句话定义**
	-

- **解决的问题**
	-

- **核心机制**
	-

- **典型流程**
	-

- **项目中怎么用**
	-

- **面试表达**
	-

- **常见误区**
	-

- **相关概念**
	-

- **来源**
	-
```

维护要求：

- `Concept` 页面写综合理解，不写单篇资料的流水账。
- 如果内容来自某个资料，必须在 `- **来源**` 中链接对应 `Source`。
- 短定义题可以放在 `- **面试表达**` 下并标记 `#card`。
- 复杂追问题应拆到 `Question` 页面。
- 不为填满模板而编造内容；未知内容留空或放入 `- **待验证**`。

## Home 页面模板

```markdown
type:: home
status:: active
updated::

- **主要入口**
	-

- **当前重点**
	-

- **待整理**
	-

- **最近更新**
	-

- **复习入口**
	-

- **维护规则**
	- [[知识库维护规则]]
```

维护要求：

- `Home` 是知识库总入口，不写具体知识解释。
- `Home` 应链接重要 `MOC`、`Project`、`Review` 和维护规则。
- `Home` 保持短，不要变成大杂烩。

## Source 页面模板

```markdown
type:: source
source-type::
author::
url::
published::
accessed::
created::
updated::
status:: raw

- **原始信息**
	-

- **核心观点**
	-

- **可沉淀的概念**
	-

- **已更新页面**
	-

- **待追问问题**
	-
```

维护要求：

- `Source` 页面描述某个具体资料说了什么。
- 不把多个资料混成一个 `Source` 页面。
- 从 `Source` 页面抽取的稳定知识，应更新到相关 `Concept` 页面。
- 更新完成后，同步 `status` 和 `- **已更新页面**`。
- `Source` 页面只记录单个资料，不写跨资料综合结论。
- 资料标题过长时，使用作者或机构加短标题命名，例如 `[[Source/Karpathy - LLM Wiki]]`。

## MOC 页面模板

```markdown
type:: moc
domain::
status:: growing
updated::

- **学习路径**
	-

- **核心概念**
	-

- **项目实战**
	-

- **面试重点**
	-

- **最近更新**
	-

- **尚未整理**
	-
```

维护要求：

- `MOC` 是导航页，只放入口、路径、索引和少量说明。
- `MOC` 应链接重要 `Concept`、`Project`、`Review` 页面。
- 如果一个 `MOC` 页面中超过约 30% 是解释性内容，应迁移到对应 `Concept` 页面。

## Project 页面模板

```markdown
alias::
type:: project
domain::
status:: planning
created::
updated::

- **项目目标**
	-

- **背景资料**
	-

- **系统架构**
	-

- **核心流程**
	-

- **关键模块**
	-

- **问题记录**
	-

- **经验沉淀**
	-

- **相关概念**
	-

- **来源**
	-
```

维护要求：

- `Project` 页面沉淀项目上下文、方案、取舍和复盘。
- 项目中产生的稳定知识应回流到相关 `Concept`。
- 项目中常被问到的问题应沉淀为 `Question`。

## Question 页面模板

```markdown
alias::
type:: question
domain::
difficulty::
status:: seed
created::
updated::

- **题目**
	-

- **标准回答**
	-

- **回答结构**
	-

- **项目追问**
	-

- **关联知识**
	-

- **我的易错点**
	-

- **来源**
	-
```

维护要求：

- 简单定义题放在 `Concept` 页即可。
- 复杂题、项目题、易错题、追问题创建 `Question` 页。
- `Question` 页必须链接相关 `Concept` 页。
- `Question` 记录可复用的面试题、项目追问或练习题。

## Review 页面模板

```markdown
type:: review
domain::
status:: growing
updated::

- **今日复习**
	-

- **高频必会**
	-

- **项目追问**
	-

- **易错题**
	-

- **关联概念**
	-
```

维护要求：

- `Review` 页面用于刷题和复习，不承载概念解释。
- 题目链接到 `Question` 页面或含 `#card` 的 block。
- 面试复习入口应优先链接 `Review` 页面。

## Mistake 页面模板

```markdown
alias::
type:: mistake
domain::
status:: weak
created::
updated::

- **错误题目**
	-

- **我的错误答案**
	-

- **正确答案**
	-

- **错因分析**
	-

- **关联概念**
	-

- **复习计划**
	-

- **来源**
	-
```

维护要求：

- `Mistake` 页面记录真实错题和易错点，不记录普通知识点。
- 错因必须链接回相关 `Concept` 或 `Question`。
- 已经掌握后可以将 `status:: weak` 改为 `status:: mastered`。

## 新资料整理流程

处理新文章、论文、视频、课程、图片或项目材料时，按以下流程：

1. 创建或更新对应 `Source` 页面。
2. 总结资料的核心观点。
3. 判断需要创建或更新哪些 `Concept`、`Project`、`Question`、`MOC` 页面。
4. 将稳定知识写入 `Concept` 页面。
5. 将复杂面试题或项目追问写入 `Question` 页面。
6. 更新相关 `MOC` 或 `Review` 页面。
7. 在当天 journal 中记录 ingestion log。

日常输入流程：

- 零散想法、临时摘录、待办先放当天 journal。
- 外部资料进入知识库时创建 `Source`。
- 稳定知识沉淀到 `Concept`。
- 项目经验沉淀到 `Project`。
- 复杂面试题、追问和易错题沉淀到 `Question` 或 `Mistake`。
- 不要把 journal 当成长期知识页；定期把有价值 block 迁移到对应页面。

journal 记录示例：

```markdown
- Ingested [[Source/Karpathy LLM Wiki]]
	- Created [[Concept/LLM Wiki]]
	- Updated [[Concept/RAG]]
	- Updated [[MOC/知识管理]]
```

## 重构旧页面流程

处理旧页面时，按以下流程：

1. 判断旧页面属于 `concept`、`source`、`project`、`question`、`review` 还是应归档。
2. 若页面内容完整，迁移为对应新模板。
3. 若页面过细或重复，合并到更合适的 `Concept` 页面。
4. 若页面为空或价值较低，标记 `status:: archived`。
5. 不要直接删除旧页面，除非用户明确要求。
6. 迁移后在旧页面保留链接或说明，方便 Logseq 双链不失效。

批量重构保护：

- 每次优先只重构一个主题，例如只处理 RAG 或只处理 Transformer。
- 涉及超过 10 个页面的重命名、合并、迁移、归档，必须先列迁移计划并等待用户确认。
- 迁移计划应包含：旧页面、新页面、处理方式、是否保留迁移说明。
- 不批量删除页面。
- 不修改 `journals/` 中的历史记录，除非用户明确要求。

## 修改后自检

完成规则维护、页面迁移或新页面创建后，至少做以下检查：

- 检查新增或修改的页面是否有正确的 `type`、`status`、`updated`。
- 检查是否违反 `- ## 区块名` 规则。
- 检查是否在 Logseq 页面正文中误写了属性示例 `xxx::`。
- 检查新建页面前是否已查重，避免重复概念页。
- 检查关键结论是否有 `Source` 支撑。
- 检查是否误改 `whiteboards/` 或 `journals/`。
- 检查是否移除了 `tags:: private`、`private:: true` 或 `public:: false`。
- 自检优先针对本次新增或修改的页面。全库扫描可能发现历史遗留问题，不要把无关旧页面作为当前任务阻塞项，也不要顺手批量修复无关旧页面。

建议命令：

```sh
git status --short
rg -n -- '- ##' <本次修改的页面文件>
rg -n '::' 'pages/知识库维护规则.md'
```

## 面试题维护规则

- 短定义题放在 `Concept` 页的 `- **面试表达**` 中，并使用 `#card`。
- 复杂题、项目题、易错题放入 `Question` 页。
- 真实答错、做错或反复混淆的内容放入 `Mistake`，并链接对应 `Question` 或 `Concept`。
- 刷题入口放入 `Review` 页。
- 总入口放入 `[[MOC/面试复习]]`。

推荐结构：

```markdown
[[MOC/面试复习]]
[[Review/RAG面试]]
[[Question/RAG 为什么还会幻觉]]
[[Concept/RAG]]
```

## 质量标准

整理后的页面应满足：

- 人打开页面能快速知道这个知识点是什么。
- 页面能解释它解决什么问题、怎么工作、项目中怎么用。
- 重要结论能追溯到 `Source`。
- 面试内容能直接用于复习。
- 页面链接到相关概念，而不是孤立存在。
- 格式稳定，LLM 下次能继续维护。
