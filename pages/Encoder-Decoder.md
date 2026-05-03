alias:: 编码器-解码器
type:: concept
status:: archived

- **迁移说明**
	- 本页面内容已迁移到 [[Concept/Encoder-Decoder]]。
	- 后续请维护 [[Concept/Encoder-Decoder]]；本页仅保留旧笔记和反向链接。
- 代表模型： [[T5]] , [[BART]]
- 编码器块 = [[Self-Attention]] + [[FFN]]
- 解码器块 = [[Masked Self-Attention]] + [[Cross-Attention]] + [[FFN]]
- 注意⚠️：对于 [[Encoder-Decoder]] 架构，解码器块里面多了一个[[Cross-Attention]]，用来将编码器的语义融合进入到解码器的语义当中
