alias:: Only-Decoder, 仅解码器, Decoder-only
type:: concept
domain:: [[MOC/Transformer]]
status:: growing
level:: 面试可讲
created:: 2026-05-02
updated:: 2026-05-02

- **一句话定义**
	- Only-Decoder 是以 Transformer Decoder 为主体的模型架构，典型能力是根据已有上下文逐 token 生成后续文本。

- **解决的问题**
	- 适合开放式文本生成、对话、代码生成、推理和工具调用等生成型任务。
	- 通过自回归方式预测下一个 token。

- **核心机制**
	- 使用 [[Concept/Masked Self-Attention]]，让当前位置只能看到之前的 token。
	- 每次根据已有上下文预测下一个 token。
	- 反复采样或选择 token，形成完整输出。

- **典型流程**
	- 输入 prompt。
	- 模型基于已有 token 预测下一个 token。
	- 将新 token 加入上下文。
	- 重复生成直到结束。

- **项目中怎么用**
	- GPT、LLaMA 等对话和生成模型通常采用 Decoder-only 架构。
	- RAG 中最终生成答案的 LLM 通常属于这一类。

- **面试表达**
	- Only-Decoder 为什么适合生成？ #card
		- 它使用 Masked Self-Attention，只能看到当前位置之前的 token，因此天然适合按顺序预测下一个 token，形成自回归生成。

- **常见误区**
	- 误区：Decoder-only 不能理解。
		- 它也能理解上下文，但架构和训练目标更偏生成。

- **相关概念**
	- [[Concept/Masked Self-Attention]]
	- [[Concept/生成型大模型]]
	- [[Concept/RAG]]

- **来源**
	- [[Only-Decoder]]
