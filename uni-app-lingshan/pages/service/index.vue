<template>
  <view class="page">
    <view class="topbar">
      <view>
        <text class="title">行程服务</text>
        <text class="subtitle">定位、演出、人流和反馈</text>
      </view>
      <text class="pill">定位正常</text>
    </view>

    <view class="service-grid">
      <view class="card">
        <text class="card-title">当前位置</text>
        <text class="body">九龙灌浴广场西侧，GPS 精度约 18 米。</text>
        <view class="tag-row"><text class="tag">可切换地标确认</text></view>
      </view>
      <view class="card">
        <text class="card-title">演出提醒</text>
        <text class="body">下一场九龙灌浴预计 13:30，建议提前 10 分钟到场。</text>
        <view class="tag-row"><text class="tag">已加入行程</text></view>
      </view>
      <view class="card">
        <text class="card-title">人流建议</text>
        <text class="body">梵宫入口当前略拥挤，可先前往菩提大道慢行拍照。</text>
        <view class="tag-row"><text class="tag">错峰推荐</text></view>
      </view>
      <view class="card">
        <text class="card-title">体验反馈</text>
        <text class="body">路线结束后可评价讲解内容、声音和推荐准确度。</text>
        <view class="tag-row"><text class="tag">稍后提醒</text></view>
      </view>
    </view>
  </view>
</template>

<style scoped>
.service-grid {
  display: grid;
  gap: 20rpx;
}
</style>
