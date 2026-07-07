# uni-app 开发交接说明

## 一、项目位置

uni-app 项目目录：

```text
uni-app-lingshan/
```

该目录是 HBuilderX/uni-app 可接手的移动端工程骨架，使用 Vue 单文件组件与本地 mock 数据。

## 二、页面结构

| 页面 | 路径 | 说明 |
| --- | --- | --- |
| 首页导览 | `pages/guide/index` | AI 数字人、聊天输入、快捷问题 |
| 路线推荐 | `pages/routes/index` | 兴趣筛选、路线列表、路线详情 |
| 景点讲解 | `pages/spots/index` | 景点卡、讲解摘要、演出信息 |
| 行程服务 | `pages/service/index` | 定位、演出、人流、反馈 |
| 我的 | `pages/profile/index` | 偏好、收藏、历史问答、设置 |

## 三、组件建议

正式开发时建议拆分：

1. `components/AvatarStage.vue`
2. `components/ChatInput.vue`
3. `components/RouteCard.vue`
4. `components/SpotCard.vue`
5. `components/DataMetric.vue`
6. `components/StatusBadge.vue`

当前骨架为了便于快速移交，先以页面内结构实现。

## 四、接口替换

本地 mock 后续替换为：

1. `POST /api/v1/guide/chat`
2. `POST /api/v1/guide/voice`
3. `POST /api/v1/routes/recommend`
4. `GET /api/v1/admin/analytics/overview`
5. `GET /api/v1/admin/analytics/sentiment`

接口契约见 `docs/03_api_design.md`。

## 五、交互要求

1. 语音按钮先做 UI 状态，后接入 ASR。
2. 问答返回必须展示知识来源或“来自灵山资料”一类可信提示。
3. 路线推荐必须根据兴趣和时间变化。
4. 弱定位场景要提供“地标确认”兜底入口。
5. 游客端不出现赛题、评分、A5、软件杯等内部词。
