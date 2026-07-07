<template>
  <view class="page">
    <view class="topbar">
      <view>
        <text class="title">我的</text>
        <text class="subtitle">偏好、收藏和导览设置</text>
      </view>
      <text class="pill">游客</text>
    </view>

    <view class="card">
      <text class="card-title">游览偏好</text>
      <view class="tag-row">
        <text class="tag">历史文化</text>
        <text class="tag">祈福朝圣</text>
        <text class="tag">慢行路线</text>
      </view>
    </view>

    <view class="card section">
      <text class="card-title">收藏路线</text>
      <text class="body">梵音礼佛文化线、太湖山色轻游线</text>
    </view>

    <view class="card section">
      <text class="card-title">导览设置</text>
      <view class="setting"><text>讲解声音</text><text>温和女声</text></view>
      <view class="setting"><text>讲解速度</text><text>标准</text></view>
      <view class="setting"><text>无障碍字幕</text><text>开启</text></view>
    </view>
  </view>
</template>

<style scoped>
.setting {
  display: flex;
  justify-content: space-between;
  padding: 24rpx 0;
  border-bottom: 1rpx solid rgba(47, 95, 78, .1);
  color: rgba(23, 37, 31, .72);
  font-size: 26rpx;
}

.setting:last-child {
  border-bottom: 0;
}
</style>
