# 后端接口设计

本项目当前只实现前端演示，后端设计为接口契约。建议正式开发时采用 REST + SSE/WebSocket，游客问答使用流式返回，后台管理使用普通 REST。

## 一、认证与用户

### POST /api/v1/auth/session

创建游客匿名会话或管理员登录会话。

请求：

```json
{
  "scene": "lingshan",
  "clientType": "mobile",
  "role": "visitor"
}
```

响应：

```json
{
  "sessionId": "sess_20260705_001",
  "visitorId": "anon_8f21",
  "expiresIn": 7200
}
```

## 二、游客多模态问答

### POST /api/v1/guide/chat

文本问答接口，用于景区知识问答和路线咨询。

请求：

```json
{
  "sessionId": "sess_20260705_001",
  "query": "我对历史文化感兴趣，两个小时怎么游览？",
  "location": {
    "lat": 31.4212,
    "lng": 120.0921,
    "accuracy": 18,
    "fallback": "gps"
  },
  "profile": {
    "interests": ["历史文化", "祈福"],
    "durationMinutes": 120,
    "pace": "normal"
  }
}
```

响应：

```json
{
  "answer": "建议从九龙灌浴开始，随后前往梵宫和灵山大佛，重点讲解佛教文化与建筑艺术。",
  "citations": [
    {
      "docId": "kb_lingshan_guide_001",
      "title": "灵山胜境讲解词",
      "score": 0.91
    }
  ],
  "emotion": "calm",
  "confidence": 0.93,
  "latencyMs": 1680,
  "nextActions": ["生成路线", "开始讲解", "查看拥挤度"]
}
```

### POST /api/v1/guide/voice

语音问答入口。上传音频后返回识别文本、回答、TTS 音频地址与口型驱动数据。

响应字段必须包含：

1. `asrText`：语音识别文本。
2. `answer`：模型回答。
3. `ttsUrl`：语音合成音频地址。
4. `visemeTimeline`：口型同步时间轴。
5. `facialExpression`：表情状态。
6. `latencyMs`：端到端延迟，目标小于 5000ms。

### GET /api/v1/guide/chat/stream

SSE 流式回答接口，事件类型建议包括：

1. `asr.partial`
2. `rag.hit`
3. `llm.delta`
4. `tts.ready`
5. `avatar.viseme`
6. `done`

## 三、路线推荐

### POST /api/v1/routes/recommend

根据兴趣、时间、位置、拥挤度推荐游览路线。

响应：

```json
{
  "routes": [
    {
      "id": "route_culture_120",
      "name": "梵音礼佛文化线",
      "durationMinutes": 120,
      "tags": ["历史文化", "祈福", "建筑"],
      "spots": ["九龙灌浴", "梵宫", "灵山大佛"],
      "reason": "匹配游客历史文化兴趣，并避开当前拥挤点位。",
      "crowdLevel": "medium"
    }
  ]
}
```

### POST /api/v1/location/resolve

弱定位兜底接口。GPS 不稳定时，可结合地标选择、二维码、蓝牙信标、Wi-Fi 指纹或视觉地标。

## 四、知识库管理

### POST /api/v1/admin/kb/documents

上传讲解词、文史资料、FAQ 等文档。

### POST /api/v1/admin/kb/documents/{documentId}/index

触发文档切片、向量化和版本发布。

### GET /api/v1/admin/kb/quality

返回标准测试集通过率、低置信问题、知识命中率。

关键指标：

1. 事实问答准确率目标：不低于 90%。
2. 知识命中率目标：不低于 85%。
3. 低置信回答必须进入复核队列。

## 五、数字人形象管理

### GET /api/v1/admin/avatar/profiles

查询可用形象、服装、声音、语气。

### PUT /api/v1/admin/avatar/profile

更新数字人外观、服装、声音、情绪策略和讲解风格。

## 六、游客感受度与运营大屏

### GET /api/v1/admin/analytics/overview

返回今日/本周服务人次、平均延迟、满意度、热门问答、异常率。

### GET /api/v1/admin/analytics/sentiment

返回游客情绪趋势、关注点聚类和服务建议。

### GET /api/v1/admin/analytics/hot-questions

返回热门问答、未命中问题、建议补充知识。

## 七、模型链路建议

推荐链路：

1. ASR：Whisper 或国产语音识别 API。
2. 语义理解：多模态大模型，支持文本、语音或图像输入。
3. RAG：本地景区知识库 + 向量检索 + 重排序。
4. TTS：ParaTTS 或语音合成 API。
5. 数字人：2D 数字人驱动或 SDK，使用音素/viseme 时间轴做口型同步。
6. 分析：交互日志进入情绪分析和主题聚类，生成管理建议。
