id:: 69be175f-15a2-43e1-9cb9-467efbd8f9e4
alias::
tags:: Reranker, 精排
type:: 概念
status:: 草稿

	- ## 🧠 一句话说清楚（费曼）
		- **BGE 的优势**：它是一个 **Cross-Encoder（交叉编码器）**。它会把你的“重写问题”和“候选片段”真的放在一起读。比 [[RRF]] （倒数排名融合）更强大的“裁判”。
	- ## 💘企业开发场景
	- **`bge-reranker`**：这是一个**系列名**，代表BGE（BAAI General Embedding）旗下的重排序器（Reranker）模型家族。它本身不是一个具体模型，而是对这类模型的统称
		- **`bge-reranker-base`**：这是该系列的**第一代产品**
		- **`bge-reranker-v2-m3`**：这是该系列**第二代产品**
		- | 特性 | **bge-reranker-base (第一代)** | **bge-reranker-v2-m3 (第二代)** |
		  | ---- | ---- | ---- |
		  | **发布时间** | 2023年9月[](https://paddlenlp.readthedocs.io/zh/latest/website/BAAI/bge-reranker-large/index.html) | 2024年3月[](https://hub.baai.ac.cn/view/35938) |
		  | **基础模型** | `xlm-roberta-base`[](https://www.toolify.ai/ai-model/gpustack-bge-reranker-v2-m3-gguf) | `bge-m3`[](https://www.toolify.ai/ai-model/gpustack-bge-reranker-v2-m3-gguf) |
		  | **参数规模** | 约 278M | 568M[](https://docs.infini-ai.com/gen-studio/data/models/bge-reranker-v2-m3.html) |
		  | **支持语言** | 中英双语[](https://paddlenlp.readthedocs.io/zh/latest/website/BAAI/bge-reranker-large/index.html) | **多语言** (支持100+种语言)[](https://docs.infini-ai.com/gen-studio/data/models/bge-reranker-v2-m3.html) |
		  | **输入长度** | 512 个token | **8192** 个token[](https://paddlenlp.readthedocs.io/zh/latest/website/BAAI/bge-reranker-large/index.html) |
		  | **主要特点** | 轻量、高效，是v1系列的代表作 | 第二代重排序模型，性能更强、支持多语言和超长文本[](https://support.huaweicloud.com/derm-aislt/derm_01.html) |
	- ## 📝 面试题（自问自答）
	  collapsed:: true
		- {{问题一：XXX }}