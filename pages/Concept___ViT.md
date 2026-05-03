alias:: ViT, Vision Transformer
type:: concept
domain:: [[MOC/Transformer]]
status:: growing
level:: 入门
created:: 2026-05-02
updated:: 2026-05-03

- **一句话定义**
	- ViT 是 Vision Transformer，把图片切成 patch 序列，再用 Transformer 编码图片特征。

- **解决的问题**
	- 将图片转换成模型可处理的视觉 token 序列。
	- 用 Transformer 建模图片 patch 之间的全局关系。

- **核心机制**
	- 图片切成 patch。
	- patch 转成向量。
	- 加入位置信息。
	- Transformer 编码 patch 序列。
	- 输出全局图片特征或 patch 特征。

- **典型流程**
	- 图片。
	- patch 序列。
	- patch embedding。
	- Transformer 编码。
	- 图片向量。

- **项目中怎么用**
	- CLIP 图片编码器常使用 ViT。
	- 图文检索和图文 RAG 中可用于图片向量化。

- **面试表达**
	- ViT 是什么？ #card
		- ViT 把图片切成 patch 序列，把每个 patch 当作类似 token 的输入，再用 Transformer 编码图片特征。

- **常见误区**
	- 误区：Transformer 只能处理文本。
		- ViT 说明图片也可以转成序列后交给 Transformer 处理。

- **相关概念**
	- [[Concept/多模态LLM]]
	- [[Concept/图片编码器]]
	- [[Concept/CLIP]]
	- [[Concept/图文检索]]
	- [[Concept/图文RAG]]

- **来源**
	- [[ViT]]
