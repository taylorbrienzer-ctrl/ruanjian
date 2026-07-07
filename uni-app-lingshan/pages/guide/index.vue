<template>
  <view class="page">
    <view class="topbar">
      <view>
        <text class="title">灵山导览</text>
        <text class="subtitle">九龙灌浴附近 · 人流适中</text>
      </view>
      <text class="pill">在线</text>
    </view>

    <view class="stage">
      <image class="stage-bg" src="/static/lingshan-hero.png" mode="aspectFill" />
      <view class="avatar">
        <view class="halo"></view>
        <view class="head">
          <view class="hair"></view>
          <view class="eye eye-left"></view>
          <view class="eye eye-right"></view>
          <view class="mouth"></view>
        </view>
        <view class="body-shape"></view>
      </view>
      <view class="voice-card">
        <text>灵小山正在讲解</text>
        <view class="bars">
          <text v-for="bar in 6" :key="bar" class="bar" :style="{ height: `${18 + bar * 5}rpx` }"></text>
        </view>
      </view>
    </view>

    <view class="card section">
      <text class="card-title">今天想怎样游灵山？</text>
      <text class="body">告诉我你的兴趣、游览时间和体力，我会为你推荐路线，并在每个景点切换讲解重点。</text>
      <view class="tag-row">
        <text class="tag" v-for="item in quickQuestions" :key="item" @tap="ask(item)">{{ item }}</text>
      </view>
    </view>

    <view class="chat section">
      <view class="bubble ai">
        <text>建议从九龙灌浴开始，随后前往灵山梵宫和灵山大佛，重点听佛教艺术与太湖视角。</text>
      </view>
      <view class="input-row">
        <button class="mic">语音</button>
        <input v-model="query" placeholder="问问灵小山..." />
        <button class="send" @tap="send">发送</button>
      </view>
    </view>
  </view>
</template>

<script setup>
import { ref } from 'vue'

const query = ref('想看九龙灌浴表演，帮我避开拥挤路线')
const quickQuestions = ['亲子半日', '祈福拍照', '演出时间', '弱定位']

function ask(value) {
  query.value = value
}

function send() {
  uni.showToast({
    title: '已生成导览建议',
    icon: 'none'
  })
}
</script>

<style scoped>
.stage {
  position: relative;
  height: 610rpx;
  overflow: hidden;
  border-radius: 18rpx;
  background: #dfe8dd;
}

.stage-bg {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  opacity: .86;
}

.avatar {
  position: absolute;
  left: 50%;
  bottom: 46rpx;
  width: 300rpx;
  height: 430rpx;
  transform: translateX(-50%);
}

.halo {
  position: absolute;
  left: 18rpx;
  top: 0;
  width: 264rpx;
  height: 264rpx;
  border: 2rpx solid rgba(185, 138, 69, .35);
  border-radius: 50%;
}

.head {
  position: absolute;
  left: 86rpx;
  top: 92rpx;
  width: 128rpx;
  height: 146rpx;
  border-radius: 60rpx 60rpx 54rpx 54rpx;
  background: #f0d2b4;
}

.hair {
  position: absolute;
  left: -8rpx;
  top: -22rpx;
  width: 144rpx;
  height: 78rpx;
  border-radius: 70rpx 70rpx 34rpx 34rpx;
  background: #1f2521;
}

.eye {
  position: absolute;
  top: 76rpx;
  width: 18rpx;
  height: 8rpx;
  border-radius: 999rpx;
  background: #26322c;
}

.eye-left {
  left: 34rpx;
}

.eye-right {
  right: 34rpx;
}

.mouth {
  position: absolute;
  left: 50%;
  top: 108rpx;
  width: 30rpx;
  height: 12rpx;
  border-bottom: 4rpx solid #8b493c;
  border-radius: 0 0 24rpx 24rpx;
  transform: translateX(-50%);
}

.body-shape {
  position: absolute;
  left: 36rpx;
  top: 230rpx;
  width: 228rpx;
  height: 206rpx;
  border-radius: 78rpx 78rpx 20rpx 20rpx;
  background: #3f7461;
}

.voice-card {
  position: absolute;
  left: 28rpx;
  right: 28rpx;
  bottom: 24rpx;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 18rpx 22rpx;
  border-radius: 16rpx;
  color: #fffaf0;
  background: rgba(33, 61, 52, .82);
  font-size: 24rpx;
}

.bars {
  display: flex;
  align-items: flex-end;
  gap: 8rpx;
}

.bar {
  width: 8rpx;
  border-radius: 999rpx;
  background: #e7c680;
}

.chat {
  display: grid;
  gap: 18rpx;
}

.bubble {
  padding: 22rpx;
  border-radius: 18rpx;
  color: rgba(23, 37, 31, .76);
  background: rgba(255, 250, 240, .9);
  font-size: 26rpx;
  line-height: 40rpx;
}

.input-row {
  display: grid;
  grid-template-columns: 108rpx 1fr 108rpx;
  gap: 12rpx;
}

.input-row input,
.mic,
.send {
  height: 78rpx;
  border-radius: 16rpx;
  background: #fffaf0;
  font-size: 24rpx;
}

.input-row input {
  padding: 0 20rpx;
}

.send {
  color: #fffaf0;
  background: #2f5f4e;
}
</style>
